`include "B_DPHY_DIFFINBUF_defines.vh"

reg [`DPHY_DIFFINBUF_DATA_SZ-1:0] ATTR [0:`DPHY_DIFFINBUF_ADDR_N-1];
reg [`DPHY_DIFFINBUF__DIFF_TERM_SZ:1] DIFF_TERM_REG = DIFF_TERM;
reg [`DPHY_DIFFINBUF__ISTANDARD_SZ:1] ISTANDARD_REG = ISTANDARD;

initial begin
  ATTR[`DPHY_DIFFINBUF__DIFF_TERM] = DIFF_TERM;
  ATTR[`DPHY_DIFFINBUF__ISTANDARD] = ISTANDARD;
end

always @(trig_attr) begin
  DIFF_TERM_REG = ATTR[`DPHY_DIFFINBUF__DIFF_TERM];
  ISTANDARD_REG = ATTR[`DPHY_DIFFINBUF__ISTANDARD];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DPHY_DIFFINBUF_ADDR_SZ-1:0] addr;
  input  [`DPHY_DIFFINBUF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DPHY_DIFFINBUF_DATA_SZ-1:0] read_attr;
  input  [`DPHY_DIFFINBUF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
