`include "B_BUFG_GT_defines.vh"

reg [`BUFG_GT_DATA_SZ-1:0] ATTR [0:`BUFG_GT_ADDR_N-1];
reg [`BUFG_GT__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
reg [`BUFG_GT__STARTUP_SYNC_SZ:1] STARTUP_SYNC_REG = STARTUP_SYNC;

initial begin
  ATTR[`BUFG_GT__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`BUFG_GT__STARTUP_SYNC] = STARTUP_SYNC;
end

always @(trig_attr) begin
  SIM_DEVICE_REG = ATTR[`BUFG_GT__SIM_DEVICE];
  STARTUP_SYNC_REG = ATTR[`BUFG_GT__STARTUP_SYNC];
end

// procedures to override, read attribute values

task write_attr;
  input  [`BUFG_GT_ADDR_SZ-1:0] addr;
  input  [`BUFG_GT_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`BUFG_GT_DATA_SZ-1:0] read_attr;
  input  [`BUFG_GT_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
