`include "B_IBUFDS_GTE5_defines.vh"

reg [`IBUFDS_GTE5_DATA_SZ-1:0] ATTR [0:`IBUFDS_GTE5_ADDR_N-1];
reg REFCLK_EN_TX_PATH_REG = REFCLK_EN_TX_PATH;
reg [`IBUFDS_GTE5__REFCLK_HROW_CK_SEL_SZ-1:0] REFCLK_HROW_CK_SEL_REG = REFCLK_HROW_CK_SEL;
reg [`IBUFDS_GTE5__REFCLK_ICNTL_RX_SZ-1:0] REFCLK_ICNTL_RX_REG = REFCLK_ICNTL_RX;

initial begin
  ATTR[`IBUFDS_GTE5__REFCLK_EN_TX_PATH] = REFCLK_EN_TX_PATH;
  ATTR[`IBUFDS_GTE5__REFCLK_HROW_CK_SEL] = REFCLK_HROW_CK_SEL;
  ATTR[`IBUFDS_GTE5__REFCLK_ICNTL_RX] = REFCLK_ICNTL_RX;
end

always @(trig_attr) begin
  REFCLK_EN_TX_PATH_REG = ATTR[`IBUFDS_GTE5__REFCLK_EN_TX_PATH];
  REFCLK_HROW_CK_SEL_REG = ATTR[`IBUFDS_GTE5__REFCLK_HROW_CK_SEL];
  REFCLK_ICNTL_RX_REG = ATTR[`IBUFDS_GTE5__REFCLK_ICNTL_RX];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IBUFDS_GTE5_ADDR_SZ-1:0] addr;
  input  [`IBUFDS_GTE5_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IBUFDS_GTE5_DATA_SZ-1:0] read_attr;
  input  [`IBUFDS_GTE5_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
