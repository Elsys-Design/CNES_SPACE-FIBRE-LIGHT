`include "B_OBUFDS_GTE3_defines.vh"

reg [`OBUFDS_GTE3_DATA_SZ-1:0] ATTR [0:`OBUFDS_GTE3_ADDR_N-1];
reg [1:0] REFCLK_CLKOUT_SEL_REG;
reg [0:0] REFCLK_EN_TX_PATH_REG;
reg [4:0] REFCLK_ICNTL_TX_REG;

initial begin
  ATTR[`OBUFDS_GTE3__REFCLK_CLKOUT_SEL] = REFCLK_CLKOUT_SEL;
  ATTR[`OBUFDS_GTE3__REFCLK_EN_TX_PATH] = REFCLK_EN_TX_PATH;
  ATTR[`OBUFDS_GTE3__REFCLK_ICNTL_TX] = REFCLK_ICNTL_TX;
end

always @(trig_attr) begin
  REFCLK_CLKOUT_SEL_REG = ATTR[`OBUFDS_GTE3__REFCLK_CLKOUT_SEL];
  REFCLK_EN_TX_PATH_REG = ATTR[`OBUFDS_GTE3__REFCLK_EN_TX_PATH];
  REFCLK_ICNTL_TX_REG = ATTR[`OBUFDS_GTE3__REFCLK_ICNTL_TX];
end

// procedures to override, read attribute values

task write_attr;
  input  [`OBUFDS_GTE3_ADDR_SZ-1:0] addr;
  input  [`OBUFDS_GTE3_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`OBUFDS_GTE3_DATA_SZ-1:0] read_attr;
  input  [`OBUFDS_GTE3_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
    trig_attr = ~trig_attr;
  end
endtask
