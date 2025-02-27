`include "B_DSP_C_DATA_defines.vh"

reg [`DSP_C_DATA_DATA_SZ-1:0] ATTR [0:`DSP_C_DATA_ADDR_N-1];
reg [`DSP_C_DATA__CREG_SZ-1:0] CREG_REG = CREG;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg IS_RSTC_INVERTED_REG = IS_RSTC_INVERTED;

initial begin
  ATTR[`DSP_C_DATA__CREG] = CREG;
  ATTR[`DSP_C_DATA__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`DSP_C_DATA__IS_RSTC_INVERTED] = IS_RSTC_INVERTED;
end

always @(trig_attr) begin
  CREG_REG = ATTR[`DSP_C_DATA__CREG];
  IS_CLK_INVERTED_REG = ATTR[`DSP_C_DATA__IS_CLK_INVERTED];
  IS_RSTC_INVERTED_REG = ATTR[`DSP_C_DATA__IS_RSTC_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_C_DATA_ADDR_SZ-1:0] addr;
  input  [`DSP_C_DATA_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_C_DATA_DATA_SZ-1:0] read_attr;
  input  [`DSP_C_DATA_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
