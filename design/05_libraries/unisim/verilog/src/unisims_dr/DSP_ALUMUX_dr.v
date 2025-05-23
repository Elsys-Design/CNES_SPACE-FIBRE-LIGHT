`include "B_DSP_ALUMUX_defines.vh"

reg [`DSP_ALUMUX_DATA_SZ-1:0] ATTR [0:`DSP_ALUMUX_ADDR_N-1];
reg [`DSP_ALUMUX__DSP_MODE_SZ:1] DSP_MODE_REG = DSP_MODE;
reg [`DSP_ALUMUX__LEGACY_SZ:1] LEGACY_REG = LEGACY;
reg [`DSP_ALUMUX__RND_SZ-1:0] RND_REG = RND;

initial begin
  ATTR[`DSP_ALUMUX__DSP_MODE] = DSP_MODE;
  ATTR[`DSP_ALUMUX__LEGACY] = LEGACY;
  ATTR[`DSP_ALUMUX__RND] = RND;
end

always @(*) begin
  DSP_MODE_REG = ATTR[`DSP_ALUMUX__DSP_MODE];
  LEGACY_REG = ATTR[`DSP_ALUMUX__LEGACY];
  RND_REG = ATTR[`DSP_ALUMUX__RND];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_ALUMUX_ADDR_SZ-1:0] addr;
  input  [`DSP_ALUMUX_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_ALUMUX_DATA_SZ-1:0] read_attr;
  input  [`DSP_ALUMUX_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
