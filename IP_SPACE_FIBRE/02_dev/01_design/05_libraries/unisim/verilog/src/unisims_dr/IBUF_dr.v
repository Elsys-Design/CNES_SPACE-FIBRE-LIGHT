`include "B_IBUF_defines.vh"

reg [`IBUF_DATA_SZ-1:0] ATTR [0:`IBUF_ADDR_N-1];
reg [`IBUF__IBUF_LOW_PWR_SZ:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
reg [`IBUF__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;

initial begin
  ATTR[`IBUF__IBUF_LOW_PWR] = IBUF_LOW_PWR;
  ATTR[`IBUF__IOSTANDARD] = IOSTANDARD;
end

always @(trig_attr) begin
  IBUF_LOW_PWR_REG = ATTR[`IBUF__IBUF_LOW_PWR];
  IOSTANDARD_REG = ATTR[`IBUF__IOSTANDARD];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IBUF_ADDR_SZ-1:0] addr;
  input  [`IBUF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IBUF_DATA_SZ-1:0] read_attr;
  input  [`IBUF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
