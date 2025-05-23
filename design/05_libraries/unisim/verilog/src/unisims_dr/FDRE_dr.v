`include "B_FDRE_defines.vh"

reg [`FDRE_DATA_SZ-1:0] ATTR [0:`FDRE_ADDR_N-1];
reg INIT_REG = INIT;
reg IS_C_INVERTED_REG = IS_C_INVERTED;
reg IS_D_INVERTED_REG = IS_D_INVERTED;
reg IS_R_INVERTED_REG = IS_R_INVERTED;

initial begin
  ATTR[`FDRE__INIT] = INIT;
  ATTR[`FDRE__IS_C_INVERTED] = IS_C_INVERTED;
  ATTR[`FDRE__IS_D_INVERTED] = IS_D_INVERTED;
  ATTR[`FDRE__IS_R_INVERTED] = IS_R_INVERTED;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`FDRE__INIT];
  IS_C_INVERTED_REG = ATTR[`FDRE__IS_C_INVERTED];
  IS_D_INVERTED_REG = ATTR[`FDRE__IS_D_INVERTED];
  IS_R_INVERTED_REG = ATTR[`FDRE__IS_R_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`FDRE_ADDR_SZ-1:0] addr;
  input  [`FDRE_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`FDRE_DATA_SZ-1:0] read_attr;
  input  [`FDRE_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
