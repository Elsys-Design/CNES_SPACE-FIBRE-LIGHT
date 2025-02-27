`include "B_IMI_FF_defines.vh"

reg [`IMI_FF_DATA_SZ-1:0] ATTR [0:`IMI_FF_ADDR_N-1];
reg [`IMI_FF__CLK_MODE_SZ:1] CLK_MODE_REG = CLK_MODE;
reg [`IMI_FF__IMR_REG_SZ:1] IMR_REG_REG = IMR_REG;
reg [`IMI_FF__INIT_MODE_SZ:1] INIT_MODE_REG = INIT_MODE;
reg [`IMI_FF__SYNC_VAL_SZ:1] SYNC_VAL_REG = SYNC_VAL;

initial begin
  ATTR[`IMI_FF__CLK_MODE] = CLK_MODE;
  ATTR[`IMI_FF__IMR_REG] = IMR_REG;
  ATTR[`IMI_FF__INIT_MODE] = INIT_MODE;
  ATTR[`IMI_FF__SYNC_VAL] = SYNC_VAL;
end

always @(trig_attr) begin
  CLK_MODE_REG = ATTR[`IMI_FF__CLK_MODE];
  IMR_REG_REG = ATTR[`IMI_FF__IMR_REG];
  INIT_MODE_REG = ATTR[`IMI_FF__INIT_MODE];
  SYNC_VAL_REG = ATTR[`IMI_FF__SYNC_VAL];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IMI_FF_ADDR_SZ-1:0] addr;
  input  [`IMI_FF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IMI_FF_DATA_SZ-1:0] read_attr;
  input  [`IMI_FF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
