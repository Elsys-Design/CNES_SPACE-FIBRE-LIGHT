`include "B_IOBUFDS_DIFF_OUT_ODDR_defines.vh"

reg [`IOBUFDS_DIFF_OUT_ODDR_DATA_SZ-1:0] ATTR [0:`IOBUFDS_DIFF_OUT_ODDR_ADDR_N-1];
reg [`IOBUFDS_DIFF_OUT_ODDR__DIFF_TERM_SZ:1] DIFF_TERM_REG = DIFF_TERM;
reg [`IOBUFDS_DIFF_OUT_ODDR__DQS_BIAS_SZ:1] DQS_BIAS_REG = DQS_BIAS;
reg [`IOBUFDS_DIFF_OUT_ODDR__EN_OMUX_SZ:1] EN_OMUX_REG = EN_OMUX;
reg [`IOBUFDS_DIFF_OUT_ODDR__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;

initial begin
  ATTR[`IOBUFDS_DIFF_OUT_ODDR__DIFF_TERM] = DIFF_TERM;
  ATTR[`IOBUFDS_DIFF_OUT_ODDR__DQS_BIAS] = DQS_BIAS;
  ATTR[`IOBUFDS_DIFF_OUT_ODDR__EN_OMUX] = EN_OMUX;
  ATTR[`IOBUFDS_DIFF_OUT_ODDR__IOSTANDARD] = IOSTANDARD;
end

always @(trig_attr) begin
  DIFF_TERM_REG = ATTR[`IOBUFDS_DIFF_OUT_ODDR__DIFF_TERM];
  DQS_BIAS_REG = ATTR[`IOBUFDS_DIFF_OUT_ODDR__DQS_BIAS];
  EN_OMUX_REG = ATTR[`IOBUFDS_DIFF_OUT_ODDR__EN_OMUX];
  IOSTANDARD_REG = ATTR[`IOBUFDS_DIFF_OUT_ODDR__IOSTANDARD];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IOBUFDS_DIFF_OUT_ODDR_ADDR_SZ-1:0] addr;
  input  [`IOBUFDS_DIFF_OUT_ODDR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IOBUFDS_DIFF_OUT_ODDR_DATA_SZ-1:0] read_attr;
  input  [`IOBUFDS_DIFF_OUT_ODDR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
