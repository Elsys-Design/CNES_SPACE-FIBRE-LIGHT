`include "B_STARTUPE3_defines.vh"

reg [`STARTUPE3_DATA_SZ-1:0] ATTR [0:`STARTUPE3_ADDR_N-1];
reg [`STARTUPE3__PROG_USR_SZ:1] PROG_USR_REG = PROG_USR;
real SIM_CCLK_FREQ_REG = SIM_CCLK_FREQ;

initial begin
  ATTR[`STARTUPE3__PROG_USR] = PROG_USR;
  ATTR[`STARTUPE3__SIM_CCLK_FREQ] = $realtobits(SIM_CCLK_FREQ);
end

always @(trig_attr) begin
  PROG_USR_REG = ATTR[`STARTUPE3__PROG_USR];
  SIM_CCLK_FREQ_REG = $bitstoreal(ATTR[`STARTUPE3__SIM_CCLK_FREQ]);
end

// procedures to override, read attribute values

task write_attr;
  input  [`STARTUPE3_ADDR_SZ-1:0] addr;
  input  [`STARTUPE3_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`STARTUPE3_DATA_SZ-1:0] read_attr;
  input  [`STARTUPE3_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
