//------------------------------------------------------------------------------
// instruction_fetch.v
// Converted 1:1 from instruction_fetch.vhd (entity instruction_fetch, arch rtl)
//------------------------------------------------------------------------------
`include "constants_pkg.vh"

module instruction_fetch
  #(
    parameter REGISTER_SIZE          = 32,
    parameter RESET_VECTOR           = 32'h00000000,
    parameter MAX_IFETCHES_IN_FLIGHT = 1,
    parameter BTB_ENTRIES            = 0
    )
  (
   input  wire                       clk,
   input  wire                       reset,

   input  wire                       pause_ifetch,

   input  wire [REGISTER_SIZE-1:0]   to_pc_correction_data,
   input  wire [REGISTER_SIZE-1:0]   to_pc_correction_source_pc,
   input  wire                       to_pc_correction_valid,
   input  wire                       to_pc_correction_predictable,
   output wire                       from_pc_correction_ready,

   //quash_ifetch is handled by to_pc_correction_valid
   output wire                       ifetch_idle,

   output wire [31:0]                from_ifetch_instruction,
   output wire [REGISTER_SIZE-1:0]   from_ifetch_program_counter,
   output wire [REGISTER_SIZE-1:0]   from_ifetch_predicted_pc,
   output wire                       from_ifetch_valid,
   input  wire                       to_ifetch_ready,

   output reg  [REGISTER_SIZE-1:0]   program_counter,

   //ORCA-internal memory-mapped master
   output wire [REGISTER_SIZE-1:0]   oimm_address,
   output wire                       oimm_requestvalid,
   input  wire [31:0]                oimm_readdata,
   input  wire                       oimm_readdatavalid,
   input  wire                       oimm_waitrequest
   );

  //Could get promoted to top level
  localparam FIFO_BYPASS             = 1;  //boolean true
  localparam BREAK_CHAIN_FROM_DECODE = (MAX_IFETCHES_IN_FLIGHT > 2);

  localparam USEDW_WIDTH = `log2(MAX_IFETCHES_IN_FLIGHT+1);

  wire                              ready_for_next_fetch;
  reg                               waiting_for_not_waitrequest;

  wire [REGISTER_SIZE-1:0]          predicted_program_counter;

  wire                              pc_instruction_fifo_reset;
  wire                              pc_fifo_can_accept_data;

  wire                              pc_fifo_write;
  wire [(2*REGISTER_SIZE)-1:0]      pc_fifo_writedata;
  wire [(2*REGISTER_SIZE)-1:0]      pc_fifo_readdata;
  wire                              pc_fifo_read;
  wire                              pc_fifo_empty;
  wire                              pc_fifo_full;
  reg  [USEDW_WIDTH-1:0]            pc_fifo_usedw;

  wire [USEDW_WIDTH-1:0]            next_pc_fifo_usedw;
  wire [USEDW_WIDTH-1:0]            next_instruction_fifo_usedw;
  reg  [USEDW_WIDTH-1:0]            fetches_to_quash;
  wire                              quashing_readdata;

  wire                              instruction_fifo_write;
  wire                              instruction_fifo_read;
  wire                              instruction_fifo_empty;
  wire                              instruction_fifo_full;
  wire [31:0]                       instruction_fifo_writedata;
  wire [31:0]                       instruction_fifo_readdata;
  reg  [USEDW_WIDTH-1:0]            instruction_fifo_usedw;

  wire                              ifetch_valid;

  //Stage is idle when there are no instruction being fetched (either waiting
  //for waitrequest to go low or readdatavalid to be returned) and no
  //instructions waiting to be dispatched.
  assign ifetch_idle = (~waiting_for_not_waitrequest) & (~quashing_readdata) & pc_fifo_empty;

  generate
    //No branch predictor; assume PC+4
    if (BTB_ENTRIES == 0) begin : no_btb_gen
      assign predicted_program_counter = program_counter + 32'd4;
    end
    //Branch predictor.  On a branch/jump update BTB ways; don't predict PC
    //updates from other sources as they have side-effects.
    if (BTB_ENTRIES > 0) begin : btb_gen
      localparam BTB_TAG_WIDTH        = (REGISTER_SIZE-`log2(BTB_ENTRIES))-2;
      localparam BTB_PREDICTION_WIDTH = REGISTER_SIZE-2;

      wire                            btb_update;
      reg [BTB_TAG_WIDTH-1:0]         btb_tag [BTB_ENTRIES-1:0];
      reg [BTB_PREDICTION_WIDTH-1:0]  btb_prediction [BTB_ENTRIES-1:0];
      reg [BTB_ENTRIES-1:0]           btb_valid;

      wire                            btb_prediction_valid;
      wire [REGISTER_SIZE-1:0]        btb_prediction_pc;
      wire [BTB_TAG_WIDTH-1:0]        btb_prediction_tag;
      wire                            btb_prediction_tag_match;

      assign btb_update = to_pc_correction_valid & to_pc_correction_predictable;

      if (BTB_ENTRIES == 1) begin : one_entry_gen
        always @(posedge clk or posedge reset) begin
          if (reset == 1'b1) begin
            btb_valid <= {BTB_ENTRIES{1'b0}};
          end else begin
            if (btb_update == 1'b1) begin
              btb_valid[0]      <= 1'b1;
              btb_prediction[0] <= to_pc_correction_data[REGISTER_SIZE-1:2];
              btb_tag[0]        <= to_pc_correction_source_pc[REGISTER_SIZE-1:2];
            end
          end
        end
        assign btb_prediction_valid = btb_valid[0];
        assign btb_prediction_pc    = {btb_prediction[0], 2'b00};
        assign btb_prediction_tag   = btb_tag[0];
      end
      if (BTB_ENTRIES > 1) begin : multiple_entries_gen
        wire [`log2(BTB_ENTRIES)-1:0] btb_read_entry_select;
        wire [`log2(BTB_ENTRIES)-1:0] btb_write_entry_select;

        assign btb_read_entry_select  = program_counter[`log2(BTB_ENTRIES)+1:2];
        assign btb_write_entry_select = to_pc_correction_source_pc[`log2(BTB_ENTRIES)+1:2];
        always @(posedge clk or posedge reset) begin
          if (reset == 1'b1) begin
            //For large rams we may want to change this; for now since the BTB
            //is asynchronous read we can assume it will be small (implemented
            //in LUTs or distributed RAMs) and so having a reset vector is OK.
            btb_valid <= {BTB_ENTRIES{1'b0}};
          end else begin
            if (btb_update == 1'b1) begin
              btb_valid[btb_write_entry_select] <= 1'b1;
              btb_prediction[btb_write_entry_select] <=
                to_pc_correction_data[REGISTER_SIZE-1:2];
              btb_tag[btb_write_entry_select] <=
                to_pc_correction_source_pc[REGISTER_SIZE-1:`log2(BTB_ENTRIES)+2];
            end
          end
        end
        assign btb_prediction_valid = btb_valid[btb_read_entry_select];
        assign btb_prediction_pc    = {btb_prediction[btb_read_entry_select], 2'b00};
        assign btb_prediction_tag   = btb_tag[btb_read_entry_select];
      end
      assign btb_prediction_tag_match =
        (btb_prediction_tag == program_counter[REGISTER_SIZE-1:`log2(BTB_ENTRIES)+2]) ? 1'b1 : 1'b0;

      assign predicted_program_counter =
        ((btb_prediction_valid == 1'b1) && (btb_prediction_tag_match == 1'b1)) ?
        btb_prediction_pc :
        (program_counter + 32'd4);
    end
  endgenerate

  //When a PC correction is requested, hold it until the current instruction
  //request has issued in case it's stalled (not waiting_for_not_waitrequest)
  assign from_pc_correction_ready = (~waiting_for_not_waitrequest) | (~oimm_waitrequest);
  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      program_counter  <= RESET_VECTOR;  // RESET_VECTOR(REGISTER_SIZE-1 downto 0)
      fetches_to_quash <= {USEDW_WIDTH{1'b0}};
    end else begin
      if ((oimm_readdatavalid == 1'b1) && (quashing_readdata == 1'b1)) begin
        fetches_to_quash <= fetches_to_quash - 1'b1;
      end

      if ((to_pc_correction_valid == 1'b1) && (from_pc_correction_ready == 1'b1)) begin
        program_counter  <= to_pc_correction_data;
        fetches_to_quash <= next_pc_fifo_usedw - next_instruction_fifo_usedw;
      end else if ((oimm_requestvalid == 1'b1) && (oimm_waitrequest == 1'b0)) begin
        program_counter <= predicted_program_counter;
      end
    end
  end
  assign quashing_readdata = (fetches_to_quash != {USEDW_WIDTH{1'b0}}) ? 1'b1 : 1'b0;

  //Don't fetch when updating the PC, no more instructions can fit in the
  //instruction FIFO, or an interrupt is pending
  assign ready_for_next_fetch = (~reset) &
                                (~to_pc_correction_valid) &
                                pc_fifo_can_accept_data &
                                (~pause_ifetch);

  assign oimm_requestvalid = waiting_for_not_waitrequest | ready_for_next_fetch;
  assign oimm_address      = program_counter;

  //Per spec must hold the request valid once initiated
  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      waiting_for_not_waitrequest <= 1'b0;
    end else begin
      if (oimm_waitrequest == 1'b0) begin
        waiting_for_not_waitrequest <= 1'b0;
      end else begin
        if (oimm_requestvalid == 1'b1) begin
          waiting_for_not_waitrequest <= 1'b1;
        end
      end
    end
  end

  //Store returned instructions and their corresponding PC's
  assign pc_fifo_write              = oimm_requestvalid & (~oimm_waitrequest);
  assign pc_fifo_writedata          = {predicted_program_counter, program_counter};
  assign pc_fifo_read               = ifetch_valid & to_ifetch_ready;
  assign instruction_fifo_writedata = oimm_readdata;

  //If the PC FIFO can accept data.
  assign pc_fifo_can_accept_data = (BREAK_CHAIN_FROM_DECODE != 0) ? (~pc_fifo_full) :
                                   ((~pc_fifo_full) | pc_fifo_read);

  //On PC correction flush the PC and instruction FIFOs.
  assign pc_instruction_fifo_reset = to_pc_correction_valid & from_pc_correction_ready;

  //Need to calculate 'next' usedw values for tracking instruction fetches in
  //flight on a mispredict correction
  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      pc_fifo_usedw          <= {USEDW_WIDTH{1'b0}};
      instruction_fifo_usedw <= {USEDW_WIDTH{1'b0}};
    end else begin
      if (pc_instruction_fifo_reset == 1'b1) begin
        pc_fifo_usedw          <= {USEDW_WIDTH{1'b0}};
        instruction_fifo_usedw <= {USEDW_WIDTH{1'b0}};
      end else begin
        pc_fifo_usedw          <= next_pc_fifo_usedw;
        instruction_fifo_usedw <= next_instruction_fifo_usedw;
      end
    end
  end

  generate
    //Single request in flight/single entry instruction FIFO
    if (MAX_IFETCHES_IN_FLIGHT == 1) begin : single_fetch_in_flight
      reg [(2*REGISTER_SIZE)-1:0] pc_fifo_readdata_reg;
      reg [31:0]                  instruction_fifo_readdata_reg;

      assign pc_fifo_readdata          = pc_fifo_readdata_reg;
      assign instruction_fifo_readdata = instruction_fifo_readdata_reg;

      assign pc_fifo_empty          = ~pc_fifo_full;
      assign instruction_fifo_empty = ~instruction_fifo_full;
      assign pc_fifo_full           = pc_fifo_usedw[0];
      assign instruction_fifo_full  = instruction_fifo_usedw[0];
      //Note: value 1 written without replication since USEDW_WIDTH-1 can be 0
      assign next_pc_fifo_usedw =
        (pc_fifo_write == 1'b1) ? 1'b1 :
        (pc_fifo_read == 1'b1)  ? {USEDW_WIDTH{1'b0}} :
        pc_fifo_usedw;
      assign next_instruction_fifo_usedw =
        (instruction_fifo_write == 1'b1) ? 1'b1 :
        (instruction_fifo_read == 1'b1)  ? {USEDW_WIDTH{1'b0}} :
        instruction_fifo_usedw;

      always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
          pc_fifo_readdata_reg          <= {(2*REGISTER_SIZE){1'b0}};
          instruction_fifo_readdata_reg <= 32'h00000000;
        end else begin
          if (pc_fifo_write == 1'b1) begin
            pc_fifo_readdata_reg <= pc_fifo_writedata;
          end
          if (instruction_fifo_write == 1'b1) begin
            instruction_fifo_readdata_reg <= instruction_fifo_writedata;
          end
        end
      end
    end

    //Dual request in flight/dual entry instruction FIFO
    if (MAX_IFETCHES_IN_FLIGHT == 2) begin : dual_fetches_in_flight
      reg [(2*REGISTER_SIZE)-1:0] pc_fifo_internaldata;
      reg [31:0]                  instruction_fifo_internaldata;
      reg [(2*REGISTER_SIZE)-1:0] pc_fifo_readdata_reg;
      reg [31:0]                  instruction_fifo_readdata_reg;
      reg                         pc_fifo_empty_reg;
      reg                         pc_fifo_full_reg;
      reg                         instruction_fifo_empty_reg;
      reg                         instruction_fifo_full_reg;

      assign pc_fifo_readdata          = pc_fifo_readdata_reg;
      assign instruction_fifo_readdata = instruction_fifo_readdata_reg;
      assign pc_fifo_empty             = pc_fifo_empty_reg;
      assign pc_fifo_full              = pc_fifo_full_reg;
      assign instruction_fifo_empty    = instruction_fifo_empty_reg;
      assign instruction_fifo_full     = instruction_fifo_full_reg;

      assign next_pc_fifo_usedw =
        ((pc_fifo_write == 1'b1) && (pc_fifo_read == 1'b0)) ? (pc_fifo_usedw + 1'b1) :
        ((pc_fifo_write == 1'b0) && (pc_fifo_read == 1'b1)) ? (pc_fifo_usedw - 1'b1) :
        pc_fifo_usedw;
      assign next_instruction_fifo_usedw =
        ((instruction_fifo_write == 1'b1) && (instruction_fifo_read == 1'b0)) ?
        (instruction_fifo_usedw + 1'b1) :
        ((instruction_fifo_write == 1'b0) && (instruction_fifo_read == 1'b1)) ?
        (instruction_fifo_usedw - 1'b1) :
        instruction_fifo_usedw;

      always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
          pc_fifo_empty_reg          <= 1'b1;
          pc_fifo_full_reg           <= 1'b0;
          instruction_fifo_empty_reg <= 1'b1;
          instruction_fifo_full_reg  <= 1'b0;
        end else begin
          if (pc_instruction_fifo_reset == 1'b1) begin
            pc_fifo_empty_reg          <= 1'b1;
            pc_fifo_full_reg           <= 1'b0;
            instruction_fifo_empty_reg <= 1'b1;
            instruction_fifo_full_reg  <= 1'b0;
          end else begin
            if (pc_fifo_write == 1'b1) begin
              pc_fifo_empty_reg    <= 1'b0;
              pc_fifo_internaldata <= pc_fifo_writedata;
              if (pc_fifo_read == 1'b1) begin
                if (pc_fifo_full_reg == 1'b1) begin
                  pc_fifo_readdata_reg <= pc_fifo_internaldata;
                end else begin
                  pc_fifo_readdata_reg <= pc_fifo_writedata;
                end
              end else begin
                if (pc_fifo_empty_reg == 1'b1) begin
                  pc_fifo_readdata_reg <= pc_fifo_writedata;
                end
                pc_fifo_full_reg <= ~pc_fifo_empty_reg;
              end
            end else if (pc_fifo_read == 1'b1) begin
              pc_fifo_full_reg     <= 1'b0;
              pc_fifo_readdata_reg <= pc_fifo_internaldata;
              pc_fifo_empty_reg    <= ~pc_fifo_full_reg;
            end

            if (instruction_fifo_write == 1'b1) begin
              instruction_fifo_empty_reg    <= 1'b0;
              instruction_fifo_internaldata <= instruction_fifo_writedata;
              if (instruction_fifo_read == 1'b1) begin
                if (instruction_fifo_full_reg == 1'b1) begin
                  instruction_fifo_readdata_reg <= instruction_fifo_internaldata;
                end else begin
                  instruction_fifo_readdata_reg <= instruction_fifo_writedata;
                end
              end else begin
                instruction_fifo_full_reg <= ~instruction_fifo_empty_reg;
                if (instruction_fifo_empty_reg == 1'b1) begin
                  instruction_fifo_readdata_reg <= instruction_fifo_writedata;
                end
              end
            end else if (instruction_fifo_read == 1'b1) begin
              instruction_fifo_full_reg     <= 1'b0;
              instruction_fifo_readdata_reg <= instruction_fifo_internaldata;
              instruction_fifo_empty_reg    <= ~instruction_fifo_full_reg;
            end
          end
        end
      end
    end

    //Multiple request in flight/multiple entry instruction FIFO using LUTs.
    if (MAX_IFETCHES_IN_FLIGHT > 2) begin : a_few_fetches_in_flight
      reg [(2*REGISTER_SIZE)-1:0] pc_fifo_internaldata [MAX_IFETCHES_IN_FLIGHT-1:0];
      reg [31:0]                  instruction_fifo_internaldata [MAX_IFETCHES_IN_FLIGHT-1:0];
      reg                         pc_fifo_empty_reg;
      reg                         pc_fifo_full_reg;
      reg                         instruction_fifo_empty_reg;
      reg                         instruction_fifo_full_reg;

      assign pc_fifo_empty          = pc_fifo_empty_reg;
      assign pc_fifo_full           = pc_fifo_full_reg;
      assign instruction_fifo_empty = instruction_fifo_empty_reg;
      assign instruction_fifo_full  = instruction_fifo_full_reg;

      assign next_pc_fifo_usedw =
        ((pc_fifo_write == 1'b1) && (pc_fifo_read == 1'b0)) ? (pc_fifo_usedw + 1'b1) :
        ((pc_fifo_write == 1'b0) && (pc_fifo_read == 1'b1)) ? (pc_fifo_usedw - 1'b1) :
        pc_fifo_usedw;
      assign next_instruction_fifo_usedw =
        ((instruction_fifo_write == 1'b1) && (instruction_fifo_read == 1'b0)) ?
        (instruction_fifo_usedw + 1'b1) :
        ((instruction_fifo_write == 1'b0) && (instruction_fifo_read == 1'b1)) ?
        (instruction_fifo_usedw - 1'b1) :
        instruction_fifo_usedw;

      if (MAX_IFETCHES_IN_FLIGHT < 4) begin : lut_gen
        integer i;

        assign pc_fifo_readdata          = pc_fifo_internaldata[0];
        assign instruction_fifo_readdata = instruction_fifo_internaldata[0];

        always @(posedge clk or posedge reset) begin
          if (reset == 1'b1) begin
            pc_fifo_empty_reg          <= 1'b1;
            pc_fifo_full_reg           <= 1'b0;
            instruction_fifo_empty_reg <= 1'b1;
            instruction_fifo_full_reg  <= 1'b0;
          end else begin
            if (pc_instruction_fifo_reset == 1'b1) begin
              pc_fifo_empty_reg          <= 1'b1;
              pc_fifo_full_reg           <= 1'b0;
              instruction_fifo_empty_reg <= 1'b1;
              instruction_fifo_full_reg  <= 1'b0;
            end else begin
              if (pc_fifo_read == 1'b1) begin
                for (i = 0; i <= MAX_IFETCHES_IN_FLIGHT-2; i = i + 1) begin
                  pc_fifo_internaldata[i] <= pc_fifo_internaldata[i+1];
                end
              end
              if (pc_fifo_write == 1'b1) begin
                pc_fifo_empty_reg <= 1'b0;
                if (pc_fifo_read == 1'b1) begin
                  pc_fifo_internaldata[pc_fifo_usedw - 1'b1] <= pc_fifo_writedata;
                end else begin
                  pc_fifo_internaldata[pc_fifo_usedw] <= pc_fifo_writedata;
                  if (pc_fifo_usedw == MAX_IFETCHES_IN_FLIGHT-1) begin
                    pc_fifo_full_reg <= 1'b1;
                  end
                end
              end else if (pc_fifo_read == 1'b1) begin
                pc_fifo_full_reg <= 1'b0;
                if (pc_fifo_usedw == 1) begin
                  pc_fifo_empty_reg <= 1'b1;
                end
              end

              if (instruction_fifo_read == 1'b1) begin
                for (i = 0; i <= MAX_IFETCHES_IN_FLIGHT-2; i = i + 1) begin
                  instruction_fifo_internaldata[i] <= instruction_fifo_internaldata[i+1];
                end
              end
              if (instruction_fifo_write == 1'b1) begin
                instruction_fifo_empty_reg <= 1'b0;
                if (instruction_fifo_read == 1'b1) begin
                  instruction_fifo_internaldata[instruction_fifo_usedw - 1'b1] <= instruction_fifo_writedata;
                end else begin
                  instruction_fifo_internaldata[instruction_fifo_usedw] <= instruction_fifo_writedata;
                  if (instruction_fifo_usedw == MAX_IFETCHES_IN_FLIGHT-1) begin
                    instruction_fifo_full_reg <= 1'b1;
                  end
                end
              end else if (instruction_fifo_read == 1'b1) begin
                instruction_fifo_full_reg <= 1'b0;
                if (instruction_fifo_usedw == 1) begin
                  instruction_fifo_empty_reg <= 1'b1;
                end
              end
            end
          end
        end
      end

      if (MAX_IFETCHES_IN_FLIGHT >= 4) begin : ram_gen
        reg [`log2(MAX_IFETCHES_IN_FLIGHT)-1:0] pc_fifo_read_address;
        reg [`log2(MAX_IFETCHES_IN_FLIGHT)-1:0] pc_fifo_write_address;
        reg [`log2(MAX_IFETCHES_IN_FLIGHT)-1:0] instruction_fifo_read_address;
        reg [`log2(MAX_IFETCHES_IN_FLIGHT)-1:0] instruction_fifo_write_address;

        assign pc_fifo_readdata          = pc_fifo_internaldata[pc_fifo_read_address];
        assign instruction_fifo_readdata = instruction_fifo_internaldata[instruction_fifo_read_address];

        always @(posedge clk or posedge reset) begin
          if (reset == 1'b1) begin
            pc_fifo_empty_reg              <= 1'b1;
            pc_fifo_full_reg               <= 1'b0;
            instruction_fifo_empty_reg     <= 1'b1;
            instruction_fifo_full_reg      <= 1'b0;
            pc_fifo_read_address           <= {`log2(MAX_IFETCHES_IN_FLIGHT){1'b0}};
            pc_fifo_write_address          <= {`log2(MAX_IFETCHES_IN_FLIGHT){1'b0}};
            instruction_fifo_read_address  <= {`log2(MAX_IFETCHES_IN_FLIGHT){1'b0}};
            instruction_fifo_write_address <= {`log2(MAX_IFETCHES_IN_FLIGHT){1'b0}};
          end else begin
            if (pc_instruction_fifo_reset == 1'b1) begin
              pc_fifo_empty_reg              <= 1'b1;
              pc_fifo_full_reg               <= 1'b0;
              instruction_fifo_empty_reg     <= 1'b1;
              instruction_fifo_full_reg      <= 1'b0;
              pc_fifo_read_address           <= {`log2(MAX_IFETCHES_IN_FLIGHT){1'b0}};
              pc_fifo_write_address          <= {`log2(MAX_IFETCHES_IN_FLIGHT){1'b0}};
              instruction_fifo_read_address  <= {`log2(MAX_IFETCHES_IN_FLIGHT){1'b0}};
              instruction_fifo_write_address <= {`log2(MAX_IFETCHES_IN_FLIGHT){1'b0}};
            end else begin
              if (pc_fifo_write == 1'b1) begin
                pc_fifo_empty_reg                          <= 1'b0;
                pc_fifo_internaldata[pc_fifo_write_address] <= pc_fifo_writedata;
                pc_fifo_write_address <= pc_fifo_write_address + 1'b1;
                if ((pc_fifo_read == 1'b0) &&
                    (pc_fifo_usedw == MAX_IFETCHES_IN_FLIGHT-1)) begin
                  pc_fifo_full_reg <= 1'b1;
                end
              end
              if (pc_fifo_read == 1'b1) begin
                pc_fifo_full_reg     <= 1'b0;
                pc_fifo_read_address <= pc_fifo_read_address + 1'b1;
                if ((pc_fifo_write == 1'b0) &&
                    (pc_fifo_usedw == 1)) begin
                  pc_fifo_empty_reg <= 1'b1;
                end
              end

              if (instruction_fifo_write == 1'b1) begin
                instruction_fifo_empty_reg <= 1'b0;
                instruction_fifo_internaldata[instruction_fifo_write_address] <= instruction_fifo_writedata;
                instruction_fifo_write_address <= instruction_fifo_write_address + 1'b1;
                if ((instruction_fifo_read == 1'b0) &&
                    (instruction_fifo_usedw == MAX_IFETCHES_IN_FLIGHT-1)) begin
                  instruction_fifo_full_reg <= 1'b1;
                end
              end
              if (instruction_fifo_read == 1'b1) begin
                instruction_fifo_full_reg     <= 1'b0;
                instruction_fifo_read_address <= instruction_fifo_read_address + 1'b1;
                if ((instruction_fifo_write == 1'b0) &&
                    (instruction_fifo_usedw == 1)) begin
                  instruction_fifo_empty_reg <= 1'b1;
                end
              end
            end
          end
        end
      end
    end
  endgenerate

  generate
    //Feed readdata directly to decode stage
    if (FIFO_BYPASS != 0) begin : bypass_gen
      assign from_ifetch_instruction = (instruction_fifo_empty == 1'b0) ?
                                       instruction_fifo_readdata : oimm_readdata;
      assign ifetch_valid           = (~instruction_fifo_empty) | (oimm_readdatavalid & (~quashing_readdata));
      assign instruction_fifo_read  = pc_fifo_read & (~instruction_fifo_empty);
      assign instruction_fifo_write = (oimm_readdatavalid & (~quashing_readdata)) &
                                      ((~to_ifetch_ready) | (~instruction_fifo_empty));
    end
    if (FIFO_BYPASS == 0) begin : no_bypass_gen
      assign from_ifetch_instruction = instruction_fifo_readdata;
      assign ifetch_valid            = ~instruction_fifo_empty;
      assign instruction_fifo_read   = pc_fifo_read;
      assign instruction_fifo_write  = (oimm_readdatavalid & (~quashing_readdata));
    end
  endgenerate

  assign from_ifetch_valid           = ifetch_valid;
  assign from_ifetch_program_counter = pc_fifo_readdata[REGISTER_SIZE-1:0];
  assign from_ifetch_predicted_pc    = pc_fifo_readdata[(2*REGISTER_SIZE)-1:REGISTER_SIZE];

  // VHDL asserts (BTB_ENTRIES power of 2, MAX_IFETCHES_IN_FLIGHT < 4 or power
  // of 2, FIFO_BYPASS throughput warning) omitted; check configuration
  // manually.

endmodule
