`include "B_DSP_PATDET_defines.vh"

reg [`DSP_PATDET_DATA_SZ-1:0] ATTR [0:`DSP_PATDET_ADDR_N-1];
reg [`DSP_PATDET__MASK_SZ-1:0] MASK_REG = MASK;
reg [`DSP_PATDET__PATTERN_SZ-1:0] PATTERN_REG = PATTERN;
reg [`DSP_PATDET__SEL_MASK_SZ:1] SEL_MASK_REG = SEL_MASK;
reg [`DSP_PATDET__SEL_PATTERN_SZ:1] SEL_PATTERN_REG = SEL_PATTERN;
reg [`DSP_PATDET__USE_PATTERN_DETECT_SZ:1] USE_PATTERN_DETECT_REG = USE_PATTERN_DETECT;

initial begin
  ATTR[`DSP_PATDET__MASK] = MASK;
  ATTR[`DSP_PATDET__PATTERN] = PATTERN;
  ATTR[`DSP_PATDET__SEL_MASK] = SEL_MASK;
  ATTR[`DSP_PATDET__SEL_PATTERN] = SEL_PATTERN;
  ATTR[`DSP_PATDET__USE_PATTERN_DETECT] = USE_PATTERN_DETECT;
end

always @(*) begin
  MASK_REG = ATTR[`DSP_PATDET__MASK];
  PATTERN_REG = ATTR[`DSP_PATDET__PATTERN];
  SEL_MASK_REG = ATTR[`DSP_PATDET__SEL_MASK];
  SEL_PATTERN_REG = ATTR[`DSP_PATDET__SEL_PATTERN];
  USE_PATTERN_DETECT_REG = ATTR[`DSP_PATDET__USE_PATTERN_DETECT];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_PATDET_ADDR_SZ-1:0] addr;
  input  [`DSP_PATDET_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_PATDET_DATA_SZ-1:0] read_attr;
  input  [`DSP_PATDET_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
