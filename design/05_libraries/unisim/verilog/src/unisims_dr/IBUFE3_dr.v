`include "B_IBUFE3_defines.vh"

reg [`IBUFE3_DATA_SZ-1:0] ATTR [0:`IBUFE3_ADDR_N-1];
reg [`IBUFE3__IBUF_LOW_PWR_SZ:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
reg [`IBUFE3__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;
reg [`IBUFE3__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
reg [`IBUFE3__SIM_INPUT_BUFFER_OFFSET_SZ-1:0] SIM_INPUT_BUFFER_OFFSET_REG = SIM_INPUT_BUFFER_OFFSET;
reg [`IBUFE3__USE_IBUFDISABLE_SZ:1] USE_IBUFDISABLE_REG = USE_IBUFDISABLE;

initial begin
  ATTR[`IBUFE3__IBUF_LOW_PWR] = IBUF_LOW_PWR;
  ATTR[`IBUFE3__IOSTANDARD] = IOSTANDARD;
  ATTR[`IBUFE3__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`IBUFE3__SIM_INPUT_BUFFER_OFFSET] = SIM_INPUT_BUFFER_OFFSET;
  ATTR[`IBUFE3__USE_IBUFDISABLE] = USE_IBUFDISABLE;
end

always @(trig_attr) begin
  IBUF_LOW_PWR_REG = ATTR[`IBUFE3__IBUF_LOW_PWR];
  IOSTANDARD_REG = ATTR[`IBUFE3__IOSTANDARD];
  SIM_DEVICE_REG = ATTR[`IBUFE3__SIM_DEVICE];
  SIM_INPUT_BUFFER_OFFSET_REG = ATTR[`IBUFE3__SIM_INPUT_BUFFER_OFFSET];
  USE_IBUFDISABLE_REG = ATTR[`IBUFE3__USE_IBUFDISABLE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IBUFE3_ADDR_SZ-1:0] addr;
  input  [`IBUFE3_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IBUFE3_DATA_SZ-1:0] read_attr;
  input  [`IBUFE3_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
