//------------------------------------------------------------------------------
// NMU MUX Module Declaration
//------------------------------------------------------------------------------
`timescale 1ps/1ps

module nmu_mux #(
  parameter SEL_WIDTH    = 4,
  parameter DESTID_WIDTH = 12
) (
  sel_in,
  dest_id,
  tvalid,
  err_out
);
input       [SEL_WIDTH-1:0]    sel_in;
input                          tvalid;
output wire [DESTID_WIDTH-1:0] dest_id;
output wire                    err_out;

wire                 val_destid;
wire [SEL_WIDTH-1:0] sel_in_r;
wire                 err_out_s;

//------------------------------------------------------------------------------
// Instantiating LUT4 primitive for DESTID_WIDTH times in the structure of a ROM,
// where the "dest_id" output reads a DESTID_WIDTH-bit value across all LUT4
// primitives at the address given by "sel_in".
// This code assumes that 16 TDEST values will be stored into the INIT value of
// all LUT4 through constrains such that 4-bit sel_in can reach them all.
//------------------------------------------------------------------------------
generate
  genvar i;
  for (i=0; i<DESTID_WIDTH; i++) begin: gen_dest_id_lut
     (* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
     LUT4 dest_id_inst (
        .I0 (sel_in_r[0]),
        .I1 (sel_in_r[1]),
        .I2 (sel_in_r[2]),
        .I3 (sel_in_r[3]),
        .O  (dest_id[i])
     );
  end: gen_dest_id_lut
endgenerate

//------------------------------------------------------------------------------
// Instantiating a LUT for deciding if the selected DST_ID value is valid or
// not. The INIT value of the LUT needs to be configued thorugh constraints.
// For example:
// If only 0th, 3rd and 5th DST_ID values are valid then the INIT
// value needs to be configured as: 16'b0000_0000_0010_1001
//------------------------------------------------------------------------------
(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
LUT4 val_dest_id_inst (
   .I0 (sel_in[0]),
   .I1 (sel_in[1]),
   .I2 (sel_in[2]),
   .I3 (sel_in[3]),
   .O  (val_destid)
);

//------------------------------------------------------------------------------
// Asserting Error signal if the selected DST_ID value is not valid. Also,
// selecting default DST_ID as 0th
//------------------------------------------------------------------------------
generate
  genvar j;
  for (j=0; j<SEL_WIDTH; j++) begin: gen_sel_in_lut
     (* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
     LUT2 # (.INIT (4'h8)) sel_in_inst (
        .I0 (val_destid),
        .I1 (sel_in[j]),
        .O  (sel_in_r[j])
     );
  end: gen_sel_in_lut
endgenerate

(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
LUT1 #(.INIT(2'b01)) val_err_out_inst (
  .O  (err_out_s),
  .I0 (val_destid)
);

(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
LUT2 # (.INIT (4'h8)) err_out_inst (
  .I0 (tvalid),
  .I1 (err_out_s),
  .O  (err_out)
);

endmodule


//------------------------------------------------------------------------------
// Slice Module Declaration
//------------------------------------------------------------------------------
`timescale 1ps/1ps
module  xpm_slice # (
   parameter DIN_WIDTH  = 32,
   parameter DIN_FROM   = 8,
   parameter DIN_TO     = 8
) (
   input  wire [DIN_WIDTH -1:0]      Din,
   output wire [DIN_FROM - DIN_TO:0] Dout
  );

	assign Dout = Din [DIN_FROM: DIN_TO];

endmodule

