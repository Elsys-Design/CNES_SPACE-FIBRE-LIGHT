`include "B_HBM_REF_CLK_defines.vh"

reg [`HBM_REF_CLK_DATA_SZ-1:0] ATTR [0:`HBM_REF_CLK_ADDR_N-1];

initial begin
end

always @(trig_attr) begin
end

// procedures to override, read attribute values

task write_attr;
  input  [`HBM_REF_CLK_ADDR_SZ-1:0] addr;
  input  [`HBM_REF_CLK_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`HBM_REF_CLK_DATA_SZ-1:0] read_attr;
  input  [`HBM_REF_CLK_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
