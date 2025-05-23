`include "B_OBUFTDS_COMP_ODDR_defines.vh"

reg [`OBUFTDS_COMP_ODDR_DATA_SZ-1:0] ATTR [0:`OBUFTDS_COMP_ODDR_ADDR_N-1];
reg [`OBUFTDS_COMP_ODDR__EN_OMUX_SZ:1] EN_OMUX_REG = EN_OMUX;
reg [`OBUFTDS_COMP_ODDR__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;

initial begin
  ATTR[`OBUFTDS_COMP_ODDR__EN_OMUX] = EN_OMUX;
  ATTR[`OBUFTDS_COMP_ODDR__IOSTANDARD] = IOSTANDARD;
end

always @(trig_attr) begin
  EN_OMUX_REG = ATTR[`OBUFTDS_COMP_ODDR__EN_OMUX];
  IOSTANDARD_REG = ATTR[`OBUFTDS_COMP_ODDR__IOSTANDARD];
end

// procedures to override, read attribute values

task write_attr;
  input  [`OBUFTDS_COMP_ODDR_ADDR_SZ-1:0] addr;
  input  [`OBUFTDS_COMP_ODDR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`OBUFTDS_COMP_ODDR_DATA_SZ-1:0] read_attr;
  input  [`OBUFTDS_COMP_ODDR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
