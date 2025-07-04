`include "B_EFUSE_USR_defines.vh"

reg [`EFUSE_USR_DATA_SZ-1:0] ATTR [0:`EFUSE_USR_ADDR_N-1];
reg [`EFUSE_USR__SIM_EFUSE_VALUE_SZ-1:0] SIM_EFUSE_VALUE_REG = SIM_EFUSE_VALUE;

initial begin
  ATTR[`EFUSE_USR__SIM_EFUSE_VALUE] = SIM_EFUSE_VALUE;
end

always @(trig_attr) begin
  SIM_EFUSE_VALUE_REG = ATTR[`EFUSE_USR__SIM_EFUSE_VALUE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`EFUSE_USR_ADDR_SZ-1:0] addr;
  input  [`EFUSE_USR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`EFUSE_USR_DATA_SZ-1:0] read_attr;
  input  [`EFUSE_USR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
