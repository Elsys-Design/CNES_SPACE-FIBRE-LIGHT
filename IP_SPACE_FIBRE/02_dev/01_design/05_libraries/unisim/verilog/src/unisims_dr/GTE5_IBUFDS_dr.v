`include "B_GTE5_IBUFDS_defines.vh"

reg [`GTE5_IBUFDS_DATA_SZ-1:0] ATTR [0:`GTE5_IBUFDS_ADDR_N-1];
reg REFCLK_EN_TX_PATH_REG = REFCLK_EN_TX_PATH;
reg [`GTE5_IBUFDS__REFCLK_HROW_CK_SEL_SZ-1:0] REFCLK_HROW_CK_SEL_REG = REFCLK_HROW_CK_SEL;
reg [`GTE5_IBUFDS__REFCLK_ICNTL_RX_SZ-1:0] REFCLK_ICNTL_RX_REG = REFCLK_ICNTL_RX;

initial begin
  ATTR[`GTE5_IBUFDS__REFCLK_EN_TX_PATH] = REFCLK_EN_TX_PATH;
  ATTR[`GTE5_IBUFDS__REFCLK_HROW_CK_SEL] = REFCLK_HROW_CK_SEL;
  ATTR[`GTE5_IBUFDS__REFCLK_ICNTL_RX] = REFCLK_ICNTL_RX;
end

always @(trig_attr) begin
  REFCLK_EN_TX_PATH_REG = ATTR[`GTE5_IBUFDS__REFCLK_EN_TX_PATH];
  REFCLK_HROW_CK_SEL_REG = ATTR[`GTE5_IBUFDS__REFCLK_HROW_CK_SEL];
  REFCLK_ICNTL_RX_REG = ATTR[`GTE5_IBUFDS__REFCLK_ICNTL_RX];
end

// procedures to override, read attribute values

task write_attr;
  input  [`GTE5_IBUFDS_ADDR_SZ-1:0] addr;
  input  [`GTE5_IBUFDS_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`GTE5_IBUFDS_DATA_SZ-1:0] read_attr;
  input  [`GTE5_IBUFDS_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
