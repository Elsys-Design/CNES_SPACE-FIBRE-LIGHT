///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Dual Data Rate Output D Flip-Flop (Discontinue in 13.1)
// /___/   /\     Filename : ODDR2.v
// \   \  /  \    Timestamp : Sep  1 15:03:10 PDT 2009
//  \___\/\___\
//
// Revision:
//    09/01/09 - Initial version

`timescale 1 ps / 1 ps

module ODDR2 (Q, C0, C1, CE, D0, D1, R, S);
    
    output Q;

    input C0;
    input C1;
    input CE;
    input D0;
    input D1;
    input R;
    input S;

    parameter DDR_ALIGNMENT = "NONE";    
    parameter [0:0] INIT = 1'b0;
    parameter SRTYPE = "SYNC";

    pullup   P1 (CE);
    pulldown P2 (R);
    pulldown P3 (S);

    wire CLK;
    

//    assign CLK = ((DDR_ALIGNMENT== "C0") || (DDR_ALIGNMENT== "NONE"))?  C0 : C1;

    generate if((DDR_ALIGNMENT== "C0")  || (DDR_ALIGNMENT== "NONE"))
      assign CLK = C0; 
    else
      assign CLK = C1; 
    endgenerate


    localparam DDR_CLK_EDGE_ODDR = (DDR_ALIGNMENT== "NONE")? "OPPOSITE_EDGE" : "SAME_EDGE";

    ODDR     #( // attributes
                 .DDR_CLK_EDGE(DDR_CLK_EDGE_ODDR),
                 .INIT(INIT),
                 .SRTYPE(SRTYPE)
               )
             uut
               ( // outputs
                 .Q(Q),

                 // inputs
                 .C(CLK),
                 .CE(CE),
                 .D1(D0),
                 .D2(D1),
                 .R(R),
                 .S(S)
               );

       
endmodule // ODDR2
