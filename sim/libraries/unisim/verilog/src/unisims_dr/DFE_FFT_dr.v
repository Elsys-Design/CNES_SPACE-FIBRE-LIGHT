`include "B_DFE_FFT_defines.vh"

reg [`DFE_FFT_DATA_SZ-1:0] ATTR [0:`DFE_FFT_ADDR_N-1];
real ACTIVE_DUTYCYCLE_REG = ACTIVE_DUTYCYCLE;
real CLK_FREQ_REG = CLK_FREQ;
reg [`DFE_FFT__MAX_POINT_SIZE_SZ:1] MAX_POINT_SIZE_REG = MAX_POINT_SIZE;
reg [`DFE_FFT__POINT_SIZE_SZ:1] POINT_SIZE_REG = POINT_SIZE;
real THROUGHPUT_REG = THROUGHPUT;
reg [`DFE_FFT__XPA_CFG0_SZ-1:0] XPA_CFG0_REG = XPA_CFG0;

initial begin
  ATTR[`DFE_FFT__ACTIVE_DUTYCYCLE] = $realtobits(ACTIVE_DUTYCYCLE);
  ATTR[`DFE_FFT__CLK_FREQ] = $realtobits(CLK_FREQ);
  ATTR[`DFE_FFT__MAX_POINT_SIZE] = MAX_POINT_SIZE;
  ATTR[`DFE_FFT__POINT_SIZE] = POINT_SIZE;
  ATTR[`DFE_FFT__THROUGHPUT] = $realtobits(THROUGHPUT);
  ATTR[`DFE_FFT__XPA_CFG0] = XPA_CFG0;
end

always @(trig_attr) begin
  ACTIVE_DUTYCYCLE_REG = $bitstoreal(ATTR[`DFE_FFT__ACTIVE_DUTYCYCLE]);
  CLK_FREQ_REG = $bitstoreal(ATTR[`DFE_FFT__CLK_FREQ]);
  MAX_POINT_SIZE_REG = ATTR[`DFE_FFT__MAX_POINT_SIZE];
  POINT_SIZE_REG = ATTR[`DFE_FFT__POINT_SIZE];
  THROUGHPUT_REG = $bitstoreal(ATTR[`DFE_FFT__THROUGHPUT]);
  XPA_CFG0_REG = ATTR[`DFE_FFT__XPA_CFG0];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DFE_FFT_ADDR_SZ-1:0] addr;
  input  [`DFE_FFT_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DFE_FFT_DATA_SZ-1:0] read_attr;
  input  [`DFE_FFT_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
