`include "B_OBUFDS_defines.vh"

reg [`OBUFDS_DATA_SZ-1:0] ATTR [0:`OBUFDS_ADDR_N-1];
reg [`OBUFDS__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;
reg [`OBUFDS__SLEW_SZ:1] SLEW_REG = SLEW;

initial begin
  ATTR[`OBUFDS__IOSTANDARD] = IOSTANDARD;
  ATTR[`OBUFDS__SLEW] = SLEW;
end

always @(trig_attr) begin
  IOSTANDARD_REG = ATTR[`OBUFDS__IOSTANDARD];
  SLEW_REG = ATTR[`OBUFDS__SLEW];
end

// procedures to override, read attribute values

task write_attr;
  input  [`OBUFDS_ADDR_SZ-1:0] addr;
  input  [`OBUFDS_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`OBUFDS_DATA_SZ-1:0] read_attr;
  input  [`OBUFDS_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
