`include "B_IOBUFDS_defines.vh"

reg [`IOBUFDS_DATA_SZ-1:0] ATTR [0:`IOBUFDS_ADDR_N-1];
reg [`IOBUFDS__DIFF_TERM_SZ:1] DIFF_TERM_REG = DIFF_TERM;
reg [`IOBUFDS__DQS_BIAS_SZ:1] DQS_BIAS_REG = DQS_BIAS;
reg [`IOBUFDS__IBUF_LOW_PWR_SZ:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
reg [`IOBUFDS__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;
reg [`IOBUFDS__SLEW_SZ:1] SLEW_REG = SLEW;

initial begin
  ATTR[`IOBUFDS__DIFF_TERM] = DIFF_TERM;
  ATTR[`IOBUFDS__DQS_BIAS] = DQS_BIAS;
  ATTR[`IOBUFDS__IBUF_LOW_PWR] = IBUF_LOW_PWR;
  ATTR[`IOBUFDS__IOSTANDARD] = IOSTANDARD;
  ATTR[`IOBUFDS__SLEW] = SLEW;
end

always @(trig_attr) begin
  DIFF_TERM_REG = ATTR[`IOBUFDS__DIFF_TERM];
  DQS_BIAS_REG = ATTR[`IOBUFDS__DQS_BIAS];
  IBUF_LOW_PWR_REG = ATTR[`IOBUFDS__IBUF_LOW_PWR];
  IOSTANDARD_REG = ATTR[`IOBUFDS__IOSTANDARD];
  SLEW_REG = ATTR[`IOBUFDS__SLEW];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IOBUFDS_ADDR_SZ-1:0] addr;
  input  [`IOBUFDS_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IOBUFDS_DATA_SZ-1:0] read_attr;
  input  [`IOBUFDS_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
