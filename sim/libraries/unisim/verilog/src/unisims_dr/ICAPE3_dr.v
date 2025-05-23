`include "B_ICAPE3_defines.vh"

reg [`ICAPE3_DATA_SZ-1:0] ATTR [0:`ICAPE3_ADDR_N-1];
reg [`ICAPE3__DEVICE_ID_SZ-1:0] DEVICE_ID_REG = DEVICE_ID;
reg [`ICAPE3__ICAP_AUTO_SWITCH_SZ:1] ICAP_AUTO_SWITCH_REG = ICAP_AUTO_SWITCH;
reg [`ICAPE3__SIM_CFG_FILE_NAME_SZ:1] SIM_CFG_FILE_NAME_REG = SIM_CFG_FILE_NAME;

initial begin
  ATTR[`ICAPE3__DEVICE_ID] = DEVICE_ID;
  ATTR[`ICAPE3__ICAP_AUTO_SWITCH] = ICAP_AUTO_SWITCH;
  ATTR[`ICAPE3__SIM_CFG_FILE_NAME] = SIM_CFG_FILE_NAME;
end

always @(trig_attr) begin
  DEVICE_ID_REG = ATTR[`ICAPE3__DEVICE_ID];
  ICAP_AUTO_SWITCH_REG = ATTR[`ICAPE3__ICAP_AUTO_SWITCH];
  SIM_CFG_FILE_NAME_REG = ATTR[`ICAPE3__SIM_CFG_FILE_NAME];
end

// procedures to override, read attribute values

task write_attr;
  input  [`ICAPE3_ADDR_SZ-1:0] addr;
  input  [`ICAPE3_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`ICAPE3_DATA_SZ-1:0] read_attr;
  input  [`ICAPE3_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
