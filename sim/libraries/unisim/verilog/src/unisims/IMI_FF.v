///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2019 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        IMI_FF
// /___/   /\      Filename    : IMI_FF.v
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

module IMI_FF #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter CLK_MODE = "BYPASS",
  parameter IMR_REG = "UNUSED",
  parameter INIT_MODE = "INIT_D",
  parameter SYNC_VAL = "ASYNC"
)(
  output Q,

  input CE,
  input CLK,
  input D,
  input SR
);

// define constants
  localparam MODULE_NAME = "IMI_FF";
  
// Parameter encodings and registers
  localparam CLK_MODE_BYPASS = 0;
  localparam CLK_MODE_CLK1 = 1;
  localparam CLK_MODE_CLK2 = 2;
  localparam IMR_REG_UNUSED = 0;
  localparam IMR_REG_USED = 1;
  localparam INIT_MODE_INIT_0 = 1;
  localparam INIT_MODE_INIT_D = 0;
  localparam SYNC_VAL_ASYNC = 0;
  localparam SYNC_VAL_SYNC = 1;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "IMI_FF_dr.v"
`else
  reg [48:1] CLK_MODE_REG = CLK_MODE;
  reg [48:1] IMR_REG_REG = IMR_REG;
  reg [48:1] INIT_MODE_REG = INIT_MODE;
  reg [40:1] SYNC_VAL_REG = SYNC_VAL;
`endif

`ifdef XIL_XECLIB
  wire [1:0] CLK_MODE_BIN;
  wire IMR_REG_BIN;
  wire INIT_MODE_BIN;
  wire SYNC_VAL_BIN;
`else
  reg [1:0] CLK_MODE_BIN;
  reg IMR_REG_BIN;
  reg INIT_MODE_BIN;
  reg SYNC_VAL_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire CE_in;
  wire CLK_in;
  wire D_in;
  wire SR_in;

`ifdef XIL_TIMING
  wire CE_delay;
  wire CLK_delay;
  wire D_delay;
  wire SR_delay;
`endif

