`include "B_IOBUF_ANALOG_defines.vh"

reg [`IOBUF_ANALOG_DATA_SZ-1:0] ATTR [0:`IOBUF_ANALOG_ADDR_N-1];
reg [4:0] DRIVE_REG = DRIVE;
reg [39:0] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
reg [56:1] IOSTANDARD_REG = IOSTANDARD;
reg [32:1] SLEW_REG = SLEW;

initial begin
  ATTR[`IOBUF_ANALOG__DRIVE] = DRIVE;
  ATTR[`IOBUF_ANALOG__IBUF_LOW_PWR] = IBUF_LOW_PWR;
  ATTR[`IOBUF_ANALOG__IOSTANDARD] = IOSTANDARD;
  ATTR[`IOBUF_ANALOG__SLEW] = SLEW;
end

always @(trig_attr) begin
  DRIVE_REG = ATTR[`IOBUF_ANALOG__DRIVE];
  IBUF_LOW_PWR_REG = ATTR[`IOBUF_ANALOG__IBUF_LOW_PWR];
  IOSTANDARD_REG = ATTR[`IOBUF_ANALOG__IOSTANDARD];
  SLEW_REG = ATTR[`IOBUF_ANALOG__SLEW];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IOBUF_ANALOG_ADDR_SZ-1:0] addr;
  input  [`IOBUF_ANALOG_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IOBUF_ANALOG_DATA_SZ-1:0] read_attr;
  input  [`IOBUF_ANALOG_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
