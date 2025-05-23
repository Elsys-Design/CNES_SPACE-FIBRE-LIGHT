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
// /___/   /\     Filename : IODELAY.v
// \   \  /  \    Timestamp : Mon Feb 22 16:00:24 PST 2010
//  \___\/\___\
//
// Revision:
//    02/22/10 - Initial version.
//    01/19/12 - 642202 - mapped "DEFAULT" value to "FIXED"
// End Revision

`timescale  1 ps / 1 ps

module IODELAY (DATAOUT, C, CE, DATAIN, IDATAIN, INC, ODATAIN, RST, T);

    parameter DELAY_SRC    = "I";
    parameter HIGH_PERFORMANCE_MODE    = "TRUE";
    parameter IDELAY_TYPE  = "DEFAULT";
    parameter integer IDELAY_VALUE = 0;
    parameter integer ODELAY_VALUE = 0;
    parameter real REFCLK_FREQUENCY = 200.0;
    parameter SIGNAL_PATTERN    = "DATA";

    localparam IDELAY_TYPE_V7 = (IDELAY_TYPE == "DEFAULT")? "FIXED" : IDELAY_TYPE;
    localparam ODELAY_TYPE_V7 = "FIXED";

    output DATAOUT;

    input C;
    input CE;
    input DATAIN;
    input IDATAIN;
    input INC;
    input ODATAIN;
    input RST;
    input T ;

    localparam  IDELAY_SRC_int = (DELAY_SRC == "I")     ? "IDATAIN" : (
                                 (DELAY_SRC == "DATAIN") ?  "DATAIN":"IDATAIN");
    localparam  ODELAY_SRC_int = (DELAY_SRC == "O")     ? "ODATAIN" : (
                                 (DELAY_SRC == "CLKIN") ?  "CLKIN":"ODATAIN");

//--------------------------------------------------------
//------------- IDELAYE2 --------------------------------
//--------------------------------------------------------

    generate
    case (DELAY_SRC)
        "I", "DATAIN" :

              IDELAYE2     #( // attributes
                           .CINVCTRL_SEL("FALSE"),
                           .DELAY_SRC(IDELAY_SRC_int),
                           .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE),
                           .IDELAY_TYPE(IDELAY_TYPE_V7),
                           .IDELAY_VALUE(IDELAY_VALUE),
                           .PIPE_SEL("FALSE"),
                           .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
                           .SIGNAL_PATTERN(SIGNAL_PATTERN)
                         )
                      I6 
                         ( // outputs
                           .CNTVALUEOUT(),
                           .DATAOUT(DATAOUT),

                           // inputs
                           .C(C),
                           .CE(CE),
                           .CINVCTRL(1'b0),
                           .CNTVALUEIN(5'b0),
                           .DATAIN(1'b0),
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
                           .CINVCTRL_SEL("FALSE"),
                           .DELAY_SRC(ODELAY_SRC_int),
                           .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE),
                           .ODELAY_TYPE(ODELAY_TYPE_V7),
                           .ODELAY_VALUE(IDELAY_VALUE),
                           .PIPE_SEL("FALSE"),
                           .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
                           .SIGNAL_PATTERN(SIGNAL_PATTERN)
                         )
                       O6
                         ( // outputs
                           .CNTVALUEOUT(),
                           .DATAOUT(DATAOUT),

                           // inputs
                           .C(C),
                           .CE(CE),
                           .CINVCTRL(1'b0),
                           .CLKIN(1'b0),
                           .CNTVALUEIN(5'b0),
                           .ODATAIN(ODATAIN),
                           .INC(INC),
                           .LD(1'b0),
                           .LDPIPEEN(1'b0),
                           .REGRST(RST)
                         );

      endcase
    endgenerate
endmodule // IODELAY
