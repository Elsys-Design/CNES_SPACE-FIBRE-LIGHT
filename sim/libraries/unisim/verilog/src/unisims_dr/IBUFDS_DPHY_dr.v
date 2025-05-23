`include "B_IBUFDS_DPHY_defines.vh"

reg [`IBUFDS_DPHY_DATA_SZ-1:0] ATTR [0:`IBUFDS_DPHY_ADDR_N-1];
reg [`IBUFDS_DPHY__DIFF_TERM_SZ:1] DIFF_TERM_REG = DIFF_TERM;
reg [`IBUFDS_DPHY__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;
reg [`IBUFDS_DPHY__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;

initial begin
  ATTR[`IBUFDS_DPHY__DIFF_TERM] = DIFF_TERM;
  ATTR[`IBUFDS_DPHY__IOSTANDARD] = IOSTANDARD;
  ATTR[`IBUFDS_DPHY__SIM_DEVICE] = SIM_DEVICE;
end

always @(trig_attr) begin
  DIFF_TERM_REG = ATTR[`IBUFDS_DPHY__DIFF_TERM];
  IOSTANDARD_REG = ATTR[`IBUFDS_DPHY__IOSTANDARD];
  SIM_DEVICE_REG = ATTR[`IBUFDS_DPHY__SIM_DEVICE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IBUFDS_DPHY_ADDR_SZ-1:0] addr;
  input  [`IBUFDS_DPHY_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IBUFDS_DPHY_DATA_SZ-1:0] read_attr;
  input  [`IBUFDS_DPHY_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
