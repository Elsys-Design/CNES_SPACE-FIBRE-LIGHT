`include "B_RAMS64E5_defines.vh"

reg [`RAMS64E5_DATA_SZ-1:0] ATTR [0:`RAMS64E5_ADDR_N-1];
reg [`RAMS64E5__INIT_SZ-1:0] INIT_REG = INIT;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;

initial begin
  ATTR[`RAMS64E5__INIT] = INIT;
  ATTR[`RAMS64E5__IS_CLK_INVERTED] = IS_CLK_INVERTED;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`RAMS64E5__INIT];
  IS_CLK_INVERTED_REG = ATTR[`RAMS64E5__IS_CLK_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`RAMS64E5_ADDR_SZ-1:0] addr;
  input  [`RAMS64E5_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`RAMS64E5_DATA_SZ-1:0] read_attr;
  input  [`RAMS64E5_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
