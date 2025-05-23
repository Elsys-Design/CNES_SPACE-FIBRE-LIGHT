`include "B_DIFFINBUF_defines.vh"

reg [`DIFFINBUF_DATA_SZ-1:0] ATTR [0:`DIFFINBUF_ADDR_N-1];
reg [`DIFFINBUF__DIFF_TERM_SZ:1] DIFF_TERM_REG = DIFF_TERM;
reg [`DIFFINBUF__DQS_BIAS_SZ:1] DQS_BIAS_REG = DQS_BIAS;
reg [`DIFFINBUF__IBUF_LOW_PWR_SZ:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
reg [`DIFFINBUF__ISTANDARD_SZ:1] ISTANDARD_REG = ISTANDARD;
reg [`DIFFINBUF__SIM_INPUT_BUFFER_OFFSET_SZ-1:0] SIM_INPUT_BUFFER_OFFSET_REG = SIM_INPUT_BUFFER_OFFSET;

initial begin
  ATTR[`DIFFINBUF__DIFF_TERM] = DIFF_TERM;
  ATTR[`DIFFINBUF__DQS_BIAS] = DQS_BIAS;
  ATTR[`DIFFINBUF__IBUF_LOW_PWR] = IBUF_LOW_PWR;
  ATTR[`DIFFINBUF__ISTANDARD] = ISTANDARD;
  ATTR[`DIFFINBUF__SIM_INPUT_BUFFER_OFFSET] = SIM_INPUT_BUFFER_OFFSET;
end

always @(trig_attr) begin
  DIFF_TERM_REG = ATTR[`DIFFINBUF__DIFF_TERM];
  DQS_BIAS_REG = ATTR[`DIFFINBUF__DQS_BIAS];
  IBUF_LOW_PWR_REG = ATTR[`DIFFINBUF__IBUF_LOW_PWR];
  ISTANDARD_REG = ATTR[`DIFFINBUF__ISTANDARD];
  SIM_INPUT_BUFFER_OFFSET_REG = ATTR[`DIFFINBUF__SIM_INPUT_BUFFER_OFFSET];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DIFFINBUF_ADDR_SZ-1:0] addr;
  input  [`DIFFINBUF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DIFFINBUF_DATA_SZ-1:0] read_attr;
  input  [`DIFFINBUF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
