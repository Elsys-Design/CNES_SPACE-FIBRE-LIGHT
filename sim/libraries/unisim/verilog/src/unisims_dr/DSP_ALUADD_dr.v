`include "B_DSP_ALUADD_defines.vh"

reg [`DSP_ALUADD_DATA_SZ-1:0] ATTR [0:`DSP_ALUADD_ADDR_N-1];
reg [`DSP_ALUADD__LEGACY_SZ:1] LEGACY_REG = LEGACY;
reg [`DSP_ALUADD__USE_SIMD_SZ:1] USE_SIMD_REG = USE_SIMD;
reg [`DSP_ALUADD__USE_WIDEXOR_SZ:1] USE_WIDEXOR_REG = USE_WIDEXOR;
reg [`DSP_ALUADD__XORSIMD_SZ:1] XORSIMD_REG = XORSIMD;

initial begin
  ATTR[`DSP_ALUADD__LEGACY] = LEGACY;
  ATTR[`DSP_ALUADD__USE_SIMD] = USE_SIMD;
  ATTR[`DSP_ALUADD__USE_WIDEXOR] = USE_WIDEXOR;
  ATTR[`DSP_ALUADD__XORSIMD] = XORSIMD;
end

always @(*) begin
  LEGACY_REG = ATTR[`DSP_ALUADD__LEGACY];
  USE_SIMD_REG = ATTR[`DSP_ALUADD__USE_SIMD];
  USE_WIDEXOR_REG = ATTR[`DSP_ALUADD__USE_WIDEXOR];
  XORSIMD_REG = ATTR[`DSP_ALUADD__XORSIMD];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_ALUADD_ADDR_SZ-1:0] addr;
  input  [`DSP_ALUADD_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_ALUADD_DATA_SZ-1:0] read_attr;
  input  [`DSP_ALUADD_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
