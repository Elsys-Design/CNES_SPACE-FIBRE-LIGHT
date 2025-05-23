`include "B_NPI_NIR_defines.vh"

reg [`NPI_NIR_DATA_SZ-1:0] ATTR [0:`NPI_NIR_ADDR_N-1];
reg [`NPI_NIR__REG_CNTL_SZ-1:0] REG_CNTL_REG = REG_CNTL;
reg [`NPI_NIR__REG_SRVC_SZ-1:0] REG_SRVC_REG = REG_SRVC;
reg [`NPI_NIR__REG_TIMEBASE_SEL_SZ-1:0] REG_TIMEBASE_SEL_REG = REG_TIMEBASE_SEL;

initial begin
  ATTR[`NPI_NIR__REG_CNTL] = REG_CNTL;
  ATTR[`NPI_NIR__REG_SRVC] = REG_SRVC;
  ATTR[`NPI_NIR__REG_TIMEBASE_SEL] = REG_TIMEBASE_SEL;
end

always @(trig_attr) begin
  REG_CNTL_REG = ATTR[`NPI_NIR__REG_CNTL];
  REG_SRVC_REG = ATTR[`NPI_NIR__REG_SRVC];
  REG_TIMEBASE_SEL_REG = ATTR[`NPI_NIR__REG_TIMEBASE_SEL];
end

// procedures to override, read attribute values

task write_attr;
  input  [`NPI_NIR_ADDR_SZ-1:0] addr;
  input  [`NPI_NIR_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`NPI_NIR_DATA_SZ-1:0] read_attr;
  input  [`NPI_NIR_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
