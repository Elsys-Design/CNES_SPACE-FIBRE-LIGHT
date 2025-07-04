`include "B_OBUFTDS_DCIEN_defines.vh"

reg [`OBUFTDS_DCIEN_DATA_SZ-1:0] ATTR [0:`OBUFTDS_DCIEN_ADDR_N-1];
reg [`OBUFTDS_DCIEN__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;
reg [`OBUFTDS_DCIEN__SLEW_SZ:1] SLEW_REG = SLEW;

initial begin
  ATTR[`OBUFTDS_DCIEN__IOSTANDARD] = IOSTANDARD;
  ATTR[`OBUFTDS_DCIEN__SLEW] = SLEW;
end

always @(trig_attr) begin
  IOSTANDARD_REG = ATTR[`OBUFTDS_DCIEN__IOSTANDARD];
  SLEW_REG = ATTR[`OBUFTDS_DCIEN__SLEW];
end

// procedures to override, read attribute values

task write_attr;
  input  [`OBUFTDS_DCIEN_ADDR_SZ-1:0] addr;
  input  [`OBUFTDS_DCIEN_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`OBUFTDS_DCIEN_DATA_SZ-1:0] read_attr;
  input  [`OBUFTDS_DCIEN_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
