`include "B_HBM_IO_CHNL_defines.vh"

reg [`HBM_IO_CHNL_DATA_SZ-1:0] ATTR [0:`HBM_IO_CHNL_ADDR_N-1];
reg [`HBM_IO_CHNL__SIM_MODEL_TYPE_SZ:1] SIM_MODEL_TYPE_REG = SIM_MODEL_TYPE;

initial begin
  ATTR[`HBM_IO_CHNL__SIM_MODEL_TYPE] = SIM_MODEL_TYPE;
end

always @(trig_attr) begin
  SIM_MODEL_TYPE_REG = ATTR[`HBM_IO_CHNL__SIM_MODEL_TYPE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`HBM_IO_CHNL_ADDR_SZ-1:0] addr;
  input  [`HBM_IO_CHNL_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`HBM_IO_CHNL_DATA_SZ-1:0] read_attr;
  input  [`HBM_IO_CHNL_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
