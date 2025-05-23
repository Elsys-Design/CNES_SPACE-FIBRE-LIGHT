`include "B_IBUFDS_DIFF_OUT_defines.vh"

reg [`IBUFDS_DIFF_OUT_DATA_SZ-1:0] ATTR [0:`IBUFDS_DIFF_OUT_ADDR_N-1];
reg [`IBUFDS_DIFF_OUT__DIFF_TERM_SZ:1] DIFF_TERM_REG = DIFF_TERM;
reg [`IBUFDS_DIFF_OUT__DQS_BIAS_SZ:1] DQS_BIAS_REG = DQS_BIAS;
reg [`IBUFDS_DIFF_OUT__IBUF_LOW_PWR_SZ:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
reg [`IBUFDS_DIFF_OUT__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;

initial begin
  ATTR[`IBUFDS_DIFF_OUT__DIFF_TERM] = DIFF_TERM;
  ATTR[`IBUFDS_DIFF_OUT__DQS_BIAS] = DQS_BIAS;
  ATTR[`IBUFDS_DIFF_OUT__IBUF_LOW_PWR] = IBUF_LOW_PWR;
  ATTR[`IBUFDS_DIFF_OUT__IOSTANDARD] = IOSTANDARD;
end

always @(trig_attr) begin
  DIFF_TERM_REG = ATTR[`IBUFDS_DIFF_OUT__DIFF_TERM];
  DQS_BIAS_REG = ATTR[`IBUFDS_DIFF_OUT__DQS_BIAS];
  IBUF_LOW_PWR_REG = ATTR[`IBUFDS_DIFF_OUT__IBUF_LOW_PWR];
  IOSTANDARD_REG = ATTR[`IBUFDS_DIFF_OUT__IOSTANDARD];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IBUFDS_DIFF_OUT_ADDR_SZ-1:0] addr;
  input  [`IBUFDS_DIFF_OUT_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IBUFDS_DIFF_OUT_DATA_SZ-1:0] read_attr;
  input  [`IBUFDS_DIFF_OUT_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
