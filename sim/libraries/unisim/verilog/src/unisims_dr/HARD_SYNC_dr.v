`include "B_HARD_SYNC_defines.vh"

reg [`HARD_SYNC_DATA_SZ-1:0] ATTR [0:`HARD_SYNC_ADDR_N-1];
reg INIT_REG = INIT;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg [`HARD_SYNC__LATENCY_SZ-1:0] LATENCY_REG = LATENCY;

initial begin
  ATTR[`HARD_SYNC__INIT] = INIT;
  ATTR[`HARD_SYNC__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`HARD_SYNC__LATENCY] = LATENCY;
end

always @(trig_attr) begin
  INIT_REG = ATTR[`HARD_SYNC__INIT];
  IS_CLK_INVERTED_REG = ATTR[`HARD_SYNC__IS_CLK_INVERTED];
  LATENCY_REG = ATTR[`HARD_SYNC__LATENCY];
end

// procedures to override, read attribute values

task write_attr;
  input  [`HARD_SYNC_ADDR_SZ-1:0] addr;
  input  [`HARD_SYNC_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`HARD_SYNC_DATA_SZ-1:0] read_attr;
  input  [`HARD_SYNC_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
