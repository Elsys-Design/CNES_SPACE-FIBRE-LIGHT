`include "B_DSP_M_DATA_defines.vh"

reg [`DSP_M_DATA_DATA_SZ-1:0] ATTR [0:`DSP_M_DATA_ADDR_N-1];
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg IS_RSTM_INVERTED_REG = IS_RSTM_INVERTED;
reg [`DSP_M_DATA__MREG_SZ-1:0] MREG_REG = MREG;

initial begin
  ATTR[`DSP_M_DATA__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`DSP_M_DATA__IS_RSTM_INVERTED] = IS_RSTM_INVERTED;
  ATTR[`DSP_M_DATA__MREG] = MREG;
end

always @(trig_attr) begin
  IS_CLK_INVERTED_REG = ATTR[`DSP_M_DATA__IS_CLK_INVERTED];
  IS_RSTM_INVERTED_REG = ATTR[`DSP_M_DATA__IS_RSTM_INVERTED];
  MREG_REG = ATTR[`DSP_M_DATA__MREG];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_M_DATA_ADDR_SZ-1:0] addr;
  input  [`DSP_M_DATA_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_M_DATA_DATA_SZ-1:0] read_attr;
  input  [`DSP_M_DATA_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
