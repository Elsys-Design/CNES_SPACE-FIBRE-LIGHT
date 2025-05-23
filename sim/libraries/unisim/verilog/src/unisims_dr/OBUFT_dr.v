`include "B_OBUFT_defines.vh"

reg [`OBUFT_DATA_SZ-1:0] ATTR [0:`OBUFT_ADDR_N-1];
reg [`OBUFT__DRIVE_SZ-1:0] DRIVE_REG = DRIVE;
reg [`OBUFT__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;
reg [`OBUFT__SLEW_SZ:1] SLEW_REG = SLEW;

initial begin
  ATTR[`OBUFT__DRIVE] = DRIVE;
  ATTR[`OBUFT__IOSTANDARD] = IOSTANDARD;
  ATTR[`OBUFT__SLEW] = SLEW;
end

always @(trig_attr) begin
  DRIVE_REG = ATTR[`OBUFT__DRIVE];
  IOSTANDARD_REG = ATTR[`OBUFT__IOSTANDARD];
  SLEW_REG = ATTR[`OBUFT__SLEW];
end

// procedures to override, read attribute values

task write_attr;
  input  [`OBUFT_ADDR_SZ-1:0] addr;
  input  [`OBUFT_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`OBUFT_DATA_SZ-1:0] read_attr;
  input  [`OBUFT_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
