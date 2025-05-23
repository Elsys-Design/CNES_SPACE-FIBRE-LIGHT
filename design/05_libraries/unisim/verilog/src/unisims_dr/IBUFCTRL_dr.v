`include "B_IBUFCTRL_defines.vh"

reg [`IBUFCTRL_DATA_SZ-1:0] ATTR [0:`IBUFCTRL_ADDR_N-1];
reg [`IBUFCTRL__ISTANDARD_SZ:1] ISTANDARD_REG = ISTANDARD;
reg [`IBUFCTRL__USE_IBUFDISABLE_SZ:1] USE_IBUFDISABLE_REG = USE_IBUFDISABLE;

initial begin
  ATTR[`IBUFCTRL__ISTANDARD] = ISTANDARD;
  ATTR[`IBUFCTRL__USE_IBUFDISABLE] = USE_IBUFDISABLE;
end

always @(trig_attr) begin
  ISTANDARD_REG = ATTR[`IBUFCTRL__ISTANDARD];
  USE_IBUFDISABLE_REG = ATTR[`IBUFCTRL__USE_IBUFDISABLE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IBUFCTRL_ADDR_SZ-1:0] addr;
  input  [`IBUFCTRL_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IBUFCTRL_DATA_SZ-1:0] read_attr;
  input  [`IBUFCTRL_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
