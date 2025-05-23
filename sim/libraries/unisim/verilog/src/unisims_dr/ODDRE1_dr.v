`include "B_ODDRE1_defines.vh"

reg [`ODDRE1_DATA_SZ-1:0] ATTR [0:`ODDRE1_ADDR_N-1];
reg IS_C_INVERTED_REG = IS_C_INVERTED;
reg IS_D1_INVERTED_REG = IS_D1_INVERTED;
reg IS_D2_INVERTED_REG = IS_D2_INVERTED;
reg [`ODDRE1__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
reg SRVAL_REG = SRVAL;

initial begin
  ATTR[`ODDRE1__IS_C_INVERTED] = IS_C_INVERTED;
  ATTR[`ODDRE1__IS_D1_INVERTED] = IS_D1_INVERTED;
  ATTR[`ODDRE1__IS_D2_INVERTED] = IS_D2_INVERTED;
  ATTR[`ODDRE1__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`ODDRE1__SRVAL] = SRVAL;
end

always @(trig_attr) begin
  IS_C_INVERTED_REG = ATTR[`ODDRE1__IS_C_INVERTED];
  IS_D1_INVERTED_REG = ATTR[`ODDRE1__IS_D1_INVERTED];
  IS_D2_INVERTED_REG = ATTR[`ODDRE1__IS_D2_INVERTED];
  SIM_DEVICE_REG = ATTR[`ODDRE1__SIM_DEVICE];
  SRVAL_REG = ATTR[`ODDRE1__SRVAL];
end

// procedures to override, read attribute values

task write_attr;
  input  [`ODDRE1_ADDR_SZ-1:0] addr;
  input  [`ODDRE1_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`ODDRE1_DATA_SZ-1:0] read_attr;
  input  [`ODDRE1_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
