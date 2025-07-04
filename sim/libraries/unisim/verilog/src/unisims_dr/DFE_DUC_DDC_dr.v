`include "B_DFE_DUC_DDC_defines.vh"

reg [`DFE_DUC_DDC_DATA_SZ-1:0] ATTR [0:`DFE_DUC_DDC_ADDR_N-1];
real ACTIVE_DUTYCYCLE_REG = ACTIVE_DUTYCYCLE;
real CLK_FREQ_REG = CLK_FREQ;
reg [`DFE_DUC_DDC__MIXER_RATE_SZ:1] MIXER_RATE_REG = MIXER_RATE;
reg [`DFE_DUC_DDC__NUM_NCO_SZ-1:0] NUM_NCO_REG = NUM_NCO;
reg [`DFE_DUC_DDC__N_CH_X1_SZ-1:0] N_CH_X1_REG = N_CH_X1;
reg [`DFE_DUC_DDC__N_CH_X16_SZ-1:0] N_CH_X16_REG = N_CH_X16;
reg [`DFE_DUC_DDC__N_CH_X2_SZ-1:0] N_CH_X2_REG = N_CH_X2;
reg [`DFE_DUC_DDC__N_CH_X4_SZ-1:0] N_CH_X4_REG = N_CH_X4;
reg [`DFE_DUC_DDC__N_CH_X8_SZ-1:0] N_CH_X8_REG = N_CH_X8;
real N_CMULT_REG = N_CMULT;
reg [`DFE_DUC_DDC__RATE_SZ:1] RATE_REG = RATE;
real SLOTS_PER_PERIOD_REG = SLOTS_PER_PERIOD;
reg [`DFE_DUC_DDC__XPA_CFG0_SZ-1:0] XPA_CFG0_REG = XPA_CFG0;

initial begin
  ATTR[`DFE_DUC_DDC__ACTIVE_DUTYCYCLE] = $realtobits(ACTIVE_DUTYCYCLE);
  ATTR[`DFE_DUC_DDC__CLK_FREQ] = $realtobits(CLK_FREQ);
  ATTR[`DFE_DUC_DDC__MIXER_RATE] = MIXER_RATE;
  ATTR[`DFE_DUC_DDC__NUM_NCO] = NUM_NCO;
  ATTR[`DFE_DUC_DDC__N_CH_X16] = N_CH_X16;
  ATTR[`DFE_DUC_DDC__N_CH_X1] = N_CH_X1;
  ATTR[`DFE_DUC_DDC__N_CH_X2] = N_CH_X2;
  ATTR[`DFE_DUC_DDC__N_CH_X4] = N_CH_X4;
  ATTR[`DFE_DUC_DDC__N_CH_X8] = N_CH_X8;
  ATTR[`DFE_DUC_DDC__N_CMULT] = $realtobits(N_CMULT);
  ATTR[`DFE_DUC_DDC__RATE] = RATE;
  ATTR[`DFE_DUC_DDC__SLOTS_PER_PERIOD] = $realtobits(SLOTS_PER_PERIOD);
  ATTR[`DFE_DUC_DDC__XPA_CFG0] = XPA_CFG0;
end

always @(trig_attr) begin
  ACTIVE_DUTYCYCLE_REG = $bitstoreal(ATTR[`DFE_DUC_DDC__ACTIVE_DUTYCYCLE]);
  CLK_FREQ_REG = $bitstoreal(ATTR[`DFE_DUC_DDC__CLK_FREQ]);
  MIXER_RATE_REG = ATTR[`DFE_DUC_DDC__MIXER_RATE];
  NUM_NCO_REG = ATTR[`DFE_DUC_DDC__NUM_NCO];
  N_CH_X16_REG = ATTR[`DFE_DUC_DDC__N_CH_X16];
  N_CH_X1_REG = ATTR[`DFE_DUC_DDC__N_CH_X1];
  N_CH_X2_REG = ATTR[`DFE_DUC_DDC__N_CH_X2];
  N_CH_X4_REG = ATTR[`DFE_DUC_DDC__N_CH_X4];
  N_CH_X8_REG = ATTR[`DFE_DUC_DDC__N_CH_X8];
  N_CMULT_REG = $bitstoreal(ATTR[`DFE_DUC_DDC__N_CMULT]);
  RATE_REG = ATTR[`DFE_DUC_DDC__RATE];
  SLOTS_PER_PERIOD_REG = $bitstoreal(ATTR[`DFE_DUC_DDC__SLOTS_PER_PERIOD]);
  XPA_CFG0_REG = ATTR[`DFE_DUC_DDC__XPA_CFG0];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DFE_DUC_DDC_ADDR_SZ-1:0] addr;
  input  [`DFE_DUC_DDC_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DFE_DUC_DDC_DATA_SZ-1:0] read_attr;
  input  [`DFE_DUC_DDC_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
