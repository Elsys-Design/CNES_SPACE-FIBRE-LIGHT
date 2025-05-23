`include "B_IOBUF_ODDR_defines.vh"

reg [`IOBUF_ODDR_DATA_SZ-1:0] ATTR [0:`IOBUF_ODDR_ADDR_N-1];
reg [`IOBUF_ODDR__DRIVE_SZ-1:0] DRIVE_REG = DRIVE;
reg [`IOBUF_ODDR__EN_OMUX_SZ:1] EN_OMUX_REG = EN_OMUX;
reg [`IOBUF_ODDR__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;
reg [`IOBUF_ODDR__SIM_INPUT_BUFFER_OFFSET_SZ-1:0] SIM_INPUT_BUFFER_OFFSET_REG = SIM_INPUT_BUFFER_OFFSET;
reg [`IOBUF_ODDR__USE_IBUFDISABLE_SZ:1] USE_IBUFDISABLE_REG = USE_IBUFDISABLE;

initial begin
  ATTR[`IOBUF_ODDR__DRIVE] = DRIVE;
  ATTR[`IOBUF_ODDR__EN_OMUX] = EN_OMUX;
  ATTR[`IOBUF_ODDR__IOSTANDARD] = IOSTANDARD;
  ATTR[`IOBUF_ODDR__SIM_INPUT_BUFFER_OFFSET] = SIM_INPUT_BUFFER_OFFSET;
  ATTR[`IOBUF_ODDR__USE_IBUFDISABLE] = USE_IBUFDISABLE;
end

always @(trig_attr) begin
  DRIVE_REG = ATTR[`IOBUF_ODDR__DRIVE];
  EN_OMUX_REG = ATTR[`IOBUF_ODDR__EN_OMUX];
  IOSTANDARD_REG = ATTR[`IOBUF_ODDR__IOSTANDARD];
  SIM_INPUT_BUFFER_OFFSET_REG = ATTR[`IOBUF_ODDR__SIM_INPUT_BUFFER_OFFSET];
  USE_IBUFDISABLE_REG = ATTR[`IOBUF_ODDR__USE_IBUFDISABLE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IOBUF_ODDR_ADDR_SZ-1:0] addr;
  input  [`IOBUF_ODDR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IOBUF_ODDR_DATA_SZ-1:0] read_attr;
  input  [`IOBUF_ODDR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
