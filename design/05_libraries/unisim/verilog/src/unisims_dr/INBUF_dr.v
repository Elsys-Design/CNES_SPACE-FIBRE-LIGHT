`include "B_INBUF_defines.vh"

reg [`INBUF_DATA_SZ-1:0] ATTR [0:`INBUF_ADDR_N-1];
reg [`INBUF__IBUF_LOW_PWR_SZ:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
reg [`INBUF__ISTANDARD_SZ:1] ISTANDARD_REG = ISTANDARD;
reg [`INBUF__SIM_INPUT_BUFFER_OFFSET_SZ-1:0] SIM_INPUT_BUFFER_OFFSET_REG = SIM_INPUT_BUFFER_OFFSET;

initial begin
  ATTR[`INBUF__IBUF_LOW_PWR] = IBUF_LOW_PWR;
  ATTR[`INBUF__ISTANDARD] = ISTANDARD;
  ATTR[`INBUF__SIM_INPUT_BUFFER_OFFSET] = SIM_INPUT_BUFFER_OFFSET;
end

always @(trig_attr) begin
  IBUF_LOW_PWR_REG = ATTR[`INBUF__IBUF_LOW_PWR];
  ISTANDARD_REG = ATTR[`INBUF__ISTANDARD];
  SIM_INPUT_BUFFER_OFFSET_REG = ATTR[`INBUF__SIM_INPUT_BUFFER_OFFSET];
end

// procedures to override, read attribute values

task write_attr;
  input  [`INBUF_ADDR_SZ-1:0] addr;
  input  [`INBUF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`INBUF_DATA_SZ-1:0] read_attr;
  input  [`INBUF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
