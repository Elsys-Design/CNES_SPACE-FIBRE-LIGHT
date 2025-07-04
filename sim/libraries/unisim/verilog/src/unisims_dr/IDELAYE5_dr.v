`include "B_IDELAYE5_defines.vh"

reg [`IDELAYE5_DATA_SZ-1:0] ATTR [0:`IDELAYE5_ADDR_N-1];
reg [`IDELAYE5__CASCADE_SZ:1] CASCADE_REG = CASCADE;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg IS_RST_INVERTED_REG = IS_RST_INVERTED;

initial begin
  ATTR[`IDELAYE5__CASCADE] = CASCADE;
  ATTR[`IDELAYE5__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`IDELAYE5__IS_RST_INVERTED] = IS_RST_INVERTED;
end

always @(trig_attr) begin
  CASCADE_REG = ATTR[`IDELAYE5__CASCADE];
  IS_CLK_INVERTED_REG = ATTR[`IDELAYE5__IS_CLK_INVERTED];
  IS_RST_INVERTED_REG = ATTR[`IDELAYE5__IS_RST_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IDELAYE5_ADDR_SZ-1:0] addr;
  input  [`IDELAYE5_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IDELAYE5_DATA_SZ-1:0] read_attr;
  input  [`IDELAYE5_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
