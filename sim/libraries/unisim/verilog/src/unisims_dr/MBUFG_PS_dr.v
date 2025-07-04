`include "B_MBUFG_PS_defines.vh"

reg [`MBUFG_PS_DATA_SZ-1:0] ATTR [0:`MBUFG_PS_ADDR_N-1];
reg [`MBUFG_PS__MODE_SZ:1] MODE_REG = MODE;
reg [`MBUFG_PS__STARTUP_SYNC_SZ:1] STARTUP_SYNC_REG = STARTUP_SYNC;

initial begin
  ATTR[`MBUFG_PS__MODE] = MODE;
  ATTR[`MBUFG_PS__STARTUP_SYNC] = STARTUP_SYNC;
end

always @(trig_attr) begin
  MODE_REG = ATTR[`MBUFG_PS__MODE];
  STARTUP_SYNC_REG = ATTR[`MBUFG_PS__STARTUP_SYNC];
end

// procedures to override, read attribute values

task write_attr;
  input  [`MBUFG_PS_ADDR_SZ-1:0] addr;
  input  [`MBUFG_PS_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`MBUFG_PS_DATA_SZ-1:0] read_attr;
  input  [`MBUFG_PS_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
