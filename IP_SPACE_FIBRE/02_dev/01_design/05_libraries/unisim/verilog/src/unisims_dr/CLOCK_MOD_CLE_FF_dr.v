`include "B_CLOCK_MOD_CLE_FF_defines.vh"

reg [`CLOCK_MOD_CLE_FF_DATA_SZ-1:0] ATTR [0:`CLOCK_MOD_CLE_FF_ADDR_N-1];
reg [`CLOCK_MOD_CLE_FF__CLK_DLY_VAL_SZ-1:0] CLK_DLY_VAL_REG = CLK_DLY_VAL;
reg [`CLOCK_MOD_CLE_FF__FF_CLK_DUAL_SZ:1] FF_CLK_DUAL_REG = FF_CLK_DUAL;
reg [`CLOCK_MOD_CLE_FF__FF_CLK_EN_SZ:1] FF_CLK_EN_REG = FF_CLK_EN;
reg [`CLOCK_MOD_CLE_FF__IMUX_CLK_MODE_SZ:1] IMUX_CLK_MODE_REG = IMUX_CLK_MODE;

initial begin
  ATTR[`CLOCK_MOD_CLE_FF__CLK_DLY_VAL] = CLK_DLY_VAL;
  ATTR[`CLOCK_MOD_CLE_FF__FF_CLK_DUAL] = FF_CLK_DUAL;
  ATTR[`CLOCK_MOD_CLE_FF__FF_CLK_EN] = FF_CLK_EN;
  ATTR[`CLOCK_MOD_CLE_FF__IMUX_CLK_MODE] = IMUX_CLK_MODE;
end

always @(trig_attr) begin
  CLK_DLY_VAL_REG = ATTR[`CLOCK_MOD_CLE_FF__CLK_DLY_VAL];
  FF_CLK_DUAL_REG = ATTR[`CLOCK_MOD_CLE_FF__FF_CLK_DUAL];
  FF_CLK_EN_REG = ATTR[`CLOCK_MOD_CLE_FF__FF_CLK_EN];
  IMUX_CLK_MODE_REG = ATTR[`CLOCK_MOD_CLE_FF__IMUX_CLK_MODE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`CLOCK_MOD_CLE_FF_ADDR_SZ-1:0] addr;
  input  [`CLOCK_MOD_CLE_FF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`CLOCK_MOD_CLE_FF_DATA_SZ-1:0] read_attr;
  input  [`CLOCK_MOD_CLE_FF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
