`include "B_FDCE_defines.vh"

reg [`FDCE_DATA_SZ-1:0] ATTR [0:`FDCE_ADDR_N-1];
reg INIT_REG = INIT;
reg IS_CLR_INVERTED_REG = IS_CLR_INVERTED;
reg IS_C_INVERTED_REG = IS_C_INVERTED;
reg IS_D_INVERTED_REG = IS_D_INVERTED;

initial begin
  ATTR[`FDCE__INIT] = INIT;
  ATTR[`FDCE__IS_CLR_INVERTED] = IS_CLR_INVERTED;
  ATTR[`FDCE__IS_C_INVERTED] = IS_C_INVERTED;
  ATTR[`FDCE__IS_D_INVERTED] = IS_D_INVERTED;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`FDCE__INIT];
  IS_CLR_INVERTED_REG = ATTR[`FDCE__IS_CLR_INVERTED];
  IS_C_INVERTED_REG = ATTR[`FDCE__IS_C_INVERTED];
  IS_D_INVERTED_REG = ATTR[`FDCE__IS_D_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`FDCE_ADDR_SZ-1:0] addr;
  input  [`FDCE_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`FDCE_DATA_SZ-1:0] read_attr;
  input  [`FDCE_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
