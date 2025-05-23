`include "B_FE_defines.vh"

reg [`FE_DATA_SZ-1:0] ATTR [0:`FE_ADDR_N-1];
reg [`FE__MODE_SZ:1] MODE_REG = MODE;
real PHYSICAL_UTILIZATION_REG = PHYSICAL_UTILIZATION;
reg [`FE__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
reg [`FE__STANDARD_SZ:1] STANDARD_REG = STANDARD;
real THROUGHPUT_UTILIZATION_REG = THROUGHPUT_UTILIZATION;

initial begin
  ATTR[`FE__MODE] = MODE;
  ATTR[`FE__PHYSICAL_UTILIZATION] = $realtobits(PHYSICAL_UTILIZATION);
  ATTR[`FE__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`FE__STANDARD] = STANDARD;
  ATTR[`FE__THROUGHPUT_UTILIZATION] = $realtobits(THROUGHPUT_UTILIZATION);
end

always @(trig_attr) begin
  MODE_REG = ATTR[`FE__MODE];
  PHYSICAL_UTILIZATION_REG = $bitstoreal(ATTR[`FE__PHYSICAL_UTILIZATION]);
  SIM_DEVICE_REG = ATTR[`FE__SIM_DEVICE];
  STANDARD_REG = ATTR[`FE__STANDARD];
  THROUGHPUT_UTILIZATION_REG = $bitstoreal(ATTR[`FE__THROUGHPUT_UTILIZATION]);
end

// procedures to override, read attribute values

task write_attr;
  input  [`FE_ADDR_SZ-1:0] addr;
  input  [`FE_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`FE_DATA_SZ-1:0] read_attr;
  input  [`FE_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
