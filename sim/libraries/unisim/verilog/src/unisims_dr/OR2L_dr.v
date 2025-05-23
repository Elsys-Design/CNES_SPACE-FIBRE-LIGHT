`include "B_OR2L_defines.vh"

reg [`OR2L_DATA_SZ-1:0] ATTR [0:`OR2L_ADDR_N-1];
reg IS_SRI_INVERTED_REG = IS_SRI_INVERTED;

initial begin
  ATTR[`OR2L__IS_SRI_INVERTED] = IS_SRI_INVERTED;
end

always @(trig_attr) begin
  IS_SRI_INVERTED_REG = ATTR[`OR2L__IS_SRI_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`OR2L_ADDR_SZ-1:0] addr;
  input  [`OR2L_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`OR2L_DATA_SZ-1:0] read_attr;
  input  [`OR2L_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
