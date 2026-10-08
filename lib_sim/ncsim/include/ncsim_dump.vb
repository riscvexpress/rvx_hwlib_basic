// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reservxd.
// Electronics and Telecommunications Research Institute (ETRI)
// 
// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE,
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2026-10-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************
wire dump_wait = pjtag_rfinished;
wire dump_start = simulation_stop;
reg [32-1:0] dump_buffer;

integer dump_type;
reg [32-1:0] dump_addr;
reg [32-1:0] dump_addr_current;
integer dump_size;

integer fp;
integer dump_i;

initial
begin
	dump_enable = 0;
  dump_buffer = 0;
`ifdef DUMP_ENABLE
  wait(dump_wait==1);
  dump_enable = 1;
  wait(dump_start==1);
  
  read_memory_using_jtag(`EXTERNAL_PERI_GROUP_BASEADDR+`MMAP_OFFSET_EPG_MISC_EXTREG00, dump_buffer);
  dump_type = dump_buffer;
  if(dump_type==0)
    ;
  else if(dump_type==1)
  begin
    read_memory_using_jtag(`EXTERNAL_PERI_GROUP_BASEADDR+`MMAP_OFFSET_EPG_MISC_EXTREG01, dump_buffer);
    dump_addr = dump_buffer;
    read_memory_using_jtag(`EXTERNAL_PERI_GROUP_BASEADDR+`MMAP_OFFSET_EPG_MISC_EXTREG02, dump_buffer);
    dump_size = dump_buffer;
    $display("\n[DUMP] %d, 0x%x, %d", dump_type, dump_addr, dump_size);
    
    fp = $fopen("./dump/dump_type.txt", "w");
    $fwrite(fp, "%d", dump_type);
    $fclose(fp);
    
    fp = $fopen("./dump/dump_data.bin", "w");
    dump_addr_current = dump_addr;
    for(dump_i = 0; dump_i < dump_size; dump_i=dump_i+4)
    begin
      read_memory_using_jtag(dump_addr_current, dump_buffer);
      $fwrite(fp, "%u", dump_buffer);
      dump_addr_current = dump_addr_current + 4;
    end
    $fclose(fp);
  end
  else if(dump_type==2)
  begin
    $display("\n[DUMP] deprecated type: %d", dump_type);
  end
  else
  begin
    $display("\n[DUMP] undefined type: %d", dump_type);
  end
  dump_enable = 0;
`endif
end
