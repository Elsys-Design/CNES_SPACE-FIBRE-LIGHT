`include "B_DSP_M_DATA58_TEST_defines.vh"

reg [`DSP_M_DATA58_TEST_DATA_SZ-1:0] ATTR [0:`DSP_M_DATA58_TEST_ADDR_N-1];
reg [48:1] DSP_MODE_REG = DSP_MODE;
reg [56:1] EN_SCAN_REG = EN_SCAN;
reg IS_RSTM_INVERTED_REG = IS_RSTM_INVERTED;
reg [31:0] MREG_REG = MREG;
reg [40:1] RESET_MODE_REG = RESET_MODE;

initial begin
  ATTR[`DSP_M_DATA58_TEST__DSP_MODE] = DSP_MODE;
  ATTR[`DSP_M_DATA58_TEST__EN_SCAN] = EN_SCAN;
  ATTR[`DSP_M_DATA58_TEST__IS_RSTM_INVERTED] = IS_RSTM_INVERTED;
  ATTR[`DSP_M_DATA58_TEST__MREG] = MREG;
  ATTR[`DSP_M_DATA58_TEST__RESET_MODE] = RESET_MODE;
end

always @(trig_attr) begin
  DSP_MODE_REG = ATTR[`DSP_M_DATA58_TEST__DSP_MODE];
  EN_SCAN_REG = ATTR[`DSP_M_DATA58_TEST__EN_SCAN];
  IS_RSTM_INVERTED_REG = ATTR[`DSP_M_DATA58_TEST__IS_RSTM_INVERTED];
  MREG_REG = ATTR[`DSP_M_DATA58_TEST__MREG];
  RESET_MODE_REG = ATTR[`DSP_M_DATA58_TEST__RESET_MODE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_M_DATA58_TEST_ADDR_SZ-1:0] addr;
  input  [`DSP_M_DATA58_TEST_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_M_DATA58_TEST_DATA_SZ-1:0] read_attr;
  input  [`DSP_M_DATA58_TEST_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
