///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2017 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        BUFIODQS
// /___/   /\      Filename    : BUFIODQS.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module BUFIODQS #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter DQSMASK_ENABLE = "FALSE"
)(
  output O,

  input DQSMASK,
  input I
);

// define constants
  localparam MODULE_NAME = "BUFIODQS";
  
// Parameter encodings and registers
  localparam DQSMASK_ENABLE_FALSE = 0;
  localparam DQSMASK_ENABLE_TRUE = 1;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "BUFIODQS_dr.v"
`else
  localparam [40:1] DQSMASK_ENABLE_REG = DQSMASK_ENABLE;
`endif

`ifdef XIL_XECLIB
  wire DQSMASK_ENABLE_BIN;
`else
  reg DQSMASK_ENABLE_BIN;
`endif

  reg attr_test;
  reg attr_err;
  tri0 glblGSR = glbl.GSR;

`ifndef XIL_XECLIB
  initial begin
  trig_attr = 1'b0;
  `ifdef XIL_ATTR_TEST
    attr_test = 1'b1;
  `else
    attr_test = 1'b0;
  `endif
    attr_err = 1'b0;
    #1;
    trig_attr = ~trig_attr;
  end
`endif

`ifdef XIL_XECLIB
  assign DQSMASK_ENABLE_BIN =
      (DQSMASK_ENABLE_REG == "FALSE") ? DQSMASK_ENABLE_FALSE :
      (DQSMASK_ENABLE_REG == "TRUE")  ? DQSMASK_ENABLE_TRUE  :
       DQSMASK_ENABLE_FALSE;
  
`else
  always @ (trig_attr) begin
  #1;
  DQSMASK_ENABLE_BIN =
      (DQSMASK_ENABLE_REG == "FALSE") ? DQSMASK_ENABLE_FALSE :
      (DQSMASK_ENABLE_REG == "TRUE")  ? DQSMASK_ENABLE_TRUE  :
       DQSMASK_ENABLE_FALSE;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((DQSMASK_ENABLE_REG != "FALSE") &&
         (DQSMASK_ENABLE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-101] DQSMASK_ENABLE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DQSMASK_ENABLE_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

    initial begin
   $display ("ERROR : Component %s instance %m is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the HDL Libraries Guide(s) available on www.xilinx.com.",MODULE_NAME);
   #1 $finish;
    end

// end behavioral model

endmodule

`endcelldefine
