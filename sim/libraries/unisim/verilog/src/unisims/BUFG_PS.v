///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2019 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        A high-fanout buffer for low-skew distribution of the PS Clock signals
// /___/   /\      Filename    : BUFG_PS.v
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

module BUFG_PS #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter SIM_DEVICE = "ULTRASCALE_PLUS",
  parameter STARTUP_SYNC = "FALSE"
)(
  output O,

  input I
);

// define constants
  localparam MODULE_NAME = "BUFG_PS";
  
// Parameter encodings and registers
  localparam SIM_DEVICE_ULTRASCALE_PLUS = 0;
  localparam SIM_DEVICE_VERSAL_AI_CORE = 1;
  localparam SIM_DEVICE_VERSAL_AI_CORE_ES1 = 2;
  localparam SIM_DEVICE_VERSAL_AI_EDGE = 3;
  localparam SIM_DEVICE_VERSAL_AI_EDGE_ES1 = 4;
  localparam SIM_DEVICE_VERSAL_AI_EDGE_ES2 = 5;
  localparam SIM_DEVICE_VERSAL_AI_RF = 6;
  localparam SIM_DEVICE_VERSAL_AI_RF_ES1 = 7;
  localparam SIM_DEVICE_VERSAL_AI_RF_ES2 = 8;
  localparam SIM_DEVICE_VERSAL_HBM = 9;
  localparam SIM_DEVICE_VERSAL_HBM_ES1 = 10;
  localparam SIM_DEVICE_VERSAL_HBM_ES2 = 11;
  localparam SIM_DEVICE_VERSAL_NET = 12;
  localparam SIM_DEVICE_VERSAL_NET_ES1 = 13;
  localparam SIM_DEVICE_VERSAL_NET_ES2 = 14;
  localparam SIM_DEVICE_VERSAL_PREMIUM = 15;
  localparam SIM_DEVICE_VERSAL_PREMIUM_ES1 = 16;
  localparam SIM_DEVICE_VERSAL_PREMIUM_ES2 = 17;
  localparam SIM_DEVICE_VERSAL_PRIME = 18;
  localparam SIM_DEVICE_VERSAL_PRIME_ES1 = 19;
  localparam STARTUP_SYNC_FALSE = 0;
  localparam STARTUP_SYNC_TRUE = 1;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "BUFG_PS_dr.v"
`else
  reg [144:1] SIM_DEVICE_REG = SIM_DEVICE;
  reg [40:1] STARTUP_SYNC_REG = STARTUP_SYNC;
`endif

`ifdef XIL_XECLIB
  wire [4:0] SIM_DEVICE_BIN;
  wire STARTUP_SYNC_BIN;
`else
  reg [4:0] SIM_DEVICE_BIN;
  reg STARTUP_SYNC_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
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
  assign SIM_DEVICE_BIN =
      (SIM_DEVICE_REG == "ULTRASCALE_PLUS") ? SIM_DEVICE_ULTRASCALE_PLUS :
      (SIM_DEVICE_REG == "VERSAL_AI_CORE") ? SIM_DEVICE_VERSAL_AI_CORE :
      (SIM_DEVICE_REG == "VERSAL_AI_CORE_ES1") ? SIM_DEVICE_VERSAL_AI_CORE_ES1 :
      (SIM_DEVICE_REG == "VERSAL_AI_EDGE") ? SIM_DEVICE_VERSAL_AI_EDGE :
      (SIM_DEVICE_REG == "VERSAL_AI_EDGE_ES1") ? SIM_DEVICE_VERSAL_AI_EDGE_ES1 :
      (SIM_DEVICE_REG == "VERSAL_AI_EDGE_ES2") ? SIM_DEVICE_VERSAL_AI_EDGE_ES2 :
      (SIM_DEVICE_REG == "VERSAL_AI_RF") ? SIM_DEVICE_VERSAL_AI_RF :
      (SIM_DEVICE_REG == "VERSAL_AI_RF_ES1") ? SIM_DEVICE_VERSAL_AI_RF_ES1 :
      (SIM_DEVICE_REG == "VERSAL_AI_RF_ES2") ? SIM_DEVICE_VERSAL_AI_RF_ES2 :
      (SIM_DEVICE_REG == "VERSAL_HBM") ? SIM_DEVICE_VERSAL_HBM :
      (SIM_DEVICE_REG == "VERSAL_HBM_ES1") ? SIM_DEVICE_VERSAL_HBM_ES1 :
      (SIM_DEVICE_REG == "VERSAL_HBM_ES2") ? SIM_DEVICE_VERSAL_HBM_ES2 :
      (SIM_DEVICE_REG == "VERSAL_NET") ? SIM_DEVICE_VERSAL_NET :
      (SIM_DEVICE_REG == "VERSAL_NET_ES1") ? SIM_DEVICE_VERSAL_NET_ES1 :
      (SIM_DEVICE_REG == "VERSAL_NET_ES2") ? SIM_DEVICE_VERSAL_NET_ES2 :
      (SIM_DEVICE_REG == "VERSAL_PREMIUM") ? SIM_DEVICE_VERSAL_PREMIUM :
      (SIM_DEVICE_REG == "VERSAL_PREMIUM_ES1") ? SIM_DEVICE_VERSAL_PREMIUM_ES1 :
      (SIM_DEVICE_REG == "VERSAL_PREMIUM_ES2") ? SIM_DEVICE_VERSAL_PREMIUM_ES2 :
      (SIM_DEVICE_REG == "VERSAL_PRIME") ? SIM_DEVICE_VERSAL_PRIME :
      (SIM_DEVICE_REG == "VERSAL_PRIME_ES1") ? SIM_DEVICE_VERSAL_PRIME_ES1 :
       SIM_DEVICE_ULTRASCALE_PLUS;
  
  assign STARTUP_SYNC_BIN =
      (STARTUP_SYNC_REG == "FALSE") ? STARTUP_SYNC_FALSE :
      (STARTUP_SYNC_REG == "TRUE") ? STARTUP_SYNC_TRUE :
       STARTUP_SYNC_FALSE;
  
