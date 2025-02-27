`include "B_DFE_MATRIX_FIR_defines.vh"

reg [`DFE_MATRIX_FIR_DATA_SZ-1:0] ATTR [0:`DFE_MATRIX_FIR_ADDR_N-1];
real ACTIVE_DUTYCYCLE_REG = ACTIVE_DUTYCYCLE;
real CLK_FREQ_REG = CLK_FREQ;
reg [`DFE_MATRIX_FIR__MODE_SZ:1] MODE_REG = MODE;
real N_TAPS_REG = N_TAPS;
reg [`DFE_MATRIX_FIR__XPA_CFG0_SZ-1:0] XPA_CFG0_REG = XPA_CFG0;

initial begin
  ATTR[`DFE_MATRIX_FIR__ACTIVE_DUTYCYCLE] = $realtobits(ACTIVE_DUTYCYCLE);
  ATTR[`DFE_MATRIX_FIR__CLK_FREQ] = $realtobits(CLK_FREQ);
  ATTR[`DFE_MATRIX_FIR__MODE] = MODE;
  ATTR[`DFE_MATRIX_FIR__N_TAPS] = $realtobits(N_TAPS);
  ATTR[`DFE_MATRIX_FIR__XPA_CFG0] = XPA_CFG0;
end

always @(trig_attr) begin
  ACTIVE_DUTYCYCLE_REG = $bitstoreal(ATTR[`DFE_MATRIX_FIR__ACTIVE_DUTYCYCLE]);
  CLK_FREQ_REG = $bitstoreal(ATTR[`DFE_MATRIX_FIR__CLK_FREQ]);
  MODE_REG = ATTR[`DFE_MATRIX_FIR__MODE];
  N_TAPS_REG = $bitstoreal(ATTR[`DFE_MATRIX_FIR__N_TAPS]);
  XPA_CFG0_REG = ATTR[`DFE_MATRIX_FIR__XPA_CFG0];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DFE_MATRIX_FIR_ADDR_SZ-1:0] addr;
  input  [`DFE_MATRIX_FIR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DFE_MATRIX_FIR_DATA_SZ-1:0] read_attr;
  input  [`DFE_MATRIX_FIR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
