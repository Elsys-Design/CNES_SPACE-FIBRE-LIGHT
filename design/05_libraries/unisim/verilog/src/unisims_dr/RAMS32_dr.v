`include "B_RAMS32_defines.vh"

reg [`RAMS32_DATA_SZ-1:0] ATTR [0:`RAMS32_ADDR_N-1];
reg [`RAMS32__INIT_SZ-1:0] INIT_REG = INIT;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;

initial begin
  ATTR[`RAMS32__INIT] = INIT;
  ATTR[`RAMS32__IS_CLK_INVERTED] = IS_CLK_INVERTED;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`RAMS32__INIT];
  IS_CLK_INVERTED_REG = ATTR[`RAMS32__IS_CLK_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`RAMS32_ADDR_SZ-1:0] addr;
  input  [`RAMS32_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`RAMS32_DATA_SZ-1:0] read_attr;
  input  [`RAMS32_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