`else
  always @ (trig_attr) begin
  #1;
  SIM_DEVICE_BIN =
      (SIM_DEVICE_REG == "ULTRASCALE_PLUS") ? SIM_DEVICE_ULTRASCALE_PLUS :
      (SIM_DEVICE_REG == "VERSAL_AI_CORE") ? SIM_DEVICE_VERSAL_AI_CORE :
      (SIM_DEVICE_REG == "VERSAL_AI_CORE_ES1") ? SIM_DEVICE_VERSAL_AI_CORE_ES1 :
      (SIM_DEVICE_REG == "VERSAL_AI_EDGE") ? SIM_DEVICE_VERSAL_AI_EDGE :
      (SIM_DEVICE_REG == "VERSAL_AI_EDGE_ES1") ? SIM_DEVICE_VERSAL_AI_EDGE_ES1 :
      (SIM_DEVICE_REG == "VERSAL_AI_EDGE_ES2") ? SIM_DEVICE_VERSAL_AI_EDGE_ES2 :
      (SIM_DEVICE_REG == "VERSAL_AI_RF") ? SIM_DEVICE_VERSAL_AI_RF :
      (SIM_DEVICE_REG == "VERSAL_AI_RF_ES1") ? SIM_DEVICE_VERSAL_AI_RF_ES1 :
      (SIM_DEVICE_REG == "VERSAL_AI_RF_ES2") ? SIM_DEVICE_VERSAL_AI_RF_ES2 :
      (SIM_DEVICE_REG == "VERSAL_HBM") ? SIM_DEVICE_VERSAL_HBM :
      (SIM_DEVICE_REG == "VERSAL_HBM_ES1") ? SIM_DEVICE_VERSAL_HBM_ES1 :
      (SIM_DEVICE_REG == "VERSAL_HBM_ES2") ? SIM_DEVICE_VERSAL_HBM_ES2 :
      (SIM_DEVICE_REG == "VERSAL_NET") ? SIM_DEVICE_VERSAL_NET :
      (SIM_DEVICE_REG == "VERSAL_NET_ES1") ? SIM_DEVICE_VERSAL_NET_ES1 :
      (SIM_DEVICE_REG == "VERSAL_NET_ES2") ? SIM_DEVICE_VERSAL_NET_ES2 :
      (SIM_DEVICE_REG == "VERSAL_PREMIUM") ? SIM_DEVICE_VERSAL_PREMIUM :
      (SIM_DEVICE_REG == "VERSAL_PREMIUM_ES1") ? SIM_DEVICE_VERSAL_PREMIUM_ES1 :
      (SIM_DEVICE_REG == "VERSAL_PREMIUM_ES2") ? SIM_DEVICE_VERSAL_PREMIUM_ES2 :
      (SIM_DEVICE_REG == "VERSAL_PRIME") ? SIM_DEVICE_VERSAL_PRIME :
      (SIM_DEVICE_REG == "VERSAL_PRIME_ES1") ? SIM_DEVICE_VERSAL_PRIME_ES1 :
       SIM_DEVICE_ULTRASCALE_PLUS;
  
  STARTUP_SYNC_BIN =
      (STARTUP_SYNC_REG == "FALSE") ? STARTUP_SYNC_FALSE :
      (STARTUP_SYNC_REG == "TRUE") ? STARTUP_SYNC_TRUE :
       STARTUP_SYNC_FALSE;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((SIM_DEVICE_REG != "ULTRASCALE_PLUS") &&
         (SIM_DEVICE_REG != "VERSAL_AI_CORE") &&
         (SIM_DEVICE_REG != "VERSAL_AI_CORE_ES1") &&
         (SIM_DEVICE_REG != "VERSAL_AI_EDGE") &&
         (SIM_DEVICE_REG != "VERSAL_AI_EDGE_ES1") &&
         (SIM_DEVICE_REG != "VERSAL_AI_EDGE_ES2") &&
         (SIM_DEVICE_REG != "VERSAL_AI_RF") &&
         (SIM_DEVICE_REG != "VERSAL_AI_RF_ES1") &&
         (SIM_DEVICE_REG != "VERSAL_AI_RF_ES2") &&
         (SIM_DEVICE_REG != "VERSAL_HBM") &&
         (SIM_DEVICE_REG != "VERSAL_HBM_ES1") &&
         (SIM_DEVICE_REG != "VERSAL_HBM_ES2") &&
         (SIM_DEVICE_REG != "VERSAL_NET") &&
         (SIM_DEVICE_REG != "VERSAL_NET_ES1") &&
         (SIM_DEVICE_REG != "VERSAL_NET_ES2") &&
         (SIM_DEVICE_REG != "VERSAL_PREMIUM") &&
         (SIM_DEVICE_REG != "VERSAL_PREMIUM_ES1") &&
         (SIM_DEVICE_REG != "VERSAL_PREMIUM_ES2") &&
         (SIM_DEVICE_REG != "VERSAL_PRIME") &&
         (SIM_DEVICE_REG != "VERSAL_PRIME_ES1"))) begin
      $display("Error: [Unisim %s-101] SIM_DEVICE attribute is set to %s.  Legal values for this attribute are ULTRASCALE_PLUS, VERSAL_AI_CORE, VERSAL_AI_CORE_ES1, VERSAL_AI_EDGE, VERSAL_AI_EDGE_ES1, VERSAL_AI_EDGE_ES2, VERSAL_AI_RF, VERSAL_AI_RF_ES1, VERSAL_AI_RF_ES2, VERSAL_HBM, VERSAL_HBM_ES1, VERSAL_HBM_ES2, VERSAL_NET, VERSAL_NET_ES1, VERSAL_NET_ES2, VERSAL_PREMIUM, VERSAL_PREMIUM_ES1, VERSAL_PREMIUM_ES2, VERSAL_PRIME or VERSAL_PRIME_ES1. Instance: %m", MODULE_NAME, SIM_DEVICE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((STARTUP_SYNC_REG != "FALSE") &&
         (STARTUP_SYNC_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] STARTUP_SYNC attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, STARTUP_SYNC_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;

  end //always

  always @ (trig_attr) begin
    #1;
    if (((SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_AI_CORE      ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_AI_CORE_ES1  ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_AI_EDGE      ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_AI_EDGE_ES1  ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_AI_EDGE_ES2  ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_AI_RF        ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_AI_RF_ES1    ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_AI_RF_ES2    ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_HBM          ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_HBM_ES1      ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_HBM_ES2      ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_NET          ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_NET_ES1      ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_NET_ES2      ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_PREMIUM      ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_PREMIUM_ES1  ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_PREMIUM_ES2  ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_PRIME        ) &&
         (SIM_DEVICE_BIN != SIM_DEVICE_VERSAL_PRIME_ES1    )) &&
        (STARTUP_SYNC_BIN == STARTUP_SYNC_TRUE)) begin
      $display("Warning: [Unisim %s-200] SIM_DEVICE attribute is set to %s and STARTUP_SYNC is set to %s. STARTUP_SYNC functionality is not supported for this DEVICE. Instance: %m", MODULE_NAME, SIM_DEVICE_REG, STARTUP_SYNC_REG);
      STARTUP_SYNC_BIN = STARTUP_SYNC_FALSE; //force correct
    end
  end //always

`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  reg       enable_clk;
  reg [2:0] gwe_sync;
  wire      gwe_muxed_sync;
  reg       gwe_latch;
  wire      I_in;
  reg       O_out;

  assign    I_in = I;

  initial begin
    gwe_sync   = 3'b000;
    enable_clk = 1'b0;
  end

  always @(posedge I_in) begin
    if(I_in==1'b1)
      gwe_sync <= {gwe_sync[1:0], ~glblGSR};
  end

  assign gwe_muxed_sync = (STARTUP_SYNC_BIN == STARTUP_SYNC_TRUE) ? gwe_sync[2] :  ~glblGSR;

  always @(*) begin
    if(~I_in)
      gwe_latch <= gwe_muxed_sync;
  end

  always @(*)
    O_out = gwe_latch && I_in;

  assign O = O_out;

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (I => O) = (0:0:0, 0:0:0);
    $period (negedge I, 0:0:0, notifier);
    $period (posedge I, 0:0:0, notifier);
    $width (negedge I, 0:0:0, 0, notifier);
    $width (posedge I, 0:0:0, 0, notifier);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
