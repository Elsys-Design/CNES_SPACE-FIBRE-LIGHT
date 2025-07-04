// ***************************
// * DO NOT MODIFY THIS FILE *
// ***************************

`timescale 1ps/1ps

(* XPM_MODULE = "TRUE", XPM_NOC = "NSU_STRM", KEEP_HIERARCHY = "SOFT", DONT_TOUCH = "yes" *)
module xpm_nsu_strm # (
  //parameter string  NOC_TYPE              = "NOC1",  // NOC1/NOC2
  parameter string  NOC_FABRIC            = "VNOC",  // VNOC/BLI
  parameter integer DATA_WIDTH            = 512,     // 128/256/512
  parameter integer DST_ID_WIDTH          = 4,       // 0 to 4
  parameter integer ID_WIDTH              = 6        // 0 to 6
) (

  (* X_INTERFACE_IGNORE = "true" *)
  input  wire                     m_axis_aclk,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TID" *)
  (* X_INTERFACE_MODE = "master" *)
  output wire [ID_WIDTH-1:0]      m_axis_tid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *)
  output wire [DATA_WIDTH-1:0]    m_axis_tdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TKEEP" *)
  output wire [DATA_WIDTH/8-1:0]  m_axis_tkeep,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *)
  output wire                     m_axis_tlast,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)
  output wire                     m_axis_tvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDEST" *)
  output wire [DST_ID_WIDTH-1:0]  m_axis_tdest,

  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)
  input  wire                     m_axis_tready

);

//------------------------------------------------------------------------------
// Constants
//------------------------------------------------------------------------------
localparam XPM_NAME = "XPM_NSU_STRM";
localparam integer XPM_MODULE_ID = 4;

//`ifdef NOC_TYPE_STATIC
//localparam NOC_TYPE = "NOC1";
//`else
`include "noc_type.vh"
//`endif

//------------------------------------------------------------------------------
// Configuration DRCs
//------------------------------------------------------------------------------
initial begin : config_drc_nsu_strm
    reg drc_err_flag;
    drc_err_flag = 0;
    #1;
   
    if ( NOC_FABRIC != "VNOC") begin
      $error("[%s %0d-%0d]  NOC_FABRIC (%s) is not supported. Valid value is VNOC. %m", XPM_NAME, XPM_MODULE_ID, 1,  NOC_FABRIC);
      drc_err_flag = 1;
    end

    if (DATA_WIDTH != 128 && DATA_WIDTH != 256 && DATA_WIDTH != 512) begin
      $error("[%s %0d-%0d] DATA_WIDTH (%d) is not supported. Valid options are 128/256/512. %m", XPM_NAME, XPM_MODULE_ID, 2, DATA_WIDTH);
      drc_err_flag = 1;
    end

    if (ID_WIDTH > 6) begin
      $error("[%s %0d-%0d] ID_WIDTH (%d) is not supported. Valid value is less than or equal to 6. %m", XPM_NAME, XPM_MODULE_ID, 3, ID_WIDTH);
      drc_err_flag = 1;
    end
    
    if (drc_err_flag == 1)
      #1 $finish;
end : config_drc_nsu_strm

//------------------------------------------------------------------------------
// Instantiating NSU Unisim
//------------------------------------------------------------------------------
generate 
  if (NOC_TYPE == "NOC1" ) begin : NOC1
  if (NOC_FABRIC == "VNOC" ) begin : VNOC

//synthesis translate_off
  defparam NOC_NSU512_INST.BM_NOC_NSU512_INST.MODULAR_NOC_FLOW = 1;
//synthesis translate_on

