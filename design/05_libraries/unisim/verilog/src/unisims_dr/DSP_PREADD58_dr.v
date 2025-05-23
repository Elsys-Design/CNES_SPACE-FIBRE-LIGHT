`include "B_DSP_PREADD58_defines.vh"

reg [`DSP_PREADD58_DATA_SZ-1:0] ATTR [0:`DSP_PREADD58_ADDR_N-1];
reg [`DSP_PREADD58__DSP_MODE_SZ:1] DSP_MODE_REG = DSP_MODE;

initial begin
  ATTR[`DSP_PREADD58__DSP_MODE] = DSP_MODE;
end

always @(*) begin
  DSP_MODE_REG = ATTR[`DSP_PREADD58__DSP_MODE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_PREADD58_ADDR_SZ-1:0] addr;
  input  [`DSP_PREADD58_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_PREADD58_DATA_SZ-1:0] read_attr;
  input  [`DSP_PREADD58_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
