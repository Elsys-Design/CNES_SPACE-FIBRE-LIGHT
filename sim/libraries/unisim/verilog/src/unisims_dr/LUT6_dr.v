`include "B_LUT6_defines.vh"

reg [`LUT6_DATA_SZ-1:0] ATTR [0:`LUT6_ADDR_N-1];
reg [`LUT6__INIT_SZ-1:0] INIT_REG = INIT;

initial begin
  ATTR[`LUT6__INIT] = INIT;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`LUT6__INIT];
end

// procedures to override, read attribute values

task write_attr;
  input  [`LUT6_ADDR_SZ-1:0] addr;
  input  [`LUT6_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`LUT6_DATA_SZ-1:0] read_attr;
  input  [`LUT6_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
