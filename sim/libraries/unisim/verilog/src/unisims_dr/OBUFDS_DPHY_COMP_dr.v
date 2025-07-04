`include "B_OBUFDS_DPHY_COMP_defines.vh"

reg [`OBUFDS_DPHY_COMP_DATA_SZ-1:0] ATTR [0:`OBUFDS_DPHY_COMP_ADDR_N-1];
reg [`OBUFDS_DPHY_COMP__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;

initial begin
  ATTR[`OBUFDS_DPHY_COMP__IOSTANDARD] = IOSTANDARD;
end

always @(trig_attr) begin
  IOSTANDARD_REG = ATTR[`OBUFDS_DPHY_COMP__IOSTANDARD];
end

// procedures to override, read attribute values

task write_attr;
  input  [`OBUFDS_DPHY_COMP_ADDR_SZ-1:0] addr;
  input  [`OBUFDS_DPHY_COMP_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`OBUFDS_DPHY_COMP_DATA_SZ-1:0] read_attr;
  input  [`OBUFDS_DPHY_COMP_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
