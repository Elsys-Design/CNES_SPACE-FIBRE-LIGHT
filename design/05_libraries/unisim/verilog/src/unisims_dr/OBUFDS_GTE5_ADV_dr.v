`include "B_OBUFDS_GTE5_ADV_defines.vh"

reg [`OBUFDS_GTE5_ADV_DATA_SZ-1:0] ATTR [0:`OBUFDS_GTE5_ADV_ADDR_N-1];
reg REFCLK_EN_DRV_REG = REFCLK_EN_DRV;
reg REFCLK_EN_TX_PATH_REG = REFCLK_EN_TX_PATH;

initial begin
  ATTR[`OBUFDS_GTE5_ADV__REFCLK_EN_DRV] = REFCLK_EN_DRV;
  ATTR[`OBUFDS_GTE5_ADV__REFCLK_EN_TX_PATH] = REFCLK_EN_TX_PATH;
end

always @(trig_attr) begin
  REFCLK_EN_DRV_REG = ATTR[`OBUFDS_GTE5_ADV__REFCLK_EN_DRV];
  REFCLK_EN_TX_PATH_REG = ATTR[`OBUFDS_GTE5_ADV__REFCLK_EN_TX_PATH];
end

// procedures to override, read attribute values

task write_attr;
  input  [`OBUFDS_GTE5_ADV_ADDR_SZ-1:0] addr;
  input  [`OBUFDS_GTE5_ADV_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`OBUFDS_GTE5_ADV_DATA_SZ-1:0] read_attr;
  input  [`OBUFDS_GTE5_ADV_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
