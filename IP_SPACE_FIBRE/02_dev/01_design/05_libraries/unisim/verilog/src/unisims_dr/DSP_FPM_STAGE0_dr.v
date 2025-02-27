`include "B_DSP_FPM_STAGE0_defines.vh"

reg [`DSP_FPM_STAGE0_DATA_SZ-1:0] ATTR [0:`DSP_FPM_STAGE0_ADDR_N-1];
reg [`DSP_FPM_STAGE0__A_FPTYPE_SZ:1] A_FPTYPE_REG = A_FPTYPE;
reg [`DSP_FPM_STAGE0__B_D_FPTYPE_SZ:1] B_D_FPTYPE_REG = B_D_FPTYPE;
reg [`DSP_FPM_STAGE0__LEGACY_SZ:1] LEGACY_REG = LEGACY;
reg [`DSP_FPM_STAGE0__USE_MULT_SZ:1] USE_MULT_REG = USE_MULT;

initial begin
  ATTR[`DSP_FPM_STAGE0__A_FPTYPE] = A_FPTYPE;
  ATTR[`DSP_FPM_STAGE0__B_D_FPTYPE] = B_D_FPTYPE;
  ATTR[`DSP_FPM_STAGE0__LEGACY] = LEGACY;
  ATTR[`DSP_FPM_STAGE0__USE_MULT] = USE_MULT;
end

always @(trig_attr) begin
  A_FPTYPE_REG = ATTR[`DSP_FPM_STAGE0__A_FPTYPE];
  B_D_FPTYPE_REG = ATTR[`DSP_FPM_STAGE0__B_D_FPTYPE];
  LEGACY_REG = ATTR[`DSP_FPM_STAGE0__LEGACY];
  USE_MULT_REG = ATTR[`DSP_FPM_STAGE0__USE_MULT];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_FPM_STAGE0_ADDR_SZ-1:0] addr;
  input  [`DSP_FPM_STAGE0_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_FPM_STAGE0_DATA_SZ-1:0] read_attr;
  input  [`DSP_FPM_STAGE0_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
