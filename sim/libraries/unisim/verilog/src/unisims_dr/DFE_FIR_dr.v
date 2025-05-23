`include "B_DFE_FIR_defines.vh"

reg [`DFE_FIR_DATA_SZ-1:0] ATTR [0:`DFE_FIR_ADDR_N-1];
real ACTIVE_DUTYCYCLE_REG = ACTIVE_DUTYCYCLE;
real CLK_FREQ_REG = CLK_FREQ;
real N_TAPS_REG = N_TAPS;
real SLOTS_PER_PERIOD_REG = SLOTS_PER_PERIOD;
reg [`DFE_FIR__XPA_CFG0_SZ-1:0] XPA_CFG0_REG = XPA_CFG0;

initial begin
  ATTR[`DFE_FIR__ACTIVE_DUTYCYCLE] = $realtobits(ACTIVE_DUTYCYCLE);
  ATTR[`DFE_FIR__CLK_FREQ] = $realtobits(CLK_FREQ);
  ATTR[`DFE_FIR__N_TAPS] = $realtobits(N_TAPS);
  ATTR[`DFE_FIR__SLOTS_PER_PERIOD] = $realtobits(SLOTS_PER_PERIOD);
  ATTR[`DFE_FIR__XPA_CFG0] = XPA_CFG0;
end

always @(trig_attr) begin
  ACTIVE_DUTYCYCLE_REG = $bitstoreal(ATTR[`DFE_FIR__ACTIVE_DUTYCYCLE]);
  CLK_FREQ_REG = $bitstoreal(ATTR[`DFE_FIR__CLK_FREQ]);
  N_TAPS_REG = $bitstoreal(ATTR[`DFE_FIR__N_TAPS]);
  SLOTS_PER_PERIOD_REG = $bitstoreal(ATTR[`DFE_FIR__SLOTS_PER_PERIOD]);
  XPA_CFG0_REG = ATTR[`DFE_FIR__XPA_CFG0];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DFE_FIR_ADDR_SZ-1:0] addr;
  input  [`DFE_FIR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DFE_FIR_DATA_SZ-1:0] read_attr;
  input  [`DFE_FIR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
