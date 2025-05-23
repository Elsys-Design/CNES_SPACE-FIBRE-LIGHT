`include "B_BUFGMUX_defines.vh"

reg [`BUFGMUX_DATA_SZ-1:0] ATTR [0:`BUFGMUX_ADDR_N-1];
reg [`BUFGMUX__CLK_SEL_TYPE_SZ:1] CLK_SEL_TYPE_REG = CLK_SEL_TYPE;

initial begin
  ATTR[`BUFGMUX__CLK_SEL_TYPE] = CLK_SEL_TYPE;
end

always @(trig_attr) begin
  CLK_SEL_TYPE_REG = ATTR[`BUFGMUX__CLK_SEL_TYPE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`BUFGMUX_ADDR_SZ-1:0] addr;
  input  [`BUFGMUX_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`BUFGMUX_DATA_SZ-1:0] read_attr;
  input  [`BUFGMUX_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
