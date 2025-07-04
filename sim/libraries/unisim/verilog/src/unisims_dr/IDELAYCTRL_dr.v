`include "B_IDELAYCTRL_defines.vh"

reg [`IDELAYCTRL_DATA_SZ-1:0] ATTR [0:`IDELAYCTRL_ADDR_N-1];
reg [`IDELAYCTRL__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;

initial begin
  ATTR[`IDELAYCTRL__SIM_DEVICE] = SIM_DEVICE;
end

always @(trig_attr) begin
  SIM_DEVICE_REG = ATTR[`IDELAYCTRL__SIM_DEVICE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IDELAYCTRL_ADDR_SZ-1:0] addr;
  input  [`IDELAYCTRL_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IDELAYCTRL_DATA_SZ-1:0] read_attr;
  input  [`IDELAYCTRL_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
