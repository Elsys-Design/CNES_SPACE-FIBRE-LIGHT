`include "B_OBUF_defines.vh"

reg [`OBUF_DATA_SZ-1:0] ATTR [0:`OBUF_ADDR_N-1];
reg [`OBUF__DRIVE_SZ-1:0] DRIVE_REG = DRIVE;
reg [`OBUF__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;
reg [`OBUF__SLEW_SZ:1] SLEW_REG = SLEW;

initial begin
  ATTR[`OBUF__DRIVE] = DRIVE;
  ATTR[`OBUF__IOSTANDARD] = IOSTANDARD;
  ATTR[`OBUF__SLEW] = SLEW;
end

always @(trig_attr) begin
  DRIVE_REG = ATTR[`OBUF__DRIVE];
  IOSTANDARD_REG = ATTR[`OBUF__IOSTANDARD];
  SLEW_REG = ATTR[`OBUF__SLEW];
end

// procedures to override, read attribute values

task write_attr;
  input  [`OBUF_ADDR_SZ-1:0] addr;
  input  [`OBUF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`OBUF_DATA_SZ-1:0] read_attr;
  input  [`OBUF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
