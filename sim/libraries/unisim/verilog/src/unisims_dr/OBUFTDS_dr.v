`include "B_OBUFTDS_defines.vh"

reg [`OBUFTDS_DATA_SZ-1:0] ATTR [0:`OBUFTDS_ADDR_N-1];
reg [`OBUFTDS__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;
reg [`OBUFTDS__SLEW_SZ:1] SLEW_REG = SLEW;

initial begin
  ATTR[`OBUFTDS__IOSTANDARD] = IOSTANDARD;
  ATTR[`OBUFTDS__SLEW] = SLEW;
end

always @(trig_attr) begin
  IOSTANDARD_REG = ATTR[`OBUFTDS__IOSTANDARD];
  SLEW_REG = ATTR[`OBUFTDS__SLEW];
end

// procedures to override, read attribute values

task write_attr;
  input  [`OBUFTDS_ADDR_SZ-1:0] addr;
  input  [`OBUFTDS_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`OBUFTDS_DATA_SZ-1:0] read_attr;
  input  [`OBUFTDS_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
