`include "B_FDPE_defines.vh"

reg [`FDPE_DATA_SZ-1:0] ATTR [0:`FDPE_ADDR_N-1];
reg INIT_REG = INIT;
reg IS_C_INVERTED_REG = IS_C_INVERTED;
reg IS_D_INVERTED_REG = IS_D_INVERTED;
reg IS_PRE_INVERTED_REG = IS_PRE_INVERTED;

initial begin
  ATTR[`FDPE__INIT] = INIT;
  ATTR[`FDPE__IS_C_INVERTED] = IS_C_INVERTED;
  ATTR[`FDPE__IS_D_INVERTED] = IS_D_INVERTED;
  ATTR[`FDPE__IS_PRE_INVERTED] = IS_PRE_INVERTED;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`FDPE__INIT];
  IS_C_INVERTED_REG = ATTR[`FDPE__IS_C_INVERTED];
  IS_D_INVERTED_REG = ATTR[`FDPE__IS_D_INVERTED];
  IS_PRE_INVERTED_REG = ATTR[`FDPE__IS_PRE_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`FDPE_ADDR_SZ-1:0] addr;
  input  [`FDPE_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`FDPE_DATA_SZ-1:0] read_attr;
  input  [`FDPE_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
