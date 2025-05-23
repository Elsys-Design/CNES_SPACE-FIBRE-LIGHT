`include "B_IBUFGDS_defines.vh"

reg [`IBUFGDS_DATA_SZ-1:0] ATTR [0:`IBUFGDS_ADDR_N-1];
reg [`IBUFGDS__DIFF_TERM_SZ:1] DIFF_TERM_REG = DIFF_TERM;
reg [`IBUFGDS__IBUF_LOW_PWR_SZ:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
reg [`IBUFGDS__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;

initial begin
  ATTR[`IBUFGDS__DIFF_TERM] = DIFF_TERM;
  ATTR[`IBUFGDS__IBUF_LOW_PWR] = IBUF_LOW_PWR;
  ATTR[`IBUFGDS__IOSTANDARD] = IOSTANDARD;
end

always @(trig_attr) begin
  DIFF_TERM_REG = ATTR[`IBUFGDS__DIFF_TERM];
  IBUF_LOW_PWR_REG = ATTR[`IBUFGDS__IBUF_LOW_PWR];
  IOSTANDARD_REG = ATTR[`IBUFGDS__IOSTANDARD];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IBUFGDS_ADDR_SZ-1:0] addr;
  input  [`IBUFGDS_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IBUFGDS_DATA_SZ-1:0] read_attr;
  input  [`IBUFGDS_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
