`include "B_XPIO_VREF_TEST_defines.vh"

reg [`XPIO_VREF_TEST_DATA_SZ-1:0] ATTR [0:`XPIO_VREF_TEST_ADDR_N-1];
reg [40:1] DCI_CSSD_EN_REG = DCI_CSSD_EN;
reg [40:1] VREF_AMS_EN_REG = VREF_AMS_EN;
reg [104:1] VREF_CNTR_REG = VREF_CNTR;

initial begin
  ATTR[`XPIO_VREF_TEST__DCI_CSSD_EN] = DCI_CSSD_EN;
  ATTR[`XPIO_VREF_TEST__VREF_AMS_EN] = VREF_AMS_EN;
  ATTR[`XPIO_VREF_TEST__VREF_CNTR] = VREF_CNTR;
end

always @(trig_attr) begin
  DCI_CSSD_EN_REG = ATTR[`XPIO_VREF_TEST__DCI_CSSD_EN];
  VREF_AMS_EN_REG = ATTR[`XPIO_VREF_TEST__VREF_AMS_EN];
  VREF_CNTR_REG = ATTR[`XPIO_VREF_TEST__VREF_CNTR];
end

// procedures to override, read attribute values

task write_attr;
  input  [`XPIO_VREF_TEST_ADDR_SZ-1:0] addr;
  input  [`XPIO_VREF_TEST_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`XPIO_VREF_TEST_DATA_SZ-1:0] read_attr;
  input  [`XPIO_VREF_TEST_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
