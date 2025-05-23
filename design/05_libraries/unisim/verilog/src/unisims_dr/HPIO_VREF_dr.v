`include "B_HPIO_VREF_defines.vh"

reg [`HPIO_VREF_DATA_SZ-1:0] ATTR [0:`HPIO_VREF_ADDR_N-1];
reg [`HPIO_VREF__VREF_CNTR_SZ:1] VREF_CNTR_REG = VREF_CNTR;

initial begin
  ATTR[`HPIO_VREF__VREF_CNTR] = VREF_CNTR;
end

always @(trig_attr) begin
  VREF_CNTR_REG = ATTR[`HPIO_VREF__VREF_CNTR];
end

// procedures to override, read attribute values

task write_attr;
  input  [`HPIO_VREF_ADDR_SZ-1:0] addr;
  input  [`HPIO_VREF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`HPIO_VREF_DATA_SZ-1:0] read_attr;
  input  [`HPIO_VREF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