(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
    NOC_NSU512 NOC_NSU512_INST (
     .IF_NOC_AXI_ARADDR         (),
     .IF_NOC_AXI_ARBURST        (),
     .IF_NOC_AXI_ARCACHE        (),
     .IF_NOC_AXI_ARCID          (),
     .IF_NOC_AXI_ARLEN          (),
     .IF_NOC_AXI_ARLOCK         (),
     .IF_NOC_AXI_ARPROT         (),
     .IF_NOC_AXI_ARQOS          (),
     .IF_NOC_AXI_ARREGION       (),
     .IF_NOC_AXI_ARSIZE         (),
     .IF_NOC_AXI_ARUSER         (),
     .IF_NOC_AXI_ARVALID        (),
     .IF_NOC_AXI_AWADDR         (),
     .IF_NOC_AXI_AWBURST        (),
     .IF_NOC_AXI_AWCACHE        (),
     .IF_NOC_AXI_AWCID          (),
     .IF_NOC_AXI_AWLEN          (),
     .IF_NOC_AXI_AWLOCK         (),
     .IF_NOC_AXI_AWPROT         (),
     .IF_NOC_AXI_AWQOS          (),
     .IF_NOC_AXI_AWREGION       (),
     .IF_NOC_AXI_AWSIZE         (),
     .IF_NOC_AXI_AWUSER         (),
     .IF_NOC_AXI_AWVALID        (),
     .IF_NOC_AXI_BREADY         (),
     .IF_NOC_AXI_RREADY         (),
     .IF_NOC_AXI_WCID           (m_axis_tid),
     .IF_NOC_AXI_TDEST          (m_axis_tdest),
     .IF_NOC_AXI_WDATA          (m_axis_tdata),
     .IF_NOC_AXI_WLAST          (m_axis_tlast),
     .IF_NOC_AXI_WSTRB          (m_axis_tkeep),
     .IF_NOC_AXI_WUSER          (),
     .IF_NOC_AXI_WVALID         (m_axis_tvalid),
     .IF_NOC_AXI_ARREADY        ('b0),
     .IF_NOC_AXI_AWREADY        ('b0),
     .IF_NOC_AXI_BCID           ('b0),
     .IF_NOC_AXI_BRESP          ('b0),
     .IF_NOC_AXI_BUSER          ('b0),
     .IF_NOC_AXI_BVALID         ('b0),
     .IF_NOC_AXI_RCID           ('b0),
     .IF_NOC_AXI_RDATA          ('b0),
     .IF_NOC_AXI_RLAST          ('b0),
     .IF_NOC_AXI_RRESP          ('b0),
     .IF_NOC_AXI_RUSER          ('b0),
     .IF_NOC_AXI_RVALID         ('b0),
     .IF_NOC_AXI_WREADY         (m_axis_tready),
     .CLK                       (m_axis_aclk),
     .IF_NOC_AXI_AWADDR_PAR     (),
     .IF_NOC_AXI_RDATA_PAR      ('b0),
     .IF_NOC_AXI_RPOISON        ('b0),
     .IF_NOC_AXI_WDATA_PAR      (),
     .IF_NOC_AXI_WPOISON        (),
     .IF_NOC_AXI_ARADDR_PAR     (),
     .NSU_USR_INTERRUPT_IN      ('b0)
   );    
  end : VNOC
  end else begin : NOC2

//synthesis translate_off
  defparam NOC2_NSU512_INST.BM_NOC2_NSU512_INST.MODULAR_NOC_FLOW = 1;
//synthesis translate_on

(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
    NOC2_NSU512 NOC2_NSU512_INST (
     .IF_NOC_AXI_ARADDR         (),
     .IF_NOC_AXI_ARBURST        (),
     .IF_NOC_AXI_ARCACHE        (),
     .IF_NOC_AXI_ARCID          (),
     .IF_NOC_AXI_ARLEN          (),
     .IF_NOC_AXI_ARLOCK         (),
     .IF_NOC_AXI_ARPROT         (),
     .IF_NOC_AXI_ARQOS          (),
     .IF_NOC_AXI_ARREGION       (),
     .IF_NOC_AXI_ARSIZE         (),
     .IF_NOC_AXI_ARUSER         (),
     .IF_NOC_AXI_ARVALID        (),
     .IF_NOC_AXI_AWADDR         (),
     .IF_NOC_AXI_AWBURST        (),
     .IF_NOC_AXI_AWCACHE        (),
     .IF_NOC_AXI_AWCID          (),
     .IF_NOC_AXI_AWLEN          (),
     .IF_NOC_AXI_AWLOCK         (),
     .IF_NOC_AXI_AWPROT         (),
     .IF_NOC_AXI_AWQOS          (),
     .IF_NOC_AXI_AWREGION       (),
     .IF_NOC_AXI_AWSIZE         (),
     .IF_NOC_AXI_AWUSER         (),
     .IF_NOC_AXI_AWVALID        (),
     .IF_NOC_AXI_BREADY         (),
     .IF_NOC_AXI_RREADY         (),
     .IF_NOC_AXI_WCID           (m_axis_tid),
     .IF_NOC_AXI_TDEST          (m_axis_tdest),
     .IF_NOC_AXI_WDATA          (m_axis_tdata),
     .IF_NOC_AXI_WLAST          (m_axis_tlast),
     .IF_NOC_AXI_WSTRB          (m_axis_tkeep),
     .IF_NOC_AXI_WUSER          (),
     .IF_NOC_AXI_WVALID         (m_axis_tvalid),
     .IF_NOC_AXI_ARREADY        ('b0),
     .IF_NOC_AXI_AWREADY        ('b0),
     .IF_NOC_AXI_BCID           ('b0),
     .IF_NOC_AXI_BRESP          ('b0),
     .IF_NOC_AXI_BUSER          ('b0),
     .IF_NOC_AXI_BVALID         ('b0),
     .IF_NOC_AXI_RCID           ('b0),
     .IF_NOC_AXI_RDATA          ('b0),
     .IF_NOC_AXI_RLAST          ('b0),
     .IF_NOC_AXI_RRESP          ('b0),
     .IF_NOC_AXI_RUSER          ('b0),
     .IF_NOC_AXI_RVALID         ('b0),
     .IF_NOC_AXI_WREADY         (m_axis_tready),
     .CLK                       (m_axis_aclk),
     .IF_NOC_AXI_AWADDR_PAR     (),
     .IF_NOC_AXI_RDATA_PAR      ('b0),
     .IF_NOC_AXI_RPOISON        ('b0),
     .IF_NOC_AXI_WDATA_PAR      (),
     .IF_NOC_AXI_WPOISON        (),
     .IF_NOC_AXI_ARADDR_PAR     (),
     .NSU_USR_INTERRUPT_IN      ('b0)
   );
  end
endgenerate

endmodule
