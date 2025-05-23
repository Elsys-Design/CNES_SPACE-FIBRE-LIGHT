`include "B_ODELAYE5_defines.vh"

reg [`ODELAYE5_DATA_SZ-1:0] ATTR [0:`ODELAYE5_ADDR_N-1];
reg [`ODELAYE5__CASCADE_SZ:1] CASCADE_REG = CASCADE;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg IS_RST_INVERTED_REG = IS_RST_INVERTED;

initial begin
  ATTR[`ODELAYE5__CASCADE] = CASCADE;
  ATTR[`ODELAYE5__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`ODELAYE5__IS_RST_INVERTED] = IS_RST_INVERTED;
end

always @(trig_attr) begin
  CASCADE_REG = ATTR[`ODELAYE5__CASCADE];
  IS_CLK_INVERTED_REG = ATTR[`ODELAYE5__IS_CLK_INVERTED];
  IS_RST_INVERTED_REG = ATTR[`ODELAYE5__IS_RST_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`ODELAYE5_ADDR_SZ-1:0] addr;
  input  [`ODELAYE5_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`ODELAYE5_DATA_SZ-1:0] read_attr;
  input  [`ODELAYE5_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
