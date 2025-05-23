`include "B_LDCE_defines.vh"

reg [`LDCE_DATA_SZ-1:0] ATTR [0:`LDCE_ADDR_N-1];
reg INIT_REG = INIT;
reg IS_CLR_INVERTED_REG = IS_CLR_INVERTED;
reg IS_G_INVERTED_REG = IS_G_INVERTED;

initial begin
  ATTR[`LDCE__INIT] = INIT;
  ATTR[`LDCE__IS_CLR_INVERTED] = IS_CLR_INVERTED;
  ATTR[`LDCE__IS_G_INVERTED] = IS_G_INVERTED;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`LDCE__INIT];
  IS_CLR_INVERTED_REG = ATTR[`LDCE__IS_CLR_INVERTED];
  IS_G_INVERTED_REG = ATTR[`LDCE__IS_G_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`LDCE_ADDR_SZ-1:0] addr;
  input  [`LDCE_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`LDCE_DATA_SZ-1:0] read_attr;
  input  [`LDCE_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