`ifdef XIL_TIMING
  assign CE_in = (CE === 1'bz) || CE_delay; // rv 1
  assign CLK_in = CLK_delay;
  assign D_in = D_delay;
  assign SR_in = (SR !== 1'bz) && SR_delay; // rv 0
`else
  assign CE_in = (CE === 1'bz) || CE; // rv 1
  assign CLK_in = CLK;
  assign D_in = D;
  assign SR_in = (SR !== 1'bz) && SR; // rv 0
`endif

`ifndef XIL_XECLIB
  reg attr_test;
  reg attr_err;
  
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
  assign CLK_MODE_BIN =
      (CLK_MODE_REG == "BYPASS") ? CLK_MODE_BYPASS :
      (CLK_MODE_REG == "CLK1") ? CLK_MODE_CLK1 :
      (CLK_MODE_REG == "CLK2") ? CLK_MODE_CLK2 :
       CLK_MODE_BYPASS;
  
  assign IMR_REG_BIN =
      (IMR_REG_REG == "UNUSED") ? IMR_REG_UNUSED :
      (IMR_REG_REG == "USED") ? IMR_REG_USED :
       IMR_REG_UNUSED;
  
  assign INIT_MODE_BIN =
      (INIT_MODE_REG == "INIT_D") ? INIT_MODE_INIT_D :
      (INIT_MODE_REG == "INIT_0") ? INIT_MODE_INIT_0 :
       INIT_MODE_INIT_D;
  
  assign SYNC_VAL_BIN =
      (SYNC_VAL_REG == "ASYNC") ? SYNC_VAL_ASYNC :
      (SYNC_VAL_REG == "SYNC") ? SYNC_VAL_SYNC :
       SYNC_VAL_ASYNC;
  
`else
  always @ (trig_attr) begin
  #1;
  CLK_MODE_BIN =
      (CLK_MODE_REG == "BYPASS") ? CLK_MODE_BYPASS :
      (CLK_MODE_REG == "CLK1") ? CLK_MODE_CLK1 :
      (CLK_MODE_REG == "CLK2") ? CLK_MODE_CLK2 :
       CLK_MODE_BYPASS;
  
  IMR_REG_BIN =
      (IMR_REG_REG == "UNUSED") ? IMR_REG_UNUSED :
      (IMR_REG_REG == "USED") ? IMR_REG_USED :
       IMR_REG_UNUSED;
  
  INIT_MODE_BIN =
      (INIT_MODE_REG == "INIT_D") ? INIT_MODE_INIT_D :
      (INIT_MODE_REG == "INIT_0") ? INIT_MODE_INIT_0 :
       INIT_MODE_INIT_D;
  
  SYNC_VAL_BIN =
      (SYNC_VAL_REG == "ASYNC") ? SYNC_VAL_ASYNC :
      (SYNC_VAL_REG == "SYNC") ? SYNC_VAL_SYNC :
       SYNC_VAL_ASYNC;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((CLK_MODE_REG != "BYPASS") &&
         (CLK_MODE_REG != "CLK1") &&
         (CLK_MODE_REG != "CLK2"))) begin
      $display("Error: [Unisim %s-101] CLK_MODE attribute is set to %s.  Legal values for this attribute are BYPASS, CLK1 or CLK2. Instance: %m", MODULE_NAME, CLK_MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IMR_REG_REG != "UNUSED") &&
         (IMR_REG_REG != "USED"))) begin
      $display("Error: [Unisim %s-102] IMR_REG attribute is set to %s.  Legal values for this attribute are UNUSED or USED. Instance: %m", MODULE_NAME, IMR_REG_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((INIT_MODE_REG != "INIT_D") &&
         (INIT_MODE_REG != "INIT_0"))) begin
      $display("Error: [Unisim %s-103] INIT_MODE attribute is set to %s.  Legal values for this attribute are INIT_D or INIT_0. Instance: %m", MODULE_NAME, INIT_MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SYNC_VAL_REG != "ASYNC") &&
         (SYNC_VAL_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-104] SYNC_VAL attribute is set to %s.  Legal values for this attribute are ASYNC or SYNC. Instance: %m", MODULE_NAME, SYNC_VAL_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  reg  Q_out;
  wire Q_reset_val;
  
  assign Q = ((IMR_REG_BIN == IMR_REG_UNUSED)||(CLK_MODE_BIN==CLK_MODE_BYPASS)) ? D_in : Q_out;

  assign Q_reset_val = (INIT_MODE_BIN == INIT_MODE_INIT_D) ? D_in : 1'b0;


  // INIT_MODE=INIT_D (Q_reset value) affects the configuration time, 
  // which is not simulated. Therefore INIT_D only can affect time=0 value.
  initial begin
    Q_out =  Q_reset_val;
  end


  always @(posedge CLK_in or posedge SR_in) begin
    if(SYNC_VAL_BIN == SYNC_VAL_ASYNC) begin
      if (SR_in) 
        Q_out <= 1'b0;
      else if (CE_in)
        Q_out <=  D_in;
    end 
    else if(CLK_in) begin //&& SYNC_VAL_BIN == SYNC_VAL_SYNC
      if(SR_in)
        Q_out <= 1'b0;
      else if (CE_in)
        Q_out <=  D_in;
    end
  end


// end behavioral model

`ifndef XIL_XECLIB
  specify
    (CLK => Q) = (100:100:100, 100:100:100);
    (D => Q) = (0:0:0, 0:0:0);
    (posedge SR => (Q +: 0)) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
    $period (negedge CLK, 0:0:0, notifier);
    $period (posedge CLK, 0:0:0, notifier);
    $recrem (negedge SR, posedge CLK, 0:0:0, 0:0:0, notifier, , , SR_delay, CLK_delay);
    $recrem (posedge SR, posedge CLK, 0:0:0, 0:0:0, notifier, , , SR_delay, CLK_delay);
    $setuphold (posedge CLK, negedge CE, 0:0:0, 0:0:0, notifier, , , CLK_delay, CE_delay);
    $setuphold (posedge CLK, negedge D, 0:0:0, 0:0:0, notifier, , , CLK_delay, D_delay);
    $setuphold (posedge CLK, negedge SR, 0:0:0, 0:0:0, notifier, , , CLK_delay, SR_delay);
    $setuphold (posedge CLK, posedge CE, 0:0:0, 0:0:0, notifier, , , CLK_delay, CE_delay);
    $setuphold (posedge CLK, posedge D, 0:0:0, 0:0:0, notifier, , , CLK_delay, D_delay);
    $setuphold (posedge CLK, posedge SR, 0:0:0, 0:0:0, notifier, , , CLK_delay, SR_delay);
    $width (negedge CLK, 0:0:0, 0, notifier);
    $width (negedge SR, 0:0:0, 0, notifier);
    $width (posedge CLK, 0:0:0, 0, notifier);
    $width (posedge SR, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
