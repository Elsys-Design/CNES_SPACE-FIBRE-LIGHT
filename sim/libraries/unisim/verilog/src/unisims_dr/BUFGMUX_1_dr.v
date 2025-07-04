`include "B_BUFGMUX_1_defines.vh"

reg [`BUFGMUX_1_DATA_SZ-1:0] ATTR [0:`BUFGMUX_1_ADDR_N-1];
reg [`BUFGMUX_1__CLK_SEL_TYPE_SZ:1] CLK_SEL_TYPE_REG = CLK_SEL_TYPE;

initial begin
  ATTR[`BUFGMUX_1__CLK_SEL_TYPE] = CLK_SEL_TYPE;
end

always @(trig_attr) begin
  CLK_SEL_TYPE_REG = ATTR[`BUFGMUX_1__CLK_SEL_TYPE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`BUFGMUX_1_ADDR_SZ-1:0] addr;
  input  [`BUFGMUX_1_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`BUFGMUX_1_DATA_SZ-1:0] read_attr;
  input  [`BUFGMUX_1_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
