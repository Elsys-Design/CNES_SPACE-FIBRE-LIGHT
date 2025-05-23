`include "B_RAMD32M64_defines.vh"

reg [`RAMD32M64_DATA_SZ-1:0] ATTR [0:`RAMD32M64_ADDR_N-1];
reg [`RAMD32M64__INIT_SZ-1:0] INIT_REG = INIT;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;

initial begin
  ATTR[`RAMD32M64__INIT] = INIT;
  ATTR[`RAMD32M64__IS_CLK_INVERTED] = IS_CLK_INVERTED;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`RAMD32M64__INIT];
  IS_CLK_INVERTED_REG = ATTR[`RAMD32M64__IS_CLK_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`RAMD32M64_ADDR_SZ-1:0] addr;
  input  [`RAMD32M64_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`RAMD32M64_DATA_SZ-1:0] read_attr;
  input  [`RAMD32M64_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
