`include "B_HSDAC_defines.vh"

reg [`HSDAC_DATA_SZ-1:0] ATTR [0:`HSDAC_ADDR_N-1];
reg [`HSDAC__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
reg [`HSDAC__XPA_CFG0_SZ-1:0] XPA_CFG0_REG = XPA_CFG0;
reg [`HSDAC__XPA_CFG1_SZ-1:0] XPA_CFG1_REG = XPA_CFG1;
reg [`HSDAC__XPA_NUM_DACS_SZ-1:0] XPA_NUM_DACS_REG = XPA_NUM_DACS;
reg [`HSDAC__XPA_NUM_DUCS_SZ-1:0] XPA_NUM_DUCS_REG = XPA_NUM_DUCS;
reg [`HSDAC__XPA_PLL_USED_SZ:1] XPA_PLL_USED_REG = XPA_PLL_USED;
reg [`HSDAC__XPA_SAMPLE_RATE_MSPS_SZ-1:0] XPA_SAMPLE_RATE_MSPS_REG = XPA_SAMPLE_RATE_MSPS;

initial begin
  ATTR[`HSDAC__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`HSDAC__XPA_CFG0] = XPA_CFG0;
  ATTR[`HSDAC__XPA_CFG1] = XPA_CFG1;
  ATTR[`HSDAC__XPA_NUM_DACS] = XPA_NUM_DACS;
  ATTR[`HSDAC__XPA_NUM_DUCS] = XPA_NUM_DUCS;
  ATTR[`HSDAC__XPA_PLL_USED] = XPA_PLL_USED;
  ATTR[`HSDAC__XPA_SAMPLE_RATE_MSPS] = XPA_SAMPLE_RATE_MSPS;
end

always @(trig_attr) begin
  SIM_DEVICE_REG = ATTR[`HSDAC__SIM_DEVICE];
  XPA_CFG0_REG = ATTR[`HSDAC__XPA_CFG0];
  XPA_CFG1_REG = ATTR[`HSDAC__XPA_CFG1];
  XPA_NUM_DACS_REG = ATTR[`HSDAC__XPA_NUM_DACS];
  XPA_NUM_DUCS_REG = ATTR[`HSDAC__XPA_NUM_DUCS];
  XPA_PLL_USED_REG = ATTR[`HSDAC__XPA_PLL_USED];
  XPA_SAMPLE_RATE_MSPS_REG = ATTR[`HSDAC__XPA_SAMPLE_RATE_MSPS];
end

// procedures to override, read attribute values

task write_attr;
  input  [`HSDAC_ADDR_SZ-1:0] addr;
  input  [`HSDAC_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`HSDAC_DATA_SZ-1:0] read_attr;
  input  [`HSDAC_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
