`include "B_DSP_DFX_defines.vh"

reg [`DSP_DFX_DATA_SZ-1:0] ATTR [0:`DSP_DFX_ADDR_N-1];
reg CSSD_CLKSYNC_BYP_SEL_REG = CSSD_CLKSYNC_BYP_SEL;
reg CSSD_EN_REG = CSSD_EN;
reg DFX_ROOTCLK_SEL_REG = DFX_ROOTCLK_SEL;
reg [`DSP_DFX__DSP_MODE_SZ:1] DSP_MODE_REG = DSP_MODE;
reg SCAN_IN_FROM_FABRIC_0_REG = SCAN_IN_FROM_FABRIC_0;
reg SCAN_IN_FROM_FABRIC_1_REG = SCAN_IN_FROM_FABRIC_1;
reg SCAN_TEST_EN_REG = SCAN_TEST_EN;

initial begin
  ATTR[`DSP_DFX__CSSD_CLKSYNC_BYP_SEL] = CSSD_CLKSYNC_BYP_SEL;
  ATTR[`DSP_DFX__CSSD_EN] = CSSD_EN;
  ATTR[`DSP_DFX__DFX_ROOTCLK_SEL] = DFX_ROOTCLK_SEL;
  ATTR[`DSP_DFX__DSP_MODE] = DSP_MODE;
  ATTR[`DSP_DFX__SCAN_IN_FROM_FABRIC_0] = SCAN_IN_FROM_FABRIC_0;
  ATTR[`DSP_DFX__SCAN_IN_FROM_FABRIC_1] = SCAN_IN_FROM_FABRIC_1;
  ATTR[`DSP_DFX__SCAN_TEST_EN] = SCAN_TEST_EN;
end

always @(trig_attr) begin
  CSSD_CLKSYNC_BYP_SEL_REG = ATTR[`DSP_DFX__CSSD_CLKSYNC_BYP_SEL];
  CSSD_EN_REG = ATTR[`DSP_DFX__CSSD_EN];
  DFX_ROOTCLK_SEL_REG = ATTR[`DSP_DFX__DFX_ROOTCLK_SEL];
  DSP_MODE_REG = ATTR[`DSP_DFX__DSP_MODE];
  SCAN_IN_FROM_FABRIC_0_REG = ATTR[`DSP_DFX__SCAN_IN_FROM_FABRIC_0];
  SCAN_IN_FROM_FABRIC_1_REG = ATTR[`DSP_DFX__SCAN_IN_FROM_FABRIC_1];
  SCAN_TEST_EN_REG = ATTR[`DSP_DFX__SCAN_TEST_EN];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_DFX_ADDR_SZ-1:0] addr;
  input  [`DSP_DFX_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_DFX_DATA_SZ-1:0] read_attr;
  input  [`DSP_DFX_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
