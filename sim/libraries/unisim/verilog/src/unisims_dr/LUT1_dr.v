`include "B_LUT1_defines.vh"

reg [`LUT1_DATA_SZ-1:0] ATTR [0:`LUT1_ADDR_N-1];
reg [`LUT1__INIT_SZ-1:0] INIT_REG = INIT;

initial begin
  ATTR[`LUT1__INIT] = INIT;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`LUT1__INIT];
end

// procedures to override, read attribute values

task write_attr;
  input  [`LUT1_ADDR_SZ-1:0] addr;
  input  [`LUT1_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`LUT1_DATA_SZ-1:0] read_attr;
  input  [`LUT1_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
