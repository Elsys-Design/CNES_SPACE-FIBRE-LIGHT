`include "B_OBUFT_DCIEN_defines.vh"

reg [`OBUFT_DCIEN_DATA_SZ-1:0] ATTR [0:`OBUFT_DCIEN_ADDR_N-1];
reg [`OBUFT_DCIEN__DRIVE_SZ-1:0] DRIVE_REG = DRIVE;
reg [`OBUFT_DCIEN__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;
reg [`OBUFT_DCIEN__SLEW_SZ:1] SLEW_REG = SLEW;

initial begin
  ATTR[`OBUFT_DCIEN__DRIVE] = DRIVE;
  ATTR[`OBUFT_DCIEN__IOSTANDARD] = IOSTANDARD;
  ATTR[`OBUFT_DCIEN__SLEW] = SLEW;
end

always @(trig_attr) begin
  DRIVE_REG = ATTR[`OBUFT_DCIEN__DRIVE];
  IOSTANDARD_REG = ATTR[`OBUFT_DCIEN__IOSTANDARD];
  SLEW_REG = ATTR[`OBUFT_DCIEN__SLEW];
end

// procedures to override, read attribute values

task write_attr;
  input  [`OBUFT_DCIEN_ADDR_SZ-1:0] addr;
  input  [`OBUFT_DCIEN_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`OBUFT_DCIEN_DATA_SZ-1:0] read_attr;
  input  [`OBUFT_DCIEN_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
