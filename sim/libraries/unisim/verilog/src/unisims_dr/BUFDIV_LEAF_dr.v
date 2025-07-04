`include "B_BUFDIV_LEAF_defines.vh"

reg [`BUFDIV_LEAF_DATA_SZ-1:0] ATTR [0:`BUFDIV_LEAF_ADDR_N-1];
reg [`BUFDIV_LEAF__DIVIDE_SZ-1:0] DIVIDE_REG = DIVIDE;
reg IS_I_INVERTED_REG = IS_I_INVERTED;

initial begin
  ATTR[`BUFDIV_LEAF__DIVIDE] = DIVIDE;
  ATTR[`BUFDIV_LEAF__IS_I_INVERTED] = IS_I_INVERTED;
end

always @(trig_attr) begin
  DIVIDE_REG = ATTR[`BUFDIV_LEAF__DIVIDE];
  IS_I_INVERTED_REG = ATTR[`BUFDIV_LEAF__IS_I_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`BUFDIV_LEAF_ADDR_SZ-1:0] addr;
  input  [`BUFDIV_LEAF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`BUFDIV_LEAF_DATA_SZ-1:0] read_attr;
  input  [`BUFDIV_LEAF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
