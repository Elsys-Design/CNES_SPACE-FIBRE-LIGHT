`include "B_BUFR_defines.vh"

reg [`BUFR_DATA_SZ-1:0] ATTR [0:`BUFR_ADDR_N-1];
reg [`BUFR__BUFR_DIVIDE_SZ:1] BUFR_DIVIDE_REG = BUFR_DIVIDE;
reg [`BUFR__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;

initial begin
  ATTR[`BUFR__BUFR_DIVIDE] = BUFR_DIVIDE;
  ATTR[`BUFR__SIM_DEVICE] = SIM_DEVICE;
end

always @(trig_attr) begin
  BUFR_DIVIDE_REG = ATTR[`BUFR__BUFR_DIVIDE];
  SIM_DEVICE_REG = ATTR[`BUFR__SIM_DEVICE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`BUFR_ADDR_SZ-1:0] addr;
  input  [`BUFR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`BUFR_DATA_SZ-1:0] read_attr;
  input  [`BUFR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
