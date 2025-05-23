`include "B_LDPE_defines.vh"

reg [`LDPE_DATA_SZ-1:0] ATTR [0:`LDPE_ADDR_N-1];
reg INIT_REG = INIT;
reg IS_G_INVERTED_REG = IS_G_INVERTED;
reg IS_PRE_INVERTED_REG = IS_PRE_INVERTED;

initial begin
  ATTR[`LDPE__INIT] = INIT;
  ATTR[`LDPE__IS_G_INVERTED] = IS_G_INVERTED;
  ATTR[`LDPE__IS_PRE_INVERTED] = IS_PRE_INVERTED;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`LDPE__INIT];
  IS_G_INVERTED_REG = ATTR[`LDPE__IS_G_INVERTED];
  IS_PRE_INVERTED_REG = ATTR[`LDPE__IS_PRE_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`LDPE_ADDR_SZ-1:0] addr;
  input  [`LDPE_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`LDPE_DATA_SZ-1:0] read_attr;
  input  [`LDPE_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
