`include "B_IBUFDS_defines.vh"

reg [`IBUFDS_DATA_SZ-1:0] ATTR [0:`IBUFDS_ADDR_N-1];
reg [`IBUFDS__DIFF_TERM_SZ:1] DIFF_TERM_REG = DIFF_TERM;
reg [`IBUFDS__DQS_BIAS_SZ:1] DQS_BIAS_REG = DQS_BIAS;
reg [`IBUFDS__IBUF_LOW_PWR_SZ:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
reg [`IBUFDS__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;

initial begin
  ATTR[`IBUFDS__DIFF_TERM] = DIFF_TERM;
  ATTR[`IBUFDS__DQS_BIAS] = DQS_BIAS;
  ATTR[`IBUFDS__IBUF_LOW_PWR] = IBUF_LOW_PWR;
  ATTR[`IBUFDS__IOSTANDARD] = IOSTANDARD;
end

always @(trig_attr) begin
  DIFF_TERM_REG = ATTR[`IBUFDS__DIFF_TERM];
  DQS_BIAS_REG = ATTR[`IBUFDS__DQS_BIAS];
  IBUF_LOW_PWR_REG = ATTR[`IBUFDS__IBUF_LOW_PWR];
  IOSTANDARD_REG = ATTR[`IBUFDS__IOSTANDARD];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IBUFDS_ADDR_SZ-1:0] addr;
  input  [`IBUFDS_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IBUFDS_DATA_SZ-1:0] read_attr;
  input  [`IBUFDS_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
