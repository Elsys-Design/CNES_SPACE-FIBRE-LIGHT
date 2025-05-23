`include "B_BFR_MATMULX_defines.vh"

reg [`BFR_MATMULX_DATA_SZ-1:0] ATTR [0:`BFR_MATMULX_ADDR_N-1];
real ACTIVE_DUTYCYCLE_REG = ACTIVE_DUTYCYCLE;
reg [`BFR_MATMULX__BFRTYPE_SZ:1] BFRTYPE_REG = BFRTYPE;
real CLK_FREQ_REG = CLK_FREQ;
reg EN_CLK_DOUBLER_REG = EN_CLK_DOUBLER;
reg [`BFR_MATMULX__NUM_COMPUTE_SZ-1:0] NUM_COMPUTE_REG = NUM_COMPUTE;
reg [`BFR_MATMULX__NUM_MEMORY_SZ-1:0] NUM_MEMORY_REG = NUM_MEMORY;
reg [`BFR_MATMULX__XPA_CFG0_SZ-1:0] XPA_CFG0_REG = XPA_CFG0;

initial begin
  ATTR[`BFR_MATMULX__ACTIVE_DUTYCYCLE] = $realtobits(ACTIVE_DUTYCYCLE);
  ATTR[`BFR_MATMULX__BFRTYPE] = BFRTYPE;
  ATTR[`BFR_MATMULX__CLK_FREQ] = $realtobits(CLK_FREQ);
  ATTR[`BFR_MATMULX__EN_CLK_DOUBLER] = EN_CLK_DOUBLER;
  ATTR[`BFR_MATMULX__NUM_COMPUTE] = NUM_COMPUTE;
  ATTR[`BFR_MATMULX__NUM_MEMORY] = NUM_MEMORY;
  ATTR[`BFR_MATMULX__XPA_CFG0] = XPA_CFG0;
end

always @(trig_attr) begin
  ACTIVE_DUTYCYCLE_REG = $bitstoreal(ATTR[`BFR_MATMULX__ACTIVE_DUTYCYCLE]);
  BFRTYPE_REG = ATTR[`BFR_MATMULX__BFRTYPE];
  CLK_FREQ_REG = $bitstoreal(ATTR[`BFR_MATMULX__CLK_FREQ]);
  EN_CLK_DOUBLER_REG = ATTR[`BFR_MATMULX__EN_CLK_DOUBLER];
  NUM_COMPUTE_REG = ATTR[`BFR_MATMULX__NUM_COMPUTE];
  NUM_MEMORY_REG = ATTR[`BFR_MATMULX__NUM_MEMORY];
  XPA_CFG0_REG = ATTR[`BFR_MATMULX__XPA_CFG0];
end

// procedures to override, read attribute values

task write_attr;
  input  [`BFR_MATMULX_ADDR_SZ-1:0] addr;
  input  [`BFR_MATMULX_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`BFR_MATMULX_DATA_SZ-1:0] read_attr;
  input  [`BFR_MATMULX_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
