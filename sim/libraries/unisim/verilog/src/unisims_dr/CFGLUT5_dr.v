`include "B_CFGLUT5_defines.vh"

reg [`CFGLUT5_DATA_SZ-1:0] ATTR [0:`CFGLUT5_ADDR_N-1];
reg [`CFGLUT5__INIT_SZ-1:0] INIT_REG = INIT;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;

initial begin
  ATTR[`CFGLUT5__INIT] = INIT;
  ATTR[`CFGLUT5__IS_CLK_INVERTED] = IS_CLK_INVERTED;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`CFGLUT5__INIT];
  IS_CLK_INVERTED_REG = ATTR[`CFGLUT5__IS_CLK_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`CFGLUT5_ADDR_SZ-1:0] addr;
  input  [`CFGLUT5_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`CFGLUT5_DATA_SZ-1:0] read_attr;
  input  [`CFGLUT5_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