//------------------------------------------------------------------------------
// XPM NMU Stream Moddule Declaration
//------------------------------------------------------------------------------
`timescale 1ps/1ps

(* XPM_MODULE = "TRUE", XPM_NOC = "NMU_STRM", KEEP_HIERARCHY = "SOFT", DONT_TOUCH = "yes" *)
module xpm_nmu_strm # (
  parameter string  NOC_FABRIC   = "VNOC", // VNOC/BLI
  parameter integer DATA_WIDTH   = 512,    // 128/256/512
  parameter integer DST_ID_WIDTH = 4,      // 0 to 12
  parameter integer ID_WIDTH     = 16      // 0 to 16
) (

  (* X_INTERFACE_IGNORE = "true" *)
  input  wire                     s_axis_aclk,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TID" *)
  (* X_INTERFACE_MODE = "slave" *)
  input  wire [ID_WIDTH-1:0]      s_axis_tid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *)
  input  wire [DATA_WIDTH-1:0]    s_axis_tdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TKEEP" *)
  input  wire [DATA_WIDTH/8-1:0]  s_axis_tkeep,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *)
  input  wire                     s_axis_tlast,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)
  input  wire                     s_axis_tvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)
  output wire                     s_axis_tready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDEST" *)
  input  wire [DST_ID_WIDTH-1:0]  s_axis_tdest,

  (* X_INTERFACE_IGNORE = "true" *)
  output wire                     dst_id_err
);

//------------------------------------------------------------------------------
// Constants
//------------------------------------------------------------------------------
localparam XPM_NAME = "XPM_NMU_STRM";
localparam integer XPM_MODULE_ID = 2;
localparam NMU_WIDTH = (NOC_FABRIC == "VNOC") ? 512:256;
`include "noc_type.vh"

//------------------------------------------------------------------------------
// Configuration DRCs
//------------------------------------------------------------------------------
initial begin : config_drc_nmu_strm
    reg drc_err_flag;
    drc_err_flag = 0;
    #1;
    
    if (DATA_WIDTH != 128 && DATA_WIDTH != 256 && DATA_WIDTH != 512) begin
      $error("[%s %0d-%0d] DATA_WIDTH (%d) is not supported. Valid options are 128/256/512. %m", XPM_NAME, XPM_MODULE_ID, 1, DATA_WIDTH);
      drc_err_flag = 1;
    end

    if (ID_WIDTH > 16) begin
      $error("[%s %0d-%0d] ID_WIDTH (%d) is not supported. Valid range is 0-16. %m", XPM_NAME, XPM_MODULE_ID, 2,  ID_WIDTH);
      drc_err_flag = 1;
    end

    if (DST_ID_WIDTH > 4) begin
      $error("[%s %0d-%0d] DST_ID_WIDTH (%d) is not supported. Valid range is 0-4. %m", XPM_NAME, XPM_MODULE_ID, 3,  DST_ID_WIDTH);
      drc_err_flag = 1;
    end

   
    //if (WRITE_TRAFFIC_CLASS != "ISOCHRONOUS" && WRITE_TRAFFIC_CLASS != "BEST_EFFORT") begin
    //  $error("[%s %0d-%0d] WRITE_TRAFFIC_CLASS (%s) is not supported. Valid options are LOW_LATENCY / ISOCHRONOUS / BEST_EFFORT. %m", XPM_NAME, XPM_MODULE_ID, 4,  WRITE_TRAFFIC_CLASS);
    //  drc_err_flag = 1;
    //end
    
    if ( NOC_FABRIC != "VNOC") begin
      $error("[%s %0d-%0d]  NOC_FABRIC (%s) is not supported. Valid values are VNOC. %m", XPM_NAME, XPM_MODULE_ID, 5,  NOC_FABRIC);
      drc_err_flag = 1;
    end

    if (drc_err_flag == 1)
      #1 $finish;
end : config_drc_nmu_strm


wire [11:0] s_axis_wr_usr_dst;
wire        wr_dest_mode;
wire [3:0]  s_axis_tdest_s;

