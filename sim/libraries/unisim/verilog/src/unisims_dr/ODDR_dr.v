`include "B_ODDR_defines.vh"

reg [`ODDR_DATA_SZ-1:0] ATTR [0:`ODDR_ADDR_N-1];
reg [`ODDR__DDR_CLK_EDGE_SZ:1] DDR_CLK_EDGE_REG = DDR_CLK_EDGE;
reg INIT_REG = INIT;
reg IS_C_INVERTED_REG = IS_C_INVERTED;
reg IS_D1_INVERTED_REG = IS_D1_INVERTED;
reg IS_D2_INVERTED_REG = IS_D2_INVERTED;
reg [`ODDR__SRTYPE_SZ:1] SRTYPE_REG = SRTYPE;

initial begin
  ATTR[`ODDR__DDR_CLK_EDGE] = DDR_CLK_EDGE;
  ATTR[`ODDR__INIT] = INIT;
  ATTR[`ODDR__IS_C_INVERTED] = IS_C_INVERTED;
  ATTR[`ODDR__IS_D1_INVERTED] = IS_D1_INVERTED;
  ATTR[`ODDR__IS_D2_INVERTED] = IS_D2_INVERTED;
  ATTR[`ODDR__SRTYPE] = SRTYPE;
end

always @(trig_attr) begin
  DDR_CLK_EDGE_REG = ATTR[`ODDR__DDR_CLK_EDGE];
  INIT_REG = ATTR[`ODDR__INIT];
  IS_C_INVERTED_REG = ATTR[`ODDR__IS_C_INVERTED];
  IS_D1_INVERTED_REG = ATTR[`ODDR__IS_D1_INVERTED];
  IS_D2_INVERTED_REG = ATTR[`ODDR__IS_D2_INVERTED];
  SRTYPE_REG = ATTR[`ODDR__SRTYPE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`ODDR_ADDR_SZ-1:0] addr;
  input  [`ODDR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`ODDR_DATA_SZ-1:0] read_attr;
  input  [`ODDR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
