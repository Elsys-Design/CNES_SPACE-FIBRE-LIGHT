`include "B_RAMD64E_defines.vh"

reg [`RAMD64E_DATA_SZ-1:0] ATTR [0:`RAMD64E_ADDR_N-1];
reg [`RAMD64E__INIT_SZ-1:0] INIT_REG = INIT;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg [`RAMD64E__RAM_ADDRESS_MASK_SZ-1:0] RAM_ADDRESS_MASK_REG = RAM_ADDRESS_MASK;
reg [`RAMD64E__RAM_ADDRESS_SPACE_SZ-1:0] RAM_ADDRESS_SPACE_REG = RAM_ADDRESS_SPACE;

initial begin
  ATTR[`RAMD64E__INIT] = INIT;
  ATTR[`RAMD64E__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`RAMD64E__RAM_ADDRESS_MASK] = RAM_ADDRESS_MASK;
  ATTR[`RAMD64E__RAM_ADDRESS_SPACE] = RAM_ADDRESS_SPACE;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`RAMD64E__INIT];
  IS_CLK_INVERTED_REG = ATTR[`RAMD64E__IS_CLK_INVERTED];
  RAM_ADDRESS_MASK_REG = ATTR[`RAMD64E__RAM_ADDRESS_MASK];
  RAM_ADDRESS_SPACE_REG = ATTR[`RAMD64E__RAM_ADDRESS_SPACE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`RAMD64E_ADDR_SZ-1:0] addr;
  input  [`RAMD64E_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`RAMD64E_DATA_SZ-1:0] read_attr;
  input  [`RAMD64E_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
