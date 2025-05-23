`include "B_LUT5_defines.vh"

reg [`LUT5_DATA_SZ-1:0] ATTR [0:`LUT5_ADDR_N-1];
reg [`LUT5__INIT_SZ-1:0] INIT_REG = INIT;

initial begin
  ATTR[`LUT5__INIT] = INIT;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`LUT5__INIT];
end

// procedures to override, read attribute values

task write_attr;
  input  [`LUT5_ADDR_SZ-1:0] addr;
  input  [`LUT5_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`LUT5_DATA_SZ-1:0] read_attr;
  input  [`LUT5_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
