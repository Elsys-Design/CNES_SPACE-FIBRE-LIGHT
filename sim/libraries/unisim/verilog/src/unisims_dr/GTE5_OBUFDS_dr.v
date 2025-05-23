`include "B_GTE5_OBUFDS_defines.vh"

reg [`GTE5_OBUFDS_DATA_SZ-1:0] ATTR [0:`GTE5_OBUFDS_ADDR_N-1];
reg REFCLK_EN_TX_PATH_REG = REFCLK_EN_TX_PATH;

initial begin
  ATTR[`GTE5_OBUFDS__REFCLK_EN_TX_PATH] = REFCLK_EN_TX_PATH;
end

always @(trig_attr) begin
  REFCLK_EN_TX_PATH_REG = ATTR[`GTE5_OBUFDS__REFCLK_EN_TX_PATH];
end

// procedures to override, read attribute values

task write_attr;
  input  [`GTE5_OBUFDS_ADDR_SZ-1:0] addr;
  input  [`GTE5_OBUFDS_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`GTE5_OBUFDS_DATA_SZ-1:0] read_attr;
  input  [`GTE5_OBUFDS_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
