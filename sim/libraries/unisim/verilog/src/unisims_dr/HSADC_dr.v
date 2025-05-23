`include "B_HSADC_defines.vh"

reg [`HSADC_DATA_SZ-1:0] ATTR [0:`HSADC_ADDR_N-1];
reg [`HSADC__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
reg [`HSADC__XPA_CFG0_SZ-1:0] XPA_CFG0_REG = XPA_CFG0;
reg [`HSADC__XPA_CFG1_SZ-1:0] XPA_CFG1_REG = XPA_CFG1;
reg [`HSADC__XPA_NUM_ADCS_SZ:1] XPA_NUM_ADCS_REG = XPA_NUM_ADCS;
reg [`HSADC__XPA_NUM_DDCS_SZ-1:0] XPA_NUM_DDCS_REG = XPA_NUM_DDCS;
reg [`HSADC__XPA_PLL_USED_SZ:1] XPA_PLL_USED_REG = XPA_PLL_USED;
reg [`HSADC__XPA_SAMPLE_RATE_MSPS_SZ-1:0] XPA_SAMPLE_RATE_MSPS_REG = XPA_SAMPLE_RATE_MSPS;

initial begin
  ATTR[`HSADC__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`HSADC__XPA_CFG0] = XPA_CFG0;
  ATTR[`HSADC__XPA_CFG1] = XPA_CFG1;
  ATTR[`HSADC__XPA_NUM_ADCS] = XPA_NUM_ADCS;
  ATTR[`HSADC__XPA_NUM_DDCS] = XPA_NUM_DDCS;
  ATTR[`HSADC__XPA_PLL_USED] = XPA_PLL_USED;
  ATTR[`HSADC__XPA_SAMPLE_RATE_MSPS] = XPA_SAMPLE_RATE_MSPS;
end

always @(trig_attr) begin
  SIM_DEVICE_REG = ATTR[`HSADC__SIM_DEVICE];
  XPA_CFG0_REG = ATTR[`HSADC__XPA_CFG0];
  XPA_CFG1_REG = ATTR[`HSADC__XPA_CFG1];
  XPA_NUM_ADCS_REG = ATTR[`HSADC__XPA_NUM_ADCS];
  XPA_NUM_DDCS_REG = ATTR[`HSADC__XPA_NUM_DDCS];
  XPA_PLL_USED_REG = ATTR[`HSADC__XPA_PLL_USED];
  XPA_SAMPLE_RATE_MSPS_REG = ATTR[`HSADC__XPA_SAMPLE_RATE_MSPS];
end

// procedures to override, read attribute values

task write_attr;
  input  [`HSADC_ADDR_SZ-1:0] addr;
  input  [`HSADC_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`HSADC_DATA_SZ-1:0] read_attr;
  input  [`HSADC_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
