`include "B_BSCANE2_defines.vh"

reg [`BSCANE2_DATA_SZ-1:0] ATTR [0:`BSCANE2_ADDR_N-1];
reg [`BSCANE2__DISABLE_JTAG_SZ:1] DISABLE_JTAG_REG = DISABLE_JTAG;
reg [`BSCANE2__JTAG_CHAIN_SZ-1:0] JTAG_CHAIN_REG = JTAG_CHAIN;

initial begin
  ATTR[`BSCANE2__DISABLE_JTAG] = DISABLE_JTAG;
  ATTR[`BSCANE2__JTAG_CHAIN] = JTAG_CHAIN;
end

always @(trig_attr) begin
  DISABLE_JTAG_REG = ATTR[`BSCANE2__DISABLE_JTAG];
  JTAG_CHAIN_REG = ATTR[`BSCANE2__JTAG_CHAIN];
end

// procedures to override, read attribute values

task write_attr;
  input  [`BSCANE2_ADDR_SZ-1:0] addr;
  input  [`BSCANE2_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`BSCANE2_DATA_SZ-1:0] read_attr;
  input  [`BSCANE2_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
