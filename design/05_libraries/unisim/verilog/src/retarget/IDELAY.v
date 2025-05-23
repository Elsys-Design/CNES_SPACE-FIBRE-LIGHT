///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Input Delay Line
// /___/   /\     Filename : IDELAY.v
// \   \  /  \    Timestamp : Mon Feb 22 16:00:24 PST 2010
//  \___\/\___\
//
// Revision:
//    02/22/10 - Initial version.
//    01/19/12 - 642202 - mapped "DEFAULT" value to "FIXED"
// End Revision

`timescale  1 ps / 1 ps

module IDELAY (O, C, CE, I, INC, RST);
    
    output O;

    input C;
    input CE;
    input I;
    input INC;
    input RST;

    parameter IOBDELAY_TYPE = "DEFAULT";    
    parameter integer IOBDELAY_VALUE = 0;
    
    localparam IOBDELAY_TYPE_V7 = (IOBDELAY_TYPE == "DEFAULT")? "FIXED" : IOBDELAY_TYPE;

//--------------------------------------------------------    
//------------- IDELAYE2 --------------------------------    
//--------------------------------------------------------    
    
    IDELAYE2     #( // attributes
                 .CINVCTRL_SEL("FALSE"),
                 .DELAY_SRC("IDATAIN"),
                 .HIGH_PERFORMANCE_MODE("TRUE"),
                 .IDELAY_TYPE(IOBDELAY_TYPE_V7),
                 .IDELAY_VALUE(IOBDELAY_VALUE),
                 .PIPE_SEL("FALSE"),
                 .REFCLK_FREQUENCY(200.0),
                 .SIGNAL_PATTERN("DATA")

               )
             uut
               ( // outputs
                 .CNTVALUEOUT(),
                 .DATAOUT(O),

                 // inputs
                 .C(C),
                 .CE(CE),
                 .CINVCTRL(1'b0),
                 .CNTVALUEIN(5'b0),
                 .DATAIN(1'b0),
                 .IDATAIN(I),
                 .INC(INC),
                 .LD(1'b0),
                 .LDPIPEEN(1'b0),
                 .REGRST(RST)
               );

    
endmodule // IDELAY
