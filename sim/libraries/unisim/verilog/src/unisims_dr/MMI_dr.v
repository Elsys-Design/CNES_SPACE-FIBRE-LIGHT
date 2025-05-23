`include "B_MMI_defines.vh"

reg [`MMI_DATA_SZ-1:0] ATTR [0:`MMI_ADDR_N-1];
reg [`MMI__SIM_MMI_CDO_FILE_NAME_SZ:1] SIM_MMI_CDO_FILE_NAME_REG = SIM_MMI_CDO_FILE_NAME;
reg [`MMI__SIM_MMI_CDO_MODE_SZ-1:0] SIM_MMI_CDO_MODE_REG = SIM_MMI_CDO_MODE;
reg [`MMI__SIM_VERSION_SZ-1:0] SIM_VERSION_REG = SIM_VERSION;

initial begin
  ATTR[`MMI__SIM_MMI_CDO_FILE_NAME] = SIM_MMI_CDO_FILE_NAME;
  ATTR[`MMI__SIM_MMI_CDO_MODE] = SIM_MMI_CDO_MODE;
  ATTR[`MMI__SIM_VERSION] = SIM_VERSION;
end

always @(trig_attr) begin
  SIM_MMI_CDO_FILE_NAME_REG = ATTR[`MMI__SIM_MMI_CDO_FILE_NAME];
  SIM_MMI_CDO_MODE_REG = ATTR[`MMI__SIM_MMI_CDO_MODE];
  SIM_VERSION_REG = ATTR[`MMI__SIM_VERSION];
end

// procedures to override, read attribute values

task write_attr;
  input  [`MMI_ADDR_SZ-1:0] addr;
  input  [`MMI_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`MMI_DATA_SZ-1:0] read_attr;
  input  [`MMI_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
