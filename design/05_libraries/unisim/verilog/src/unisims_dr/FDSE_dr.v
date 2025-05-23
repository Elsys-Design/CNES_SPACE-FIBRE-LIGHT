`include "B_FDSE_defines.vh"

reg [`FDSE_DATA_SZ-1:0] ATTR [0:`FDSE_ADDR_N-1];
reg INIT_REG = INIT;
reg IS_C_INVERTED_REG = IS_C_INVERTED;
reg IS_D_INVERTED_REG = IS_D_INVERTED;
reg IS_S_INVERTED_REG = IS_S_INVERTED;

initial begin
  ATTR[`FDSE__INIT] = INIT;
  ATTR[`FDSE__IS_C_INVERTED] = IS_C_INVERTED;
  ATTR[`FDSE__IS_D_INVERTED] = IS_D_INVERTED;
  ATTR[`FDSE__IS_S_INVERTED] = IS_S_INVERTED;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`FDSE__INIT];
  IS_C_INVERTED_REG = ATTR[`FDSE__IS_C_INVERTED];
  IS_D_INVERTED_REG = ATTR[`FDSE__IS_D_INVERTED];
  IS_S_INVERTED_REG = ATTR[`FDSE__IS_S_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`FDSE_ADDR_SZ-1:0] addr;
  input  [`FDSE_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`FDSE_DATA_SZ-1:0] read_attr;
  input  [`FDSE_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
