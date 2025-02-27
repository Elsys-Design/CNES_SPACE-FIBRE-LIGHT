`include "B_SRLC32E_defines.vh"

reg [`SRLC32E_DATA_SZ-1:0] ATTR [0:`SRLC32E_ADDR_N-1];
reg [`SRLC32E__INIT_SZ-1:0] INIT_REG = INIT;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;

initial begin
  ATTR[`SRLC32E__INIT] = INIT;
  ATTR[`SRLC32E__IS_CLK_INVERTED] = IS_CLK_INVERTED;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`SRLC32E__INIT];
  IS_CLK_INVERTED_REG = ATTR[`SRLC32E__IS_CLK_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`SRLC32E_ADDR_SZ-1:0] addr;
  input  [`SRLC32E_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`SRLC32E_DATA_SZ-1:0] read_attr;
  input  [`SRLC32E_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
