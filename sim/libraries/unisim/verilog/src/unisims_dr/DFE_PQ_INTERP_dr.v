`include "B_DFE_PQ_INTERP_defines.vh"

reg [`DFE_PQ_INTERP_DATA_SZ-1:0] ATTR [0:`DFE_PQ_INTERP_ADDR_N-1];
real ACTIVE_DUTYCYCLE_REG = ACTIVE_DUTYCYCLE;
real CLK_FREQ_REG = CLK_FREQ;
reg [`DFE_PQ_INTERP__RESAMPLE_RATE_SZ:1] RESAMPLE_RATE_REG = RESAMPLE_RATE;
reg [`DFE_PQ_INTERP__XPA_CFG0_SZ-1:0] XPA_CFG0_REG = XPA_CFG0;

initial begin
  ATTR[`DFE_PQ_INTERP__ACTIVE_DUTYCYCLE] = $realtobits(ACTIVE_DUTYCYCLE);
  ATTR[`DFE_PQ_INTERP__CLK_FREQ] = $realtobits(CLK_FREQ);
  ATTR[`DFE_PQ_INTERP__RESAMPLE_RATE] = RESAMPLE_RATE;
  ATTR[`DFE_PQ_INTERP__XPA_CFG0] = XPA_CFG0;
end

always @(trig_attr) begin
  ACTIVE_DUTYCYCLE_REG = $bitstoreal(ATTR[`DFE_PQ_INTERP__ACTIVE_DUTYCYCLE]);
  CLK_FREQ_REG = $bitstoreal(ATTR[`DFE_PQ_INTERP__CLK_FREQ]);
  RESAMPLE_RATE_REG = ATTR[`DFE_PQ_INTERP__RESAMPLE_RATE];
  XPA_CFG0_REG = ATTR[`DFE_PQ_INTERP__XPA_CFG0];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DFE_PQ_INTERP_ADDR_SZ-1:0] addr;
  input  [`DFE_PQ_INTERP_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DFE_PQ_INTERP_DATA_SZ-1:0] read_attr;
  input  [`DFE_PQ_INTERP_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
