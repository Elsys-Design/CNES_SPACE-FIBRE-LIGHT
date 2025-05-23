`include "B_DSP_C_DATA58_defines.vh"

reg [`DSP_C_DATA58_DATA_SZ-1:0] ATTR [0:`DSP_C_DATA58_ADDR_N-1];
reg [`DSP_C_DATA58__CREG_SZ-1:0] CREG_REG = CREG;
reg [`DSP_C_DATA58__DSP_MODE_SZ:1] DSP_MODE_REG = DSP_MODE;
reg IS_RSTC_INVERTED_REG = IS_RSTC_INVERTED;
reg [`DSP_C_DATA58__RESET_MODE_SZ:1] RESET_MODE_REG = RESET_MODE;

initial begin
  ATTR[`DSP_C_DATA58__CREG] = CREG;
  ATTR[`DSP_C_DATA58__DSP_MODE] = DSP_MODE;
  ATTR[`DSP_C_DATA58__IS_RSTC_INVERTED] = IS_RSTC_INVERTED;
  ATTR[`DSP_C_DATA58__RESET_MODE] = RESET_MODE;
end

always @(*) begin
  CREG_REG = ATTR[`DSP_C_DATA58__CREG];
  DSP_MODE_REG = ATTR[`DSP_C_DATA58__DSP_MODE];
  IS_RSTC_INVERTED_REG = ATTR[`DSP_C_DATA58__IS_RSTC_INVERTED];
  RESET_MODE_REG = ATTR[`DSP_C_DATA58__RESET_MODE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_C_DATA58_ADDR_SZ-1:0] addr;
  input  [`DSP_C_DATA58_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_C_DATA58_DATA_SZ-1:0] read_attr;
  input  [`DSP_C_DATA58_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
