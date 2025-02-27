`include "B_FE_TEST_defines.vh"

reg [`FE_TEST_DATA_SZ-1:0] ATTR [0:`FE_TEST_ADDR_N-1];
reg [6:0] LD_PERCENT_LOAD_REG = LD_PERCENT_LOAD;
reg [6:0] LE_PERCENT_LOAD_REG = LE_PERCENT_LOAD;
reg [152:1] SIM_DEVICE_REG = SIM_DEVICE;
reg [6:0] TD_PERCENT_LOAD_REG = TD_PERCENT_LOAD;

initial begin
  ATTR[`FE_TEST__LD_PERCENT_LOAD] = LD_PERCENT_LOAD;
  ATTR[`FE_TEST__LE_PERCENT_LOAD] = LE_PERCENT_LOAD;
  ATTR[`FE_TEST__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`FE_TEST__TD_PERCENT_LOAD] = TD_PERCENT_LOAD;
end

always @(trig_attr) begin
  LD_PERCENT_LOAD_REG = ATTR[`FE_TEST__LD_PERCENT_LOAD];
  LE_PERCENT_LOAD_REG = ATTR[`FE_TEST__LE_PERCENT_LOAD];
  SIM_DEVICE_REG = ATTR[`FE_TEST__SIM_DEVICE];
  TD_PERCENT_LOAD_REG = ATTR[`FE_TEST__TD_PERCENT_LOAD];
end

// procedures to override, read attribute values

task write_attr;
  input  [`FE_TEST_ADDR_SZ-1:0] addr;
  input  [`FE_TEST_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`FE_TEST_DATA_SZ-1:0] read_attr;
  input  [`FE_TEST_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
