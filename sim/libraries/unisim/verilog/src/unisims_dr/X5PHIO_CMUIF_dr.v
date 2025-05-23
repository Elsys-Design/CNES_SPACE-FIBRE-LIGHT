`include "B_X5PHIO_CMUIF_defines.vh"

reg [`X5PHIO_CMUIF_DATA_SZ-1:0] ATTR [0:`X5PHIO_CMUIF_ADDR_N-1];
reg [`X5PHIO_CMUIF__APBCLK_FREQ_SZ-1:0] APBCLK_FREQ_REG = APBCLK_FREQ;
reg [`X5PHIO_CMUIF__DMC_APB_SEL_CMU_SZ:1] DMC_APB_SEL_CMU_REG = DMC_APB_SEL_CMU;
reg [`X5PHIO_CMUIF__RIUCLK_DBLR_BYPASS_SZ:1] RIUCLK_DBLR_BYPASS_REG = RIUCLK_DBLR_BYPASS;
reg [`X5PHIO_CMUIF__RIU_CLK_DBL_CMU_SZ-1:0] RIU_CLK_DBL_CMU_REG = RIU_CLK_DBL_CMU;

initial begin
  ATTR[`X5PHIO_CMUIF__APBCLK_FREQ] = APBCLK_FREQ;
  ATTR[`X5PHIO_CMUIF__DMC_APB_SEL_CMU] = DMC_APB_SEL_CMU;
  ATTR[`X5PHIO_CMUIF__RIUCLK_DBLR_BYPASS] = RIUCLK_DBLR_BYPASS;
  ATTR[`X5PHIO_CMUIF__RIU_CLK_DBL_CMU] = RIU_CLK_DBL_CMU;
end

always @(trig_attr) begin
  APBCLK_FREQ_REG = ATTR[`X5PHIO_CMUIF__APBCLK_FREQ];
  DMC_APB_SEL_CMU_REG = ATTR[`X5PHIO_CMUIF__DMC_APB_SEL_CMU];
  RIUCLK_DBLR_BYPASS_REG = ATTR[`X5PHIO_CMUIF__RIUCLK_DBLR_BYPASS];
  RIU_CLK_DBL_CMU_REG = ATTR[`X5PHIO_CMUIF__RIU_CLK_DBL_CMU];
end

// procedures to override, read attribute values

task write_attr;
  input  [`X5PHIO_CMUIF_ADDR_SZ-1:0] addr;
  input  [`X5PHIO_CMUIF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`X5PHIO_CMUIF_DATA_SZ-1:0] read_attr;
  input  [`X5PHIO_CMUIF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
