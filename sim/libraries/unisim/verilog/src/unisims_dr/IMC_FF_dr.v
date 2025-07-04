`include "B_IMC_FF_defines.vh"

reg [`IMC_FF_DATA_SZ-1:0] ATTR [0:`IMC_FF_ADDR_N-1];
reg [`IMC_FF__CLK_MODE_SZ:1] CLK_MODE_REG = CLK_MODE;
reg [`IMC_FF__IMR_REG_SZ:1] IMR_REG_REG = IMR_REG;
reg [`IMC_FF__INIT_MODE_SZ:1] INIT_MODE_REG = INIT_MODE;

initial begin
  ATTR[`IMC_FF__CLK_MODE] = CLK_MODE;
  ATTR[`IMC_FF__IMR_REG] = IMR_REG;
  ATTR[`IMC_FF__INIT_MODE] = INIT_MODE;
end

always @(trig_attr) begin
  CLK_MODE_REG = ATTR[`IMC_FF__CLK_MODE];
  IMR_REG_REG = ATTR[`IMC_FF__IMR_REG];
  INIT_MODE_REG = ATTR[`IMC_FF__INIT_MODE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IMC_FF_ADDR_SZ-1:0] addr;
  input  [`IMC_FF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IMC_FF_DATA_SZ-1:0] read_attr;
  input  [`IMC_FF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
