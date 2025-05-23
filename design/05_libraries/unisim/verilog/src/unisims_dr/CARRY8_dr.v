`include "B_CARRY8_defines.vh"

reg [`CARRY8_DATA_SZ-1:0] ATTR [0:`CARRY8_ADDR_N-1];
reg [`CARRY8__CARRY_TYPE_SZ:1] CARRY_TYPE_REG = CARRY_TYPE;

initial begin
  ATTR[`CARRY8__CARRY_TYPE] = CARRY_TYPE;
end

always @(trig_attr) begin
  CARRY_TYPE_REG = ATTR[`CARRY8__CARRY_TYPE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`CARRY8_ADDR_SZ-1:0] addr;
  input  [`CARRY8_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`CARRY8_DATA_SZ-1:0] read_attr;
  input  [`CARRY8_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
