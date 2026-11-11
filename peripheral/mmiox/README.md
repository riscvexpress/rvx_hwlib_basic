# MMIOX1

## Backend rules for clear and finish

These rules apply to every backend connected to an MMIOX1 receiver (the
`control_rmx_*` signals). `ervp_dma.v` is a reference implementation.

### Busy counter

- The bridge counts instructions in flight in the MMIO clock domain.
  - It counts up when the last word of an instruction is pushed.
  - It counts down for each `operation_finish` the backend raises.
- A clear does not reset the counter. The counter returns to zero only when the
  backend raises one `operation_finish` for every instruction that was pushed.
- If the backend skips an `operation_finish`, `num_busy` stays non-zero and
  `mmiox1_inst_wait_busy` never returns. If it raises an extra one, the counter
  underflows; its MSB then blocks new pushes (`request_is_allowed`).
- `operation_finish` crosses to the MMIO domain through a FIFO without
  backpressure. Raise it at most once per cycle.

### Clear

- When software writes a clear, `clear_request` rises in the core domain. It
  stays high until the backend raises `clear_finish`.
- The instruction FIFO is asynchronous, so the bridge cannot empty it. The
  backend must empty it itself, then finish the clear:
  1. Stop starting new instructions while `clear_request` is high.
  2. Finish or abort the operation in progress. If it is aborted, it still
     needs its `operation_finish`.
  3. Once idle, pop each remaining instruction (`inst_fifo_rrequest` while
     `inst_fifo_rready`) and raise `operation_finish` for each one dropped.
  4. Raise `clear_finish` only when the backend is idle and `inst_fifo_rready`
     is low.
- Raising `clear_finish` in the same cycle as `clear_request` (a one-cycle
  clear) breaks these rules. It leaves instructions in the FIFO and busy counts
  behind.

```verilog
assign drop_inst = is_idle & control_rmx_inst_fifo_rready & control_rmx_clear_request;
assign control_rmx_inst_fifo_rrequest = end_of_inst | drop_inst;
assign control_rmx_operation_finish   = end_of_inst | drop_inst;
assign control_rmx_clear_finish = control_rmx_clear_request & is_idle & (~control_rmx_inst_fifo_rready);
```

### Repeating instructions

- An instruction that repeats until cleared stays at the head of the FIFO and
  raises no `operation_finish` while it repeats.
- Its single `operation_finish` comes when the clear drops it.
