`include "B_DSP_MULTIPLIER_defines.vh"

reg [`DSP_MULTIPLIER_DATA_SZ-1:0] ATTR [0:`DSP_MULTIPLIER_ADDR_N-1];
reg [`DSP_MULTIPLIER__AMULTSEL_SZ:1] AMULTSEL_REG = AMULTSEL;
reg [`DSP_MULTIPLIER__BMULTSEL_SZ:1] BMULTSEL_REG = BMULTSEL;
reg [`DSP_MULTIPLIER__USE_MULT_SZ:1] USE_MULT_REG = USE_MULT;

initial begin
  ATTR[`DSP_MULTIPLIER__AMULTSEL] = AMULTSEL;
  ATTR[`DSP_MULTIPLIER__BMULTSEL] = BMULTSEL;
  ATTR[`DSP_MULTIPLIER__USE_MULT] = USE_MULT;
end

always @(trig_attr) begin
  AMULTSEL_REG = ATTR[`DSP_MULTIPLIER__AMULTSEL];
  BMULTSEL_REG = ATTR[`DSP_MULTIPLIER__BMULTSEL];
  USE_MULT_REG = ATTR[`DSP_MULTIPLIER__USE_MULT];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_MULTIPLIER_ADDR_SZ-1:0] addr;
  input  [`DSP_MULTIPLIER_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_MULTIPLIER_DATA_SZ-1:0] read_attr;
  input  [`DSP_MULTIPLIER_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
