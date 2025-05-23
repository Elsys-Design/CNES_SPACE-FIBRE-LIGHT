///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Input and/or Output Fixed or Variable Delay Element.
// /___/   /\     Filename : IODELAYE1.v
// \   \  /  \    Timestamp : Sat Sep  6 14:21:08 PDT 2008
//  \___\/\___\
//
// Revision:
//    02/22/10 - Initial version.
//    01/19/12 - 642202 - mapped "DEFAULT" value to "FIXED"
//    09/14/12 - 675728 - mapped "VAR_LOADABLE" value to "VAR_LOAD"
// End Revision

`timescale  1 ps / 1 ps

module IODELAYE1 (CNTVALUEOUT, DATAOUT, C, CE, CINVCTRL, CLKIN, CNTVALUEIN, DATAIN, IDATAIN, INC, ODATAIN, RST, T);

    parameter CINVCTRL_SEL = "FALSE";
    parameter DELAY_SRC    = "I";
    parameter HIGH_PERFORMANCE_MODE    = "FALSE";
    parameter IDELAY_TYPE  = "DEFAULT";
    parameter integer IDELAY_VALUE = 0;
    parameter ODELAY_TYPE  = "FIXED";
    parameter integer ODELAY_VALUE = 0;
    parameter real REFCLK_FREQUENCY = 200.0;
    parameter SIGNAL_PATTERN    = "DATA";

    output [4:0] CNTVALUEOUT;
    output DATAOUT;

    input C;
    input CE;
    input CINVCTRL;
    input CLKIN;
    input [4:0] CNTVALUEIN;
    input DATAIN;
    input IDATAIN;
    input INC;
    input ODATAIN;
    input RST;
    input T ;


    localparam IDELAY_TYPE_V7 = (IDELAY_TYPE == "DEFAULT") ? "FIXED" :
                                (IDELAY_TYPE == "VAR_LOADABLE") ? "VAR_LOAD" : IDELAY_TYPE;

    localparam ODELAY_TYPE_V7 = (ODELAY_TYPE == "VAR_LOADABLE") ? "VAR_LOAD" : ODELAY_TYPE;

    localparam  IDELAY_SRC_V7 = (DELAY_SRC == "I")     ? "IDATAIN" : (
                                (DELAY_SRC == "DATAIN") ?  "DATAIN":"IDATAIN"); 
    localparam  ODELAY_SRC_V7 = (DELAY_SRC == "O")     ? "ODATAIN" : (
                                (DELAY_SRC == "CLKIN") ?  "CLKIN":"ODATAIN"); 

    wire [4:0] i_cntvalueout, o_cntvalueout;
    wire i_out, o_out;


//--------------------------------------------------------
//------------- IDELAYE2 --------------------------------
//--------------------------------------------------------

    generate
    case (DELAY_SRC)
        "I", "DATAIN" :
         IDELAYE2     #( // attributes
                   .CINVCTRL_SEL(CINVCTRL_SEL),
                   .DELAY_SRC(IDELAY_SRC_V7),
                   .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE),
                   .IDELAY_TYPE(IDELAY_TYPE_V7),
                   .IDELAY_VALUE(IDELAY_VALUE),
                   .PIPE_SEL("FALSE"),
                   .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
                   .SIGNAL_PATTERN(SIGNAL_PATTERN)
                 )
               I6
                 ( // outputs
                   .CNTVALUEOUT(CNTVALUEOUT),
                   .DATAOUT(DATAOUT),

                   // inputs
                   .C(C),
                   .CE(CE),
                   .CINVCTRL(CINVCTRL),
                   .CNTVALUEIN(CNTVALUEIN),
                   .DATAIN(DATAIN),
                   .IDATAIN(IDATAIN),
                   .INC(INC),
                   .LD(1'b0),
                   .LDPIPEEN(1'b0),
                   .REGRST(RST)
                 );

//--------------------------------------------------------
//------------- ODELAYE2 --------------------------------
//--------------------------------------------------------

    "O", "CLKIN" :
    ODELAYE2     #( // attributes
                 .CINVCTRL_SEL(CINVCTRL_SEL),
                 .DELAY_SRC(ODELAY_SRC_V7),
                 .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE),
                 .ODELAY_TYPE(ODELAY_TYPE_V7),
                 .ODELAY_VALUE(ODELAY_VALUE),
                 .PIPE_SEL("FALSE"),
                 .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
                 .SIGNAL_PATTERN(SIGNAL_PATTERN)
               )
             O6
               ( // outputs
                 .CNTVALUEOUT(CNTVALUEOUT),
                 .DATAOUT(DATAOUT),

                 // inputs
                 .C(C),
                 .CE(CE),
                 .CINVCTRL(CINVCTRL),
                 .CLKIN(CLKIN),
                 .CNTVALUEIN(CNTVALUEIN),
                 .ODATAIN(ODATAIN),
                 .INC(INC),
                 .LD(1'b0),
                 .LDPIPEEN(1'b0),
                 .REGRST(RST)
               );

      endcase
    endgenerate

endmodule // IODELAYE1
