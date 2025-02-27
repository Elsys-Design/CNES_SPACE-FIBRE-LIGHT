`include "B_LOOKAHEAD8_defines.vh"

reg [`LOOKAHEAD8_DATA_SZ-1:0] ATTR [0:`LOOKAHEAD8_ADDR_N-1];
reg [`LOOKAHEAD8__LOOKB_SZ:1] LOOKB_REG = LOOKB;
reg [`LOOKAHEAD8__LOOKD_SZ:1] LOOKD_REG = LOOKD;
reg [`LOOKAHEAD8__LOOKF_SZ:1] LOOKF_REG = LOOKF;
reg [`LOOKAHEAD8__LOOKH_SZ:1] LOOKH_REG = LOOKH;

initial begin
  ATTR[`LOOKAHEAD8__LOOKB] = LOOKB;
  ATTR[`LOOKAHEAD8__LOOKD] = LOOKD;
  ATTR[`LOOKAHEAD8__LOOKF] = LOOKF;
  ATTR[`LOOKAHEAD8__LOOKH] = LOOKH;
end

always @(trig_attr) begin
  LOOKB_REG = ATTR[`LOOKAHEAD8__LOOKB];
  LOOKD_REG = ATTR[`LOOKAHEAD8__LOOKD];
  LOOKF_REG = ATTR[`LOOKAHEAD8__LOOKF];
  LOOKH_REG = ATTR[`LOOKAHEAD8__LOOKH];
end

// procedures to override, read attribute values

task write_attr;
  input  [`LOOKAHEAD8_ADDR_SZ-1:0] addr;
  input  [`LOOKAHEAD8_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`LOOKAHEAD8_DATA_SZ-1:0] read_attr;
  input  [`LOOKAHEAD8_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
