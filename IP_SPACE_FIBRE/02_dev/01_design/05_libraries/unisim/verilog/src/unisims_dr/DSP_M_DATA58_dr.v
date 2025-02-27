`include "B_DSP_M_DATA58_defines.vh"

reg [`DSP_M_DATA58_DATA_SZ-1:0] ATTR [0:`DSP_M_DATA58_ADDR_N-1];
reg [`DSP_M_DATA58__DSP_MODE_SZ:1] DSP_MODE_REG = DSP_MODE;
reg IS_RSTM_INVERTED_REG = IS_RSTM_INVERTED;
reg [`DSP_M_DATA58__MREG_SZ-1:0] MREG_REG = MREG;
reg [`DSP_M_DATA58__RESET_MODE_SZ:1] RESET_MODE_REG = RESET_MODE;
reg [`DSP_M_DATA58__USE_MULT_SZ:1] USE_MULT_REG = USE_MULT;

initial begin
  ATTR[`DSP_M_DATA58__DSP_MODE] = DSP_MODE;
  ATTR[`DSP_M_DATA58__IS_RSTM_INVERTED] = IS_RSTM_INVERTED;
  ATTR[`DSP_M_DATA58__MREG] = MREG;
  ATTR[`DSP_M_DATA58__RESET_MODE] = RESET_MODE;
  ATTR[`DSP_M_DATA58__USE_MULT] = USE_MULT;
end

always @(*) begin
  DSP_MODE_REG = ATTR[`DSP_M_DATA58__DSP_MODE];
  IS_RSTM_INVERTED_REG = ATTR[`DSP_M_DATA58__IS_RSTM_INVERTED];
  MREG_REG = ATTR[`DSP_M_DATA58__MREG];
  RESET_MODE_REG = ATTR[`DSP_M_DATA58__RESET_MODE];
  USE_MULT_REG = ATTR[`DSP_M_DATA58__USE_MULT];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_M_DATA58_ADDR_SZ-1:0] addr;
  input  [`DSP_M_DATA58_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_M_DATA58_DATA_SZ-1:0] read_attr;
  input  [`DSP_M_DATA58_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
