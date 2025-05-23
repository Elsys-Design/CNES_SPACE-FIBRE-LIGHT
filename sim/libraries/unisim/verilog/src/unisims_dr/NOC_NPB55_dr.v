`include "B_NOC_NPB55_defines.vh"

reg [`NOC_NPB55_DATA_SZ-1:0] ATTR [0:`NOC_NPB55_ADDR_N-1];
reg [`NOC_NPB55__REG_ID_SZ-1:0] REG_ID_REG = REG_ID;
reg [`NOC_NPB55__REG_NOC_CTL_SZ-1:0] REG_NOC_CTL_REG = REG_NOC_CTL;
reg [`NOC_NPB55__REG_P0_P1_0_VCA_TOKEN_SZ-1:0] REG_P0_P1_0_VCA_TOKEN_REG = REG_P0_P1_0_VCA_TOKEN;
reg [`NOC_NPB55__REG_P0_P1_1_VCA_TOKEN_SZ-1:0] REG_P0_P1_1_VCA_TOKEN_REG = REG_P0_P1_1_VCA_TOKEN;
reg [`NOC_NPB55__REG_P1_P0_0_VCA_TOKEN_SZ-1:0] REG_P1_P0_0_VCA_TOKEN_REG = REG_P1_P0_0_VCA_TOKEN;
reg [`NOC_NPB55__REG_P1_P0_1_VCA_TOKEN_SZ-1:0] REG_P1_P0_1_VCA_TOKEN_REG = REG_P1_P0_1_VCA_TOKEN;

initial begin
  ATTR[`NOC_NPB55__REG_ID] = REG_ID;
  ATTR[`NOC_NPB55__REG_NOC_CTL] = REG_NOC_CTL;
  ATTR[`NOC_NPB55__REG_P0_P1_0_VCA_TOKEN] = REG_P0_P1_0_VCA_TOKEN;
  ATTR[`NOC_NPB55__REG_P0_P1_1_VCA_TOKEN] = REG_P0_P1_1_VCA_TOKEN;
  ATTR[`NOC_NPB55__REG_P1_P0_0_VCA_TOKEN] = REG_P1_P0_0_VCA_TOKEN;
  ATTR[`NOC_NPB55__REG_P1_P0_1_VCA_TOKEN] = REG_P1_P0_1_VCA_TOKEN;
end

always @(trig_attr) begin
  REG_ID_REG = ATTR[`NOC_NPB55__REG_ID];
  REG_NOC_CTL_REG = ATTR[`NOC_NPB55__REG_NOC_CTL];
  REG_P0_P1_0_VCA_TOKEN_REG = ATTR[`NOC_NPB55__REG_P0_P1_0_VCA_TOKEN];
  REG_P0_P1_1_VCA_TOKEN_REG = ATTR[`NOC_NPB55__REG_P0_P1_1_VCA_TOKEN];
  REG_P1_P0_0_VCA_TOKEN_REG = ATTR[`NOC_NPB55__REG_P1_P0_0_VCA_TOKEN];
  REG_P1_P0_1_VCA_TOKEN_REG = ATTR[`NOC_NPB55__REG_P1_P0_1_VCA_TOKEN];
end

// procedures to override, read attribute values

task write_attr;
  input  [`NOC_NPB55_ADDR_SZ-1:0] addr;
  input  [`NOC_NPB55_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`NOC_NPB55_DATA_SZ-1:0] read_attr;
  input  [`NOC_NPB55_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
