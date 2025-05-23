`include "B_AND2B1L_defines.vh"

reg [`AND2B1L_DATA_SZ-1:0] ATTR [0:`AND2B1L_ADDR_N-1];
reg IS_SRI_INVERTED_REG = IS_SRI_INVERTED;

initial begin
  ATTR[`AND2B1L__IS_SRI_INVERTED] = IS_SRI_INVERTED;
end

always @(trig_attr) begin
  IS_SRI_INVERTED_REG = ATTR[`AND2B1L__IS_SRI_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`AND2B1L_ADDR_SZ-1:0] addr;
  input  [`AND2B1L_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`AND2B1L_DATA_SZ-1:0] read_attr;
  input  [`AND2B1L_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
