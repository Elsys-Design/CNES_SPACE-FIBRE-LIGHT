`include "B_CLOCK_MOD_IRI_FF_defines.vh"

reg [`CLOCK_MOD_IRI_FF_DATA_SZ-1:0] ATTR [0:`CLOCK_MOD_IRI_FF_ADDR_N-1];
reg [`CLOCK_MOD_IRI_FF__CLK_DLY_VAL_COE_SZ-1:0] CLK_DLY_VAL_COE_REG = CLK_DLY_VAL_COE;
reg [`CLOCK_MOD_IRI_FF__CLK_EN_SZ:1] CLK_EN_REG = CLK_EN;
reg [`CLOCK_MOD_IRI_FF__CLK_SEL_SZ:1] CLK_SEL_REG = CLK_SEL;

initial begin
  ATTR[`CLOCK_MOD_IRI_FF__CLK_DLY_VAL_COE] = CLK_DLY_VAL_COE;
  ATTR[`CLOCK_MOD_IRI_FF__CLK_EN] = CLK_EN;
  ATTR[`CLOCK_MOD_IRI_FF__CLK_SEL] = CLK_SEL;
end

always @(trig_attr) begin
  CLK_DLY_VAL_COE_REG = ATTR[`CLOCK_MOD_IRI_FF__CLK_DLY_VAL_COE];
  CLK_EN_REG = ATTR[`CLOCK_MOD_IRI_FF__CLK_EN];
  CLK_SEL_REG = ATTR[`CLOCK_MOD_IRI_FF__CLK_SEL];
end

// procedures to override, read attribute values

task write_attr;
  input  [`CLOCK_MOD_IRI_FF_ADDR_SZ-1:0] addr;
  input  [`CLOCK_MOD_IRI_FF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`CLOCK_MOD_IRI_FF_DATA_SZ-1:0] read_attr;
  input  [`CLOCK_MOD_IRI_FF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
