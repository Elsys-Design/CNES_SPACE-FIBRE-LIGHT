`include "B_DSP_FPA_CREG_defines.vh"

reg [`DSP_FPA_CREG_DATA_SZ-1:0] ATTR [0:`DSP_FPA_CREG_ADDR_N-1];
reg [`DSP_FPA_CREG__FPCREG_SZ-1:0] FPCREG_REG = FPCREG;
reg IS_RSTC_INVERTED_REG = IS_RSTC_INVERTED;
reg [`DSP_FPA_CREG__LEGACY_SZ:1] LEGACY_REG = LEGACY;
reg [`DSP_FPA_CREG__RESET_MODE_SZ:1] RESET_MODE_REG = RESET_MODE;

initial begin
  ATTR[`DSP_FPA_CREG__FPCREG] = FPCREG;
  ATTR[`DSP_FPA_CREG__IS_RSTC_INVERTED] = IS_RSTC_INVERTED;
  ATTR[`DSP_FPA_CREG__LEGACY] = LEGACY;
  ATTR[`DSP_FPA_CREG__RESET_MODE] = RESET_MODE;
end

always @(trig_attr) begin
  FPCREG_REG = ATTR[`DSP_FPA_CREG__FPCREG];
  IS_RSTC_INVERTED_REG = ATTR[`DSP_FPA_CREG__IS_RSTC_INVERTED];
  LEGACY_REG = ATTR[`DSP_FPA_CREG__LEGACY];
  RESET_MODE_REG = ATTR[`DSP_FPA_CREG__RESET_MODE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_FPA_CREG_ADDR_SZ-1:0] addr;
  input  [`DSP_FPA_CREG_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_FPA_CREG_DATA_SZ-1:0] read_attr;
  input  [`DSP_FPA_CREG_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
