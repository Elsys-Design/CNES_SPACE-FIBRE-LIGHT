`include "B_IOBUF_defines.vh"

reg [`IOBUF_DATA_SZ-1:0] ATTR [0:`IOBUF_ADDR_N-1];
reg [`IOBUF__DRIVE_SZ-1:0] DRIVE_REG = DRIVE;
reg [`IOBUF__IBUF_LOW_PWR_SZ:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
reg [`IOBUF__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;
reg [`IOBUF__SLEW_SZ:1] SLEW_REG = SLEW;

initial begin
  ATTR[`IOBUF__DRIVE] = DRIVE;
  ATTR[`IOBUF__IBUF_LOW_PWR] = IBUF_LOW_PWR;
  ATTR[`IOBUF__IOSTANDARD] = IOSTANDARD;
  ATTR[`IOBUF__SLEW] = SLEW;
end

always @(trig_attr) begin
  DRIVE_REG = ATTR[`IOBUF__DRIVE];
  IBUF_LOW_PWR_REG = ATTR[`IOBUF__IBUF_LOW_PWR];
  IOSTANDARD_REG = ATTR[`IOBUF__IOSTANDARD];
  SLEW_REG = ATTR[`IOBUF__SLEW];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IOBUF_ADDR_SZ-1:0] addr;
  input  [`IOBUF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IOBUF_DATA_SZ-1:0] read_attr;
  input  [`IOBUF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
