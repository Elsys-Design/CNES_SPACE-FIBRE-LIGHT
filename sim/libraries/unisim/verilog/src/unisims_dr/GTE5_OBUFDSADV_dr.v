`include "B_GTE5_OBUFDSADV_defines.vh"

reg [`GTE5_OBUFDSADV_DATA_SZ-1:0] ATTR [0:`GTE5_OBUFDSADV_ADDR_N-1];
reg REFCLK_EN_TX_PATH_REG = REFCLK_EN_TX_PATH;
reg [`GTE5_OBUFDSADV__RXRECCLKOUT_SEL_SZ-1:0] RXRECCLKOUT_SEL_REG = RXRECCLKOUT_SEL;

initial begin
  ATTR[`GTE5_OBUFDSADV__REFCLK_EN_TX_PATH] = REFCLK_EN_TX_PATH;
  ATTR[`GTE5_OBUFDSADV__RXRECCLKOUT_SEL] = RXRECCLKOUT_SEL;
end

always @(trig_attr) begin
  REFCLK_EN_TX_PATH_REG = ATTR[`GTE5_OBUFDSADV__REFCLK_EN_TX_PATH];
  RXRECCLKOUT_SEL_REG = ATTR[`GTE5_OBUFDSADV__RXRECCLKOUT_SEL];
end

// procedures to override, read attribute values

task write_attr;
  input  [`GTE5_OBUFDSADV_ADDR_SZ-1:0] addr;
  input  [`GTE5_OBUFDSADV_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`GTE5_OBUFDSADV_DATA_SZ-1:0] read_attr;
  input  [`GTE5_OBUFDSADV_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
