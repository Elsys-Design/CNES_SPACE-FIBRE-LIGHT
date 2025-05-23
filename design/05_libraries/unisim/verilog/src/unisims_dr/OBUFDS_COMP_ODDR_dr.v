`include "B_OBUFDS_COMP_ODDR_defines.vh"

reg [`OBUFDS_COMP_ODDR_DATA_SZ-1:0] ATTR [0:`OBUFDS_COMP_ODDR_ADDR_N-1];
reg [`OBUFDS_COMP_ODDR__EN_OMUX_SZ:1] EN_OMUX_REG = EN_OMUX;
reg [`OBUFDS_COMP_ODDR__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;

initial begin
  ATTR[`OBUFDS_COMP_ODDR__EN_OMUX] = EN_OMUX;
  ATTR[`OBUFDS_COMP_ODDR__IOSTANDARD] = IOSTANDARD;
end

always @(trig_attr) begin
  EN_OMUX_REG = ATTR[`OBUFDS_COMP_ODDR__EN_OMUX];
  IOSTANDARD_REG = ATTR[`OBUFDS_COMP_ODDR__IOSTANDARD];
end

// procedures to override, read attribute values

task write_attr;
  input  [`OBUFDS_COMP_ODDR_ADDR_SZ-1:0] addr;
  input  [`OBUFDS_COMP_ODDR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`OBUFDS_COMP_ODDR_DATA_SZ-1:0] read_attr;
  input  [`OBUFDS_COMP_ODDR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
