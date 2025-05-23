`include "B_RIU_OR_defines.vh"

reg [`RIU_OR_DATA_SZ-1:0] ATTR [0:`RIU_OR_ADDR_N-1];
reg [`RIU_OR__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
real SIM_VERSION_REG = SIM_VERSION;

initial begin
  ATTR[`RIU_OR__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`RIU_OR__SIM_VERSION] = $realtobits(SIM_VERSION);
end

always @(trig_attr) begin
  SIM_DEVICE_REG = ATTR[`RIU_OR__SIM_DEVICE];
  SIM_VERSION_REG = $bitstoreal(ATTR[`RIU_OR__SIM_VERSION]);
end

// procedures to override, read attribute values

task write_attr;
  input  [`RIU_OR_ADDR_SZ-1:0] addr;
  input  [`RIU_OR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`RIU_OR_DATA_SZ-1:0] read_attr;
  input  [`RIU_OR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
