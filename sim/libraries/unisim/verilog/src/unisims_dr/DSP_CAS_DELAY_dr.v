`include "B_DSP_CAS_DELAY_defines.vh"

reg [`DSP_CAS_DELAY_DATA_SZ-1:0] ATTR [0:`DSP_CAS_DELAY_ADDR_N-1];
reg [`DSP_CAS_DELAY__DELAY_SZ:1] DELAY_REG = DELAY;

initial begin
  ATTR[`DSP_CAS_DELAY__DELAY] = DELAY;
end

always @(trig_attr) begin
  DELAY_REG = ATTR[`DSP_CAS_DELAY__DELAY];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_CAS_DELAY_ADDR_SZ-1:0] addr;
  input  [`DSP_CAS_DELAY_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_CAS_DELAY_DATA_SZ-1:0] read_attr;
  input  [`DSP_CAS_DELAY_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
