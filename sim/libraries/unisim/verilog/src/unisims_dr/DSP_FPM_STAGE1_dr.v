`include "B_DSP_FPM_STAGE1_defines.vh"

reg [`DSP_FPM_STAGE1_DATA_SZ-1:0] ATTR [0:`DSP_FPM_STAGE1_ADDR_N-1];
reg [`DSP_FPM_STAGE1__LEGACY_SZ:1] LEGACY_REG = LEGACY;

initial begin
  ATTR[`DSP_FPM_STAGE1__LEGACY] = LEGACY;
end

always @(trig_attr) begin
  LEGACY_REG = ATTR[`DSP_FPM_STAGE1__LEGACY];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_FPM_STAGE1_ADDR_SZ-1:0] addr;
  input  [`DSP_FPM_STAGE1_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_FPM_STAGE1_DATA_SZ-1:0] read_attr;
  input  [`DSP_FPM_STAGE1_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
