`include "B_DFE_CFR_defines.vh"

reg [`DFE_CFR_DATA_SZ-1:0] ATTR [0:`DFE_CFR_ADDR_N-1];
real ACTIVE_DUTYCYCLE_REG = ACTIVE_DUTYCYCLE;
real CLK_FREQ_REG = CLK_FREQ;
real PC_IT0_NUM_CPG_REG = PC_IT0_NUM_CPG;
real PC_IT1_NUM_CPG_REG = PC_IT1_NUM_CPG;
real PC_IT2_NUM_CPG_REG = PC_IT2_NUM_CPG;
reg [`DFE_CFR__WIN_ENABLED_SZ:1] WIN_ENABLED_REG = WIN_ENABLED;
reg [`DFE_CFR__XPA_CFG0_SZ-1:0] XPA_CFG0_REG = XPA_CFG0;

initial begin
  ATTR[`DFE_CFR__ACTIVE_DUTYCYCLE] = $realtobits(ACTIVE_DUTYCYCLE);
  ATTR[`DFE_CFR__CLK_FREQ] = $realtobits(CLK_FREQ);
  ATTR[`DFE_CFR__PC_IT0_NUM_CPG] = $realtobits(PC_IT0_NUM_CPG);
  ATTR[`DFE_CFR__PC_IT1_NUM_CPG] = $realtobits(PC_IT1_NUM_CPG);
  ATTR[`DFE_CFR__PC_IT2_NUM_CPG] = $realtobits(PC_IT2_NUM_CPG);
  ATTR[`DFE_CFR__WIN_ENABLED] = WIN_ENABLED;
  ATTR[`DFE_CFR__XPA_CFG0] = XPA_CFG0;
end

always @(trig_attr) begin
  ACTIVE_DUTYCYCLE_REG = $bitstoreal(ATTR[`DFE_CFR__ACTIVE_DUTYCYCLE]);
  CLK_FREQ_REG = $bitstoreal(ATTR[`DFE_CFR__CLK_FREQ]);
  PC_IT0_NUM_CPG_REG = $bitstoreal(ATTR[`DFE_CFR__PC_IT0_NUM_CPG]);
  PC_IT1_NUM_CPG_REG = $bitstoreal(ATTR[`DFE_CFR__PC_IT1_NUM_CPG]);
  PC_IT2_NUM_CPG_REG = $bitstoreal(ATTR[`DFE_CFR__PC_IT2_NUM_CPG]);
  WIN_ENABLED_REG = ATTR[`DFE_CFR__WIN_ENABLED];
  XPA_CFG0_REG = ATTR[`DFE_CFR__XPA_CFG0];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DFE_CFR_ADDR_SZ-1:0] addr;
  input  [`DFE_CFR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DFE_CFR_DATA_SZ-1:0] read_attr;
  input  [`DFE_CFR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
