`include "B_CLOCK_MOD_CLE_IMR_defines.vh"

reg [`CLOCK_MOD_CLE_IMR_DATA_SZ-1:0] ATTR [0:`CLOCK_MOD_CLE_IMR_ADDR_N-1];
reg [`CLOCK_MOD_CLE_IMR__CLK_DLY_VAL_SZ-1:0] CLK_DLY_VAL_REG = CLK_DLY_VAL;
reg [`CLOCK_MOD_CLE_IMR__IMUX_CLK1_SEL_SZ:1] IMUX_CLK1_SEL_REG = IMUX_CLK1_SEL;
reg [`CLOCK_MOD_CLE_IMR__IMUX_CLK2_SEL_SZ:1] IMUX_CLK2_SEL_REG = IMUX_CLK2_SEL;
reg [`CLOCK_MOD_CLE_IMR__IMUX_CLK_MODE_SZ:1] IMUX_CLK_MODE_REG = IMUX_CLK_MODE;

initial begin
  ATTR[`CLOCK_MOD_CLE_IMR__CLK_DLY_VAL] = CLK_DLY_VAL;
  ATTR[`CLOCK_MOD_CLE_IMR__IMUX_CLK1_SEL] = IMUX_CLK1_SEL;
  ATTR[`CLOCK_MOD_CLE_IMR__IMUX_CLK2_SEL] = IMUX_CLK2_SEL;
  ATTR[`CLOCK_MOD_CLE_IMR__IMUX_CLK_MODE] = IMUX_CLK_MODE;
end

always @(trig_attr) begin
  CLK_DLY_VAL_REG = ATTR[`CLOCK_MOD_CLE_IMR__CLK_DLY_VAL];
  IMUX_CLK1_SEL_REG = ATTR[`CLOCK_MOD_CLE_IMR__IMUX_CLK1_SEL];
  IMUX_CLK2_SEL_REG = ATTR[`CLOCK_MOD_CLE_IMR__IMUX_CLK2_SEL];
  IMUX_CLK_MODE_REG = ATTR[`CLOCK_MOD_CLE_IMR__IMUX_CLK_MODE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`CLOCK_MOD_CLE_IMR_ADDR_SZ-1:0] addr;
  input  [`CLOCK_MOD_CLE_IMR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`CLOCK_MOD_CLE_IMR_DATA_SZ-1:0] read_attr;
  input  [`CLOCK_MOD_CLE_IMR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
