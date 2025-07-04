`include "B_LUT4_defines.vh"

reg [`LUT4_DATA_SZ-1:0] ATTR [0:`LUT4_ADDR_N-1];
reg [`LUT4__INIT_SZ-1:0] INIT_REG = INIT;

initial begin
  ATTR[`LUT4__INIT] = INIT;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`LUT4__INIT];
end

// procedures to override, read attribute values

task write_attr;
  input  [`LUT4_ADDR_SZ-1:0] addr;
  input  [`LUT4_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`LUT4_DATA_SZ-1:0] read_attr;
  input  [`LUT4_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
