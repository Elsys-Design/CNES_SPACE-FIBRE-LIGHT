`include "B_DFE_NL_FIR_defines.vh"

reg [`DFE_NL_FIR_DATA_SZ-1:0] ATTR [0:`DFE_NL_FIR_ADDR_N-1];
real ACTIVE_DUTYCYCLE_REG = ACTIVE_DUTYCYCLE;
real CLK_FREQ_REG = CLK_FREQ;
real NUM_DUAL_TERMS_REG = NUM_DUAL_TERMS;
real NUM_PHASES_REG = NUM_PHASES;
real NUM_UNITS_REG = NUM_UNITS;
reg [`DFE_NL_FIR__XPA_CFG0_SZ-1:0] XPA_CFG0_REG = XPA_CFG0;

initial begin
  ATTR[`DFE_NL_FIR__ACTIVE_DUTYCYCLE] = $realtobits(ACTIVE_DUTYCYCLE);
  ATTR[`DFE_NL_FIR__CLK_FREQ] = $realtobits(CLK_FREQ);
  ATTR[`DFE_NL_FIR__NUM_DUAL_TERMS] = $realtobits(NUM_DUAL_TERMS);
  ATTR[`DFE_NL_FIR__NUM_PHASES] = $realtobits(NUM_PHASES);
  ATTR[`DFE_NL_FIR__NUM_UNITS] = $realtobits(NUM_UNITS);
  ATTR[`DFE_NL_FIR__XPA_CFG0] = XPA_CFG0;
end

always @(trig_attr) begin
  ACTIVE_DUTYCYCLE_REG = $bitstoreal(ATTR[`DFE_NL_FIR__ACTIVE_DUTYCYCLE]);
  CLK_FREQ_REG = $bitstoreal(ATTR[`DFE_NL_FIR__CLK_FREQ]);
  NUM_DUAL_TERMS_REG = $bitstoreal(ATTR[`DFE_NL_FIR__NUM_DUAL_TERMS]);
  NUM_PHASES_REG = $bitstoreal(ATTR[`DFE_NL_FIR__NUM_PHASES]);
  NUM_UNITS_REG = $bitstoreal(ATTR[`DFE_NL_FIR__NUM_UNITS]);
  XPA_CFG0_REG = ATTR[`DFE_NL_FIR__XPA_CFG0];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DFE_NL_FIR_ADDR_SZ-1:0] addr;
  input  [`DFE_NL_FIR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DFE_NL_FIR_DATA_SZ-1:0] read_attr;
  input  [`DFE_NL_FIR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
