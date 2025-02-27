`include "B_OBUF_ODDR_defines.vh"

reg [`OBUF_ODDR_DATA_SZ-1:0] ATTR [0:`OBUF_ODDR_ADDR_N-1];
reg [`OBUF_ODDR__DRIVE_SZ-1:0] DRIVE_REG = DRIVE;
reg [`OBUF_ODDR__EN_OMUX_SZ:1] EN_OMUX_REG = EN_OMUX;
reg [`OBUF_ODDR__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;
reg [`OBUF_ODDR__SLEW_SZ:1] SLEW_REG = SLEW;

initial begin
  ATTR[`OBUF_ODDR__DRIVE] = DRIVE;
  ATTR[`OBUF_ODDR__EN_OMUX] = EN_OMUX;
  ATTR[`OBUF_ODDR__IOSTANDARD] = IOSTANDARD;
  ATTR[`OBUF_ODDR__SLEW] = SLEW;
end

always @(trig_attr) begin
  DRIVE_REG = ATTR[`OBUF_ODDR__DRIVE];
  EN_OMUX_REG = ATTR[`OBUF_ODDR__EN_OMUX];
  IOSTANDARD_REG = ATTR[`OBUF_ODDR__IOSTANDARD];
  SLEW_REG = ATTR[`OBUF_ODDR__SLEW];
end

// procedures to override, read attribute values

task write_attr;
  input  [`OBUF_ODDR_ADDR_SZ-1:0] addr;
  input  [`OBUF_ODDR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`OBUF_ODDR_DATA_SZ-1:0] read_attr;
  input  [`OBUF_ODDR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
