`include "B_DSP_PREADD_defines.vh"

reg [`DSP_PREADD_DATA_SZ-1:0] ATTR [0:`DSP_PREADD_ADDR_N-1];

initial begin
end

always @(trig_attr) begin
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_PREADD_ADDR_SZ-1:0] addr;
  input  [`DSP_PREADD_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_PREADD_DATA_SZ-1:0] read_attr;
  input  [`DSP_PREADD_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
    trig_attr = ~trig_attr;
  end
endtask
