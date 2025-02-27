`include "B_IDDRE1_defines.vh"

reg [`IDDRE1_DATA_SZ-1:0] ATTR [0:`IDDRE1_ADDR_N-1];
reg [`IDDRE1__DDR_CLK_EDGE_SZ:1] DDR_CLK_EDGE_REG = DDR_CLK_EDGE;
reg IS_CB_INVERTED_REG = IS_CB_INVERTED;
reg IS_C_INVERTED_REG = IS_C_INVERTED;

initial begin
  ATTR[`IDDRE1__DDR_CLK_EDGE] = DDR_CLK_EDGE;
  ATTR[`IDDRE1__IS_CB_INVERTED] = IS_CB_INVERTED;
  ATTR[`IDDRE1__IS_C_INVERTED] = IS_C_INVERTED;
end

always @(trig_attr) begin
  DDR_CLK_EDGE_REG = ATTR[`IDDRE1__DDR_CLK_EDGE];
  IS_CB_INVERTED_REG = ATTR[`IDDRE1__IS_CB_INVERTED];
  IS_C_INVERTED_REG = ATTR[`IDDRE1__IS_C_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IDDRE1_ADDR_SZ-1:0] addr;
  input  [`IDDRE1_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IDDRE1_DATA_SZ-1:0] read_attr;
  input  [`IDDRE1_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
