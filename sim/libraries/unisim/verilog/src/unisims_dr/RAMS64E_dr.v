`include "B_RAMS64E_defines.vh"

reg [`RAMS64E_DATA_SZ-1:0] ATTR [0:`RAMS64E_ADDR_N-1];
reg [`RAMS64E__INIT_SZ-1:0] INIT_REG = INIT;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg [`RAMS64E__RAM_ADDRESS_MASK_SZ-1:0] RAM_ADDRESS_MASK_REG = RAM_ADDRESS_MASK;
reg [`RAMS64E__RAM_ADDRESS_SPACE_SZ-1:0] RAM_ADDRESS_SPACE_REG = RAM_ADDRESS_SPACE;

initial begin
  ATTR[`RAMS64E__INIT] = INIT;
  ATTR[`RAMS64E__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`RAMS64E__RAM_ADDRESS_MASK] = RAM_ADDRESS_MASK;
  ATTR[`RAMS64E__RAM_ADDRESS_SPACE] = RAM_ADDRESS_SPACE;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`RAMS64E__INIT];
  IS_CLK_INVERTED_REG = ATTR[`RAMS64E__IS_CLK_INVERTED];
  RAM_ADDRESS_MASK_REG = ATTR[`RAMS64E__RAM_ADDRESS_MASK];
  RAM_ADDRESS_SPACE_REG = ATTR[`RAMS64E__RAM_ADDRESS_SPACE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`RAMS64E_ADDR_SZ-1:0] addr;
  input  [`RAMS64E_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`RAMS64E_DATA_SZ-1:0] read_attr;
  input  [`RAMS64E_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
