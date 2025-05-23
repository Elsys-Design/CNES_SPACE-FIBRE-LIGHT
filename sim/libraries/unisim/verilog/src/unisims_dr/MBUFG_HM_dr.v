`include "B_MBUFG_HM_defines.vh"

reg [`MBUFG_HM_DATA_SZ-1:0] ATTR [0:`MBUFG_HM_ADDR_N-1];
reg [`MBUFG_HM__MODE_SZ:1] MODE_REG = MODE;
reg [`MBUFG_HM__STARTUP_SYNC_SZ:1] STARTUP_SYNC_REG = STARTUP_SYNC;

initial begin
  ATTR[`MBUFG_HM__MODE] = MODE;
  ATTR[`MBUFG_HM__STARTUP_SYNC] = STARTUP_SYNC;
end

always @(trig_attr) begin
  MODE_REG = ATTR[`MBUFG_HM__MODE];
  STARTUP_SYNC_REG = ATTR[`MBUFG_HM__STARTUP_SYNC];
end

// procedures to override, read attribute values

task write_attr;
  input  [`MBUFG_HM_ADDR_SZ-1:0] addr;
  input  [`MBUFG_HM_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`MBUFG_HM_DATA_SZ-1:0] read_attr;
  input  [`MBUFG_HM_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