//------------------------------------------------------------------------------
// Instantiating a LUT for driving WR_DEST_MODE value. The INIT value of this
// LUT needs to be configured thourgh constraints depending on connection - 1x1
// or 1xN
// For 1x1 or Mx1 INIT value should be configured as 2'b00
// For 1xN or MxN INIT value should be configured as 2'b01
//------------------------------------------------------------------------------
(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
LUT1 DEST_MODE (
  .O  (wr_dest_mode),
  .I0 (1'b0)
);


generate 
  if (DST_ID_WIDTH > 4 ) begin : SLICE
//------------------------------------------------------------------------------
// Instantiating slice module 
//------------------------------------------------------------------------------
xpm_slice #(
   .DIN_WIDTH  (DST_ID_WIDTH),
   .DIN_FROM   (DST_ID_WIDTH-1),
   .DIN_TO     (DST_ID_WIDTH-4)
) XPM_SLICE_INST (
   .Din  (s_axis_tdest),
   .Dout (s_axis_tdest_s)
);
end else begin : NO_SLICE
  assign s_axis_tdest_s = {3'b0,s_axis_tdest};
end
endgenerate

//------------------------------------------------------------------------------
// Instantiating NMU Unisim
//------------------------------------------------------------------------------
generate 
  if (NOC_TYPE == "NOC1" ) begin : NOC1

//------------------------------------------------------------------------------
// Instantiating NMU MUX
//------------------------------------------------------------------------------
nmu_mux #(
  .SEL_WIDTH    (4),
  .DESTID_WIDTH (12)
) NMU_MUX_INST (
  .sel_in (s_axis_tdest_s),
  .tvalid (s_axis_tvalid),
  .dest_id(s_axis_wr_usr_dst),
  .err_out (dst_id_err)
);

  if (NOC_FABRIC == "VNOC" ) begin : VNOC

//synthesis translate_off
  defparam NOC_NMU512_INST.BM_NOC_NMU512_INST.MODULAR_NOC_FLOW = 1;
//synthesis translate_on

(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
    NOC_NMU512 NOC_NMU512_INST (
      .IF_NOC_AXI_WVALID      (s_axis_tvalid),
      .IF_NOC_AXI_WREADY      (s_axis_tready),
      .IF_NOC_AXI_WLAST       (s_axis_tlast),
      .IF_NOC_AXI_AWID        ('b0),
      .IF_NOC_AXI_WDATA       (s_axis_tdata),
      .IF_NOC_AXI_WSTRB       (s_axis_tkeep),
      .IF_NOC_AXI_ARREADY     (),
      .IF_NOC_AXI_AWREADY     (),
      .IF_NOC_AXI_BID         (),
      .IF_NOC_AXI_BRESP       (),
      .IF_NOC_AXI_BUSER       (),
      .IF_NOC_AXI_BVALID      (),
      .IF_NOC_AXI_RDATA       (),
      .IF_NOC_AXI_WDATA_PAR   ('b0),
      .IF_NOC_AXI_RID         (),
      .IF_NOC_AXI_RLAST       (),
      .IF_NOC_AXI_WPOISON     ('b0),
      .IF_NOC_AXI_RRESP       (),
      .IF_NOC_AXI_RUSER       (),
      .IF_NOC_AXI_RVALID      (),
      .IF_NOC_AXI_ARADDR      ('b0),
      .IF_NOC_AXI_ARADDR_PAR  ('b0),
      .IF_NOC_AXI_AWADDR_PAR  ('b0),
      .IF_NOC_AXI_ARBURST     ('b0),
      .IF_NOC_AXI_ARCACHE     ('b0),
      .IF_NOC_AXI_ARID        ('b0),
      .IF_NOC_AXI_ARLEN       ('b0),
      .IF_NOC_AXI_ARLOCK      ('b0),
      .IF_NOC_AXI_ARPROT      ('b0),
      .IF_NOC_AXI_ARQOS       ('b0),
      .IF_NOC_AXI_ARREGION    ('b0),
      .IF_NOC_AXI_ARSIZE      ('b0),
      .IF_NOC_AXI_ARUSER      ('b0),
      .IF_NOC_AXI_ARVALID     ('b0),
      .IF_NOC_AXI_AWADDR      ('b0),
      .IF_NOC_AXI_AWBURST     ('b0),
      .IF_NOC_AXI_AWCACHE     ('b0),
      .IF_NOC_AXI_AWLEN       ('b0),
      .IF_NOC_AXI_AWLOCK      ('b0),
      .IF_NOC_AXI_AWPROT      ('b0),
      .IF_NOC_AXI_AWQOS       ('b0),
      .IF_NOC_AXI_AWREGION    ('b0),
      .IF_NOC_AXI_AWSIZE      ('b0),
      .IF_NOC_AXI_AWUSER      ('b0),
      .IF_NOC_AXI_AWVALID     ('b0),
      .IF_NOC_AXI_BREADY      ('b0),
      .IF_NOC_AXI_RREADY      ('b0),
      .IF_NOC_AXI_WID         (s_axis_tid),
      .IF_NOC_AXI_TDEST       (s_axis_tdest_s),
      .NMU_WR_USR_DST         (s_axis_wr_usr_dst),
      .NMU_RD_DEST_MODE       (1'b0),
      .NMU_WR_DEST_MODE       (wr_dest_mode),
      .IF_NOC_AXI_WUSER       ('b0),
      .NMU_USR_INTERRUPT_IN   ('b0),
      .IF_NOC_AXI_RDATA_PAR   (),
      .CLK                    (s_axis_aclk),
      .IF_NOC_AXI_RPOISON     ()
    );
  end : VNOC

  end else begin : NOC2

//synthesis translate_off
  defparam NOC2_NMU512_INST.BM_NOC2_NMU512_INST.MODULAR_NOC_FLOW = 1;
//synthesis translate_on

(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
    NOC2_NMU512 NOC2_NMU512_INST (
	    .IF_NOC_AXI_WVALID      (s_axis_tvalid),
      .IF_NOC_AXI_WREADY      (s_axis_tready),
      .IF_NOC_AXI_WLAST       (s_axis_tlast),
      .IF_NOC_AXI_AWID        ('b0),
      .IF_NOC_AXI_WDATA       (s_axis_tdata),
      .IF_NOC_AXI_WSTRB       (s_axis_tkeep),
      .IF_NOC_AXI_ARREADY     (),
      .IF_NOC_AXI_AWREADY     (),
      .IF_NOC_AXI_BID         (),
      .IF_NOC_AXI_BRESP       (),
      .IF_NOC_AXI_BUSER       (),
      .IF_NOC_AXI_BVALID      (),
      .IF_NOC_AXI_RDATA       (),
      .IF_NOC_AXI_WDATA_PAR   ('b0),
      .IF_NOC_AXI_RID         (),
      .IF_NOC_AXI_RLAST       (),
      .IF_NOC_AXI_WPOISON     ('b0),
      .IF_NOC_AXI_RRESP       (),
      .IF_NOC_AXI_RUSER       (),
      .IF_NOC_AXI_RVALID      (),
      .IF_NOC_AXI_ARADDR      ('b0),
      .IF_NOC_AXI_ARADDR_PAR  ('b0),
      .IF_NOC_AXI_AWADDR_PAR  ('b0),
      .IF_NOC_AXI_ARBURST     ('b0),
      .IF_NOC_AXI_ARCACHE     ('b0),
      .IF_NOC_AXI_ARID        ('b0),
      .IF_NOC_AXI_ARLEN       ('b0),
      .IF_NOC_AXI_ARLOCK      ('b0),
      .IF_NOC_AXI_ARPROT      ('b0),
      .IF_NOC_AXI_ARQOS       ('b0),
      .IF_NOC_AXI_ARREGION    ('b0),
      .IF_NOC_AXI_ARSIZE      ('b0),
      .IF_NOC_AXI_ARUSER      ('b0),
      .IF_NOC_AXI_ARVALID     ('b0),
      .IF_NOC_AXI_AWADDR      ('b0),
      .IF_NOC_AXI_AWBURST     ('b0),
      .IF_NOC_AXI_AWCACHE     ('b0),
      .IF_NOC_AXI_AWLEN       ('b0),
      .IF_NOC_AXI_AWLOCK      ('b0),
      .IF_NOC_AXI_AWPROT      ('b0),
      .IF_NOC_AXI_AWQOS       ('b0),
      .IF_NOC_AXI_AWREGION    ('b0),
      .IF_NOC_AXI_AWSIZE      ('b0),
      .IF_NOC_AXI_AWUSER      ('b0),
      .IF_NOC_AXI_AWVALID     ('b0),
      .IF_NOC_AXI_BREADY      ('b0),
      .IF_NOC_AXI_RREADY      ('b0),
      .IF_NOC_AXI_WID         (s_axis_tid),
      .IF_NOC_AXI_TDEST       (s_axis_tdest_s),
      .IF_NOC_AXI_WUSER       ('b0),
      .NMU_RD_DEST_MODE       (1'b0),
      .NMU_RD_USR_DST         ('b0),
      .NMU_WR_DEST_MODE       (wr_dest_mode),
      .NMU_WR_USR_DST         (s_axis_tdest_s),
      .NMU_USR_INTERRUPT_IN   ('b0),
      .IF_NOC_AXI_RDATA_PAR   (),
      .CLK                    (s_axis_aclk),
      .IF_NOC_AXI_RPOISON     ()
	);
  end
endgenerate

endmodule
