`include "B_HSADC_TEST_defines.vh"

reg [`HSADC_TEST_DATA_SZ-1:0] ATTR [0:`HSADC_TEST_ADDR_N-1];
reg [15:0] XPA_CFG0_REG = XPA_CFG0;
reg [15:0] XPA_CFG1_REG = XPA_CFG1;
reg [16:1] XPA_NUM_ADCS_REG = XPA_NUM_ADCS;
reg [2:0] XPA_NUM_DDCS_REG = XPA_NUM_DDCS;
reg [24:1] XPA_PLL_USED_REG = XPA_PLL_USED;
reg [13:0] XPA_SAMPLE_RATE_MSPS_REG = XPA_SAMPLE_RATE_MSPS;

initial begin
  ATTR[`HSADC_TEST__XPA_CFG0] = XPA_CFG0;
  ATTR[`HSADC_TEST__XPA_CFG1] = XPA_CFG1;
  ATTR[`HSADC_TEST__XPA_NUM_ADCS] = XPA_NUM_ADCS;
  ATTR[`HSADC_TEST__XPA_NUM_DDCS] = XPA_NUM_DDCS;
  ATTR[`HSADC_TEST__XPA_PLL_USED] = XPA_PLL_USED;
  ATTR[`HSADC_TEST__XPA_SAMPLE_RATE_MSPS] = XPA_SAMPLE_RATE_MSPS;
end

always @(trig_attr) begin
  XPA_CFG0_REG = ATTR[`HSADC_TEST__XPA_CFG0];
  XPA_CFG1_REG = ATTR[`HSADC_TEST__XPA_CFG1];
  XPA_NUM_ADCS_REG = ATTR[`HSADC_TEST__XPA_NUM_ADCS];
  XPA_NUM_DDCS_REG = ATTR[`HSADC_TEST__XPA_NUM_DDCS];
  XPA_PLL_USED_REG = ATTR[`HSADC_TEST__XPA_PLL_USED];
  XPA_SAMPLE_RATE_MSPS_REG = ATTR[`HSADC_TEST__XPA_SAMPLE_RATE_MSPS];
end

// procedures to override, read attribute values

task write_attr;
  input  [`HSADC_TEST_ADDR_SZ-1:0] addr;
  input  [`HSADC_TEST_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`HSADC_TEST_DATA_SZ-1:0] read_attr;
  input  [`HSADC_TEST_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
