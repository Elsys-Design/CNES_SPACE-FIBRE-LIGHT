`include "B_LCLK_DELAY_defines.vh"

reg [`LCLK_DELAY_DATA_SZ-1:0] ATTR [0:`LCLK_DELAY_ADDR_N-1];
reg [`LCLK_DELAY__DELAY_SZ:1] DELAY_REG = DELAY;
reg [`LCLK_DELAY__GEN_PULSE_SZ:1] GEN_PULSE_REG = GEN_PULSE;
reg [`LCLK_DELAY__USE_CASC_IN_SZ:1] USE_CASC_IN_REG = USE_CASC_IN;

initial begin
  ATTR[`LCLK_DELAY__DELAY] = DELAY;
  ATTR[`LCLK_DELAY__GEN_PULSE] = GEN_PULSE;
  ATTR[`LCLK_DELAY__USE_CASC_IN] = USE_CASC_IN;
end

always @(trig_attr) begin
  DELAY_REG = ATTR[`LCLK_DELAY__DELAY];
  GEN_PULSE_REG = ATTR[`LCLK_DELAY__GEN_PULSE];
  USE_CASC_IN_REG = ATTR[`LCLK_DELAY__USE_CASC_IN];
end

// procedures to override, read attribute values

task write_attr;
  input  [`LCLK_DELAY_ADDR_SZ-1:0] addr;
  input  [`LCLK_DELAY_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`LCLK_DELAY_DATA_SZ-1:0] read_attr;
  input  [`LCLK_DELAY_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
