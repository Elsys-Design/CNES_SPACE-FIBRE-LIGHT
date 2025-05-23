`include "B_IDDR_2CLK_defines.vh"

reg [`IDDR_2CLK_DATA_SZ-1:0] ATTR [0:`IDDR_2CLK_ADDR_N-1];
reg [`IDDR_2CLK__DDR_CLK_EDGE_SZ:1] DDR_CLK_EDGE_REG = DDR_CLK_EDGE;
reg INIT_Q1_REG = INIT_Q1;
reg INIT_Q2_REG = INIT_Q2;
reg IS_CB_INVERTED_REG = IS_CB_INVERTED;
reg IS_C_INVERTED_REG = IS_C_INVERTED;
reg IS_D_INVERTED_REG = IS_D_INVERTED;
reg [`IDDR_2CLK__SRTYPE_SZ:1] SRTYPE_REG = SRTYPE;

initial begin
  ATTR[`IDDR_2CLK__DDR_CLK_EDGE] = DDR_CLK_EDGE;
  ATTR[`IDDR_2CLK__INIT_Q1] = INIT_Q1;
  ATTR[`IDDR_2CLK__INIT_Q2] = INIT_Q2;
  ATTR[`IDDR_2CLK__IS_CB_INVERTED] = IS_CB_INVERTED;
  ATTR[`IDDR_2CLK__IS_C_INVERTED] = IS_C_INVERTED;
  ATTR[`IDDR_2CLK__IS_D_INVERTED] = IS_D_INVERTED;
  ATTR[`IDDR_2CLK__SRTYPE] = SRTYPE;
end

always @(trig_attr) begin
  DDR_CLK_EDGE_REG = ATTR[`IDDR_2CLK__DDR_CLK_EDGE];
  INIT_Q1_REG = ATTR[`IDDR_2CLK__INIT_Q1];
  INIT_Q2_REG = ATTR[`IDDR_2CLK__INIT_Q2];
  IS_CB_INVERTED_REG = ATTR[`IDDR_2CLK__IS_CB_INVERTED];
  IS_C_INVERTED_REG = ATTR[`IDDR_2CLK__IS_C_INVERTED];
  IS_D_INVERTED_REG = ATTR[`IDDR_2CLK__IS_D_INVERTED];
  SRTYPE_REG = ATTR[`IDDR_2CLK__SRTYPE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IDDR_2CLK_ADDR_SZ-1:0] addr;
  input  [`IDDR_2CLK_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IDDR_2CLK_DATA_SZ-1:0] read_attr;
  input  [`IDDR_2CLK_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
