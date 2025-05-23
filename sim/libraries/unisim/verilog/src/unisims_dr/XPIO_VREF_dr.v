`include "B_XPIO_VREF_defines.vh"

reg [`XPIO_VREF_DATA_SZ-1:0] ATTR [0:`XPIO_VREF_ADDR_N-1];
reg [`XPIO_VREF__ISTANDARD_SZ:1] ISTANDARD_REG = ISTANDARD;
reg [`XPIO_VREF__VOH_SZ-1:0] VOH_REG = VOH;
reg [`XPIO_VREF__VREF_NIB_SZ:1] VREF_NIB_REG = VREF_NIB;

initial begin
  ATTR[`XPIO_VREF__ISTANDARD] = ISTANDARD;
  ATTR[`XPIO_VREF__VOH] = VOH;
  ATTR[`XPIO_VREF__VREF_NIB] = VREF_NIB;
end

always @(trig_attr) begin
  ISTANDARD_REG = ATTR[`XPIO_VREF__ISTANDARD];
  VOH_REG = ATTR[`XPIO_VREF__VOH];
  VREF_NIB_REG = ATTR[`XPIO_VREF__VREF_NIB];
end

// procedures to override, read attribute values

task write_attr;
  input  [`XPIO_VREF_ADDR_SZ-1:0] addr;
  input  [`XPIO_VREF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`XPIO_VREF_DATA_SZ-1:0] read_attr;
  input  [`XPIO_VREF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
