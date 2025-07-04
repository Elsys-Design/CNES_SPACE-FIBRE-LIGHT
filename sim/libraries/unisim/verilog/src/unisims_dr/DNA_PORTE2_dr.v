`include "B_DNA_PORTE2_defines.vh"

reg [`DNA_PORTE2_DATA_SZ-1:0] ATTR [0:`DNA_PORTE2_ADDR_N-1];
reg [`DNA_PORTE2__SIM_DNA_VALUE_SZ-1:0] SIM_DNA_VALUE_REG = SIM_DNA_VALUE;

initial begin
  ATTR[`DNA_PORTE2__SIM_DNA_VALUE] = SIM_DNA_VALUE;
end

always @(trig_attr) begin
  SIM_DNA_VALUE_REG = ATTR[`DNA_PORTE2__SIM_DNA_VALUE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DNA_PORTE2_ADDR_SZ-1:0] addr;
  input  [`DNA_PORTE2_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DNA_PORTE2_DATA_SZ-1:0] read_attr;
  input  [`DNA_PORTE2_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
