// $Header: $
///////////////////////////////////////////////////////
//  Copyright (c) 2009 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version : 12.1
//  \  \           Description : 
//  /  /                      
// /__/   /\       Filename    : FRAME_ECC_VIRTEX6.v
// \  \  /  \      Timestamp : Tue Jul 27 04:00:05 PST 2010
//  \__\/\__ \                    
//                                 
// Revision:
//    07/27/10 - Initial version.
// End Revision
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module FRAME_ECC_VIRTEX6 (
  CRCERROR,
  ECCERROR,
  ECCERRORSINGLE,
  FAR,
  SYNBIT,
  SYNDROME,
  SYNDROMEVALID,
  SYNWORD
);


  parameter FARSRC = "EFAR";
  parameter FRAME_RBT_IN_FILENAME = "NONE";
  localparam FRAME_ECC_OUT_RBT_FILENAME = "frame_rbt_out_v6.txt";
  localparam FRAME_ECC_OUT_ECC_FILENAME = "frame_ecc_out_v6.txt";

  output CRCERROR;
  output ECCERROR;
  output ECCERRORSINGLE;
  output SYNDROMEVALID;
  output [12:0] SYNDROME;
  output [23:0] FAR;
  output [4:0] SYNBIT;
  output [6:0] SYNWORD;
  wire [1:0] dummy_FAR;

FRAME_ECCE2 #(.FARSRC(FARSRC), .FRAME_RBT_IN_FILENAME(FRAME_RBT_IN_FILENAME)) F4 ( .CRCERROR(CRCERROR), .ECCERROR(ECCERROR), .ECCERRORSINGLE(ECCERRORSINGLE), .FAR({dummy_FAR[1:0], FAR}), .SYNBIT(SYNBIT), .SYNDROME(SYNDROME), .SYNDROMEVALID(SYNDROMEVALID), .SYNWORD(SYNWORD));

endmodule
