`include "B_IBUFG_defines.vh"

reg [`IBUFG_DATA_SZ-1:0] ATTR [0:`IBUFG_ADDR_N-1];
reg [`IBUFG__IBUF_LOW_PWR_SZ:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
reg [`IBUFG__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;

initial begin
  ATTR[`IBUFG__IBUF_LOW_PWR] = IBUF_LOW_PWR;
  ATTR[`IBUFG__IOSTANDARD] = IOSTANDARD;
end

always @(trig_attr) begin
  IBUF_LOW_PWR_REG = ATTR[`IBUFG__IBUF_LOW_PWR];
  IOSTANDARD_REG = ATTR[`IBUFG__IOSTANDARD];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IBUFG_ADDR_SZ-1:0] addr;
  input  [`IBUFG_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IBUFG_DATA_SZ-1:0] read_attr;
  input  [`IBUFG_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
