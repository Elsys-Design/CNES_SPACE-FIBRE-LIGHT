///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Dual Data Rate Input D Flip-Flop (Discontinue in 13.1)
// /___/   /\     Filename : IDDR2.v
// \   \  /  \    Timestamp : Tue Sep  1 16:02:10 PDT 2009
//  \___\/\___\
//
// Revision:
//    09/01/09 - Initial version.


`timescale  1 ps / 1 ps

module IDDR2 (Q0, Q1, C0, C1, CE, D, R, S);
    
    output Q0;
    output Q1;
    
    input C0;
    input C1;
    input CE;
    input D;
    input R;
    input S;

    parameter DDR_ALIGNMENT = "NONE";
    parameter [0:0] INIT_Q0 = 1'b0;
    parameter [0:0] INIT_Q1 = 1'b0;
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

     localparam DDR_CLK_EDGE_IDDR =   (DDR_ALIGNMENT== "NONE")? "OPPOSITE_EDGE" : "SAME_EDGE";

    IDDR     #( // attributes
                 .DDR_CLK_EDGE(DDR_CLK_EDGE_IDDR), 
                 .INIT_Q1(INIT_Q0),
                 .INIT_Q2(INIT_Q1),
                 .SRTYPE(SRTYPE)
               ) 
             uut
               ( // outputs
                 .Q1(Q0),
                 .Q2(Q1),

                 // inputs
                 .C(CLK),   
                 .CE(CE),
                 .D(D),
                 .R(R),
                 .S(S)
               ); 

endmodule // IDDR2
