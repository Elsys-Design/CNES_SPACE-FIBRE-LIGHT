`include "B_MBUFGCE_defines.vh"

reg [`MBUFGCE_DATA_SZ-1:0] ATTR [0:`MBUFGCE_ADDR_N-1];
reg [`MBUFGCE__CE_TYPE_SZ:1] CE_TYPE_REG = CE_TYPE;
reg IS_CE_INVERTED_REG = IS_CE_INVERTED;
reg IS_I_INVERTED_REG = IS_I_INVERTED;
reg [`MBUFGCE__MODE_SZ:1] MODE_REG = MODE;
reg [`MBUFGCE__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
reg [`MBUFGCE__STARTUP_SYNC_SZ:1] STARTUP_SYNC_REG = STARTUP_SYNC;

initial begin
  ATTR[`MBUFGCE__CE_TYPE] = CE_TYPE;
  ATTR[`MBUFGCE__IS_CE_INVERTED] = IS_CE_INVERTED;
  ATTR[`MBUFGCE__IS_I_INVERTED] = IS_I_INVERTED;
  ATTR[`MBUFGCE__MODE] = MODE;
  ATTR[`MBUFGCE__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`MBUFGCE__STARTUP_SYNC] = STARTUP_SYNC;
end

always @(trig_attr) begin
  CE_TYPE_REG = ATTR[`MBUFGCE__CE_TYPE];
  IS_CE_INVERTED_REG = ATTR[`MBUFGCE__IS_CE_INVERTED];
  IS_I_INVERTED_REG = ATTR[`MBUFGCE__IS_I_INVERTED];
  MODE_REG = ATTR[`MBUFGCE__MODE];
  SIM_DEVICE_REG = ATTR[`MBUFGCE__SIM_DEVICE];
  STARTUP_SYNC_REG = ATTR[`MBUFGCE__STARTUP_SYNC];
end

// procedures to override, read attribute values

task write_attr;
  input  [`MBUFGCE_ADDR_SZ-1:0] addr;
  input  [`MBUFGCE_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`MBUFGCE_DATA_SZ-1:0] read_attr;
  input  [`MBUFGCE_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
