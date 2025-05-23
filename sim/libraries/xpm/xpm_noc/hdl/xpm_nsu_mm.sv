`timescale 1ps/1ps

(* XPM_MODULE = "TRUE", XPM_NOC = "NSU_MM", KEEP_HIERARCHY = "SOFT", DONT_TOUCH = "yes" *)
module xpm_nsu_mm # (
  parameter string  NOC_FABRIC            = "VNOC",  // VNOC/BLI
  parameter integer DATA_WIDTH            = 512,     // 32/64/128/256/512
  parameter integer ADDR_WIDTH            = 64,      // 12 to 64
  parameter integer ID_WIDTH              = 2,       // always 2
  parameter integer AUSER_WIDTH           = 16,      // 16 for VNOC with parity disabled, 18 for VNOC with parity enabled
  parameter integer DUSER_WIDTH           = 0,       // 2*DATA_WIDTH/8 for parity enablement with VNOC, 0 for VNOC with parity disabled cases
  parameter string  ENABLE_USR_INTERRUPT  = "false", // false/true
  parameter string  SIDEBAND_PINS         = "false"  // false/true/addr/data
) (

  (* X_INTERFACE_IGNORE = "true" *)
  input  wire                     m_axi_aclk,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWID" *)
  (* X_INTERFACE_MODE = "master" *)
  output wire [ID_WIDTH-1:0]      m_axi_awid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *)
  output wire [ADDR_WIDTH-1:0]    m_axi_awaddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLEN" *)
  output wire [7:0]               m_axi_awlen,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE" *)
  output wire [2:0]               m_axi_awsize,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWBURST" *)
  output wire [1:0]               m_axi_awburst,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLOCK" *)
  output wire [0:0]               m_axi_awlock,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE" *)
  output wire [3:0]               m_axi_awcache,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWPROT" *)
  output wire [2:0]               m_axi_awprot,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREGION" *)
  output wire [3:0]               m_axi_awregion,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWQOS" *)
  output wire [3:0]               m_axi_awqos,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWUSER" *)
  output wire [AUSER_WIDTH-1:0]   m_axi_awuser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *)
  output wire                     m_axi_awvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *)
  input  wire                     m_axi_awready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *)
  output wire [DATA_WIDTH-1:0]    m_axi_wdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *)
  output wire [DATA_WIDTH/8-1:0]  m_axi_wstrb,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WLAST" *)
  output wire                     m_axi_wlast,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WUSER" *)
  output wire [(DUSER_WIDTH == 0 ? 1 : DUSER_WIDTH)-1:0]   m_axi_wuser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *)
  output wire                     m_axi_wvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *)
  input  wire                     m_axi_wready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BID" *)
  input  wire [ID_WIDTH-1:0]      m_axi_bid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *)
  input  wire [1:0]               m_axi_bresp, 
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BUSER" *)
  input  wire [16-1:0]            m_axi_buser, //supports only 16-bits transferred from NSU to NMU
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *)
  input  wire                     m_axi_bvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *)
  output wire                     m_axi_bready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARID" *)
  output wire [ID_WIDTH-1:0]      m_axi_arid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *)
  output wire [ADDR_WIDTH-1:0]    m_axi_araddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLEN" *)
  output wire [7:0]               m_axi_arlen,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARSIZE" *)
  output wire [2:0]               m_axi_arsize,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARBURST" *)
  output wire [1:0]               m_axi_arburst,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLOCK" *)
  output wire [0:0]               m_axi_arlock,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARCACHE" *)
  output wire [3:0]               m_axi_arcache,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARPROT" *)
  output wire [2:0]               m_axi_arprot,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREGION" *)
  output wire [3:0]               m_axi_arregion,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARQOS" *)
  output wire [3:0]               m_axi_arqos,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARUSER" *)
  output wire [AUSER_WIDTH-1:0]   m_axi_aruser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *)
  output wire                     m_axi_arvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *)
  input  wire                     m_axi_arready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RID" *)
  input  wire [ID_WIDTH-1:0]      m_axi_rid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *)
  input  wire [DATA_WIDTH-1:0]    m_axi_rdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *)
  input  wire [1:0]               m_axi_rresp,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RLAST" *)
  input  wire                     m_axi_rlast,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RUSER" *)
  input  wire [(DUSER_WIDTH == 0 ? 1 : DUSER_WIDTH)-1:0]   m_axi_ruser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *)
  input  wire                     m_axi_rvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *)
  output wire                     m_axi_rready,

  (* X_INTERFACE_IGNORE = "true" *)
  output wire                     m_axi_out,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0]                nsu_usr_interrupt_in
);

//------------------------------------------------------------------------------
// Constants
//------------------------------------------------------------------------------
localparam XPM_NAME = "XPM_NOC_NSU";
localparam integer XPM_MODULE_ID = 1;
localparam NSU_WIDTH = 512;
localparam DIFF_BITS = (NSU_WIDTH > DATA_WIDTH) ? NSU_WIDTH-DATA_WIDTH : 1;
localparam DUSER_WIDTH_NC = (DUSER_WIDTH == 0) ? 1 : DUSER_WIDTH;

`include "noc_type.vh"

//------------------------------------------------------------------------------
// Configuration DRCs
//------------------------------------------------------------------------------
initial begin : config_drc_nsu_mm
    reg drc_err_flag;
    drc_err_flag = 0;
    #1;
   
    if ( NOC_FABRIC != "VNOC") begin
      $error("[%s %0d-%0d]  NOC_FABRIC (%s) is not supported. Valid value is VNOC . %m", XPM_NAME, XPM_MODULE_ID, 1,  NOC_FABRIC);
      drc_err_flag = 1;
    end

    if (DATA_WIDTH != 32 && DATA_WIDTH != 64 && DATA_WIDTH != 128 && DATA_WIDTH != 256 && DATA_WIDTH != 512) begin
      $error("[%s %0d-%0d] DATA_WIDTH (%d) is not supported. Valid options are 32/64/128/256/512. %m", XPM_NAME, XPM_MODULE_ID, 2, DATA_WIDTH);
      drc_err_flag = 1;
    end

    if (ADDR_WIDTH < 12 || ADDR_WIDTH > 64) begin
      $error("[%s %0d-%0d] ADDR_WIDTH (%d) is not supported. Valid range is 12-64. %m", XPM_NAME, XPM_MODULE_ID, 3, ADDR_WIDTH);
      drc_err_flag = 1;
    end

    if (ID_WIDTH != 2) begin
      $error("[%s %0d-%0d] ID_WIDTH (%d) is not supported. Valid value is 2. %m", XPM_NAME, XPM_MODULE_ID, 4, ID_WIDTH);
      drc_err_flag = 1;
    end
    
    
    if ( SIDEBAND_PINS == "false" &&  NOC_FABRIC == "VNOC" && AUSER_WIDTH != 16) begin
      $error("[%s %0d-%0d] AUSER_WIDTH (%d) is not supported. Valid value is 16 for VNOC category with SIDEBAND_PINS values as false. %m", XPM_NAME, XPM_MODULE_ID, 5,  AUSER_WIDTH);
      drc_err_flag = 1;
    end
    
    if (SIDEBAND_PINS == "true" &&  NOC_FABRIC == "VNOC" && AUSER_WIDTH != 18) begin
      $error("[%s %0d-%0d] AUSER_WIDTH (%d) is not supported. Valid value is 18 for VNOC category with SIDEBAND_PINS values as true . %m", XPM_NAME, XPM_MODULE_ID, 6,  AUSER_WIDTH);
      drc_err_flag = 1;
    end
      
 

   if (SIDEBAND_PINS == "true" &&  NOC_FABRIC == "VNOC" && DUSER_WIDTH != 2*DATA_WIDTH/8) begin
      $error("[%s %0d-%0d] DUSER_WIDTH (%d) is not supported. Valid option is 2*DATA_WIDTH/8 for VNOC category with SIDEBAND_PINS values as true. %m", XPM_NAME, XPM_MODULE_ID, 7,  DUSER_WIDTH);
      drc_err_flag = 1;
    end
    
   if (SIDEBAND_PINS == "false" &&  NOC_FABRIC == "VNOC" && DUSER_WIDTH != 0) begin
      $error("[%s %0d-%0d] DUSER_WIDTH (%d) is not supported. Valid option is 0 for VNOC category with SIDEBAND_PINS values as false. %m", XPM_NAME, XPM_MODULE_ID, 8,  DUSER_WIDTH);
      drc_err_flag = 1;
    end
   

   if (drc_err_flag == 1)
      #1 $finish;
end : config_drc_nsu_mm

/////////////////////

wire [3:0] usr_interrupt_in;
assign usr_interrupt_in = (ENABLE_USR_INTERRUPT == "true")? nsu_usr_interrupt_in: 4'b0 ;

wire [7:0] noc_m_axi_araddr_par, noc_m_axi_araddr_par_nc;
wire [7:0] noc_m_axi_awaddr_par, noc_m_axi_awaddr_par_nc;
wire [DATA_WIDTH/8 -1 :0] noc_axi_wdata_par;
wire noc_m_axi_wpoison;
wire [NSU_WIDTH/8-1:0] noc_m_axi_wdata_par;
wire axi_out_nc, axi_out_1;
wire [DIFF_BITS-1:0]  wdata_pad_wire;
wire [DATA_WIDTH-1:0] noc_m_axi_wdata;

wire [DATA_WIDTH/8-1:0] noc_m_axi_rdata_par;
wire noc_m_axi_rpoison;

wire [DUSER_WIDTH_NC-1:0] axi_wuser, noc_m_axi_wuser, axi_wuser_nc;
wire [DUSER_WIDTH_NC-1:0] axi_ruser, noc_m_axi_ruser, axi_ruser_nc;

assign m_axi_out = (NOC_FABRIC == "VNOC") ? axi_out_nc: axi_out_1;
assign m_axi_wdata = (NSU_WIDTH > DATA_WIDTH) ? {wdata_pad_wire,noc_m_axi_wdata}: noc_m_axi_wdata;
genvar k;
  generate for (k=0; k<DATA_WIDTH/8; k=k+1)
  begin
    if ( SIDEBAND_PINS == "data" || SIDEBAND_PINS == "true" ) begin
      assign axi_wuser[(k*2)+0]         = noc_m_axi_wpoison;
      assign axi_wuser[(k*2)+1]         = noc_m_axi_wdata_par[k];
      assign noc_m_axi_rdata_par[k]     = m_axi_ruser[(k*2)+1];
    end else begin
      assign axi_wuser                  = {DUSER_WIDTH_NC{1'b0}};
      assign noc_m_axi_rdata_par        = {16{1'b0}};
    end
  end
  endgenerate


assign m_axi_wuser = (SIDEBAND_PINS == "data" || SIDEBAND_PINS == "true" ) ? axi_wuser : (DUSER_WIDTH == 0) ? axi_wuser_nc : noc_m_axi_wuser;
assign noc_m_axi_ruser = (SIDEBAND_PINS == "data" || SIDEBAND_PINS == "true" ) ? 16'b0: (DUSER_WIDTH == 0) ? axi_ruser_nc : m_axi_ruser;
assign noc_m_axi_rpoison = (SIDEBAND_PINS == "addr" || SIDEBAND_PINS == "true") ? m_axi_ruser[0] : 1'b0;
////

wire [15:0] noc_m_axi_aruser, noc_m_axi_awuser;
wire [AUSER_WIDTH-1:0] noc_m_axi_aruser_nc ;
wire [AUSER_WIDTH-1:0] noc_m_axi_awuser_nc ;
assign m_axi_aruser[AUSER_WIDTH-1:10] =  (SIDEBAND_PINS == "addr" || SIDEBAND_PINS == "true" || NOC_FABRIC == "VNOC") ? noc_m_axi_araddr_par: noc_m_axi_aruser[15:10];
assign m_axi_awuser[AUSER_WIDTH-1:10] =  (SIDEBAND_PINS == "addr" || SIDEBAND_PINS == "true" || NOC_FABRIC == "VNOC") ? noc_m_axi_awaddr_par: noc_m_axi_awuser[15:10];
assign m_axi_aruser[9:0] =  noc_m_axi_aruser[9:0];
assign m_axi_awuser[9:0] =  noc_m_axi_awuser[9:0];

generate 
  if (NOC_TYPE == "NOC1" ) begin : NOC1
  if (NOC_FABRIC == "VNOC" ) begin : VNOC

//synthesis translate_off
  defparam NOC_NSU512_INST.BM_NOC_NSU512_INST.MODULAR_NOC_FLOW = 1;
//synthesis translate_on

(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
    NOC_NSU512 NOC_NSU512_INST (
     .IF_NOC_AXI_ARADDR         (m_axi_araddr),
     .IF_NOC_AXI_ARBURST        (m_axi_arburst),
     .IF_NOC_AXI_ARCACHE        (m_axi_arcache),
     .IF_NOC_AXI_ARCID          (m_axi_arid),
     .IF_NOC_AXI_ARLEN          (m_axi_arlen),
     .IF_NOC_AXI_ARLOCK         (m_axi_arlock),
     .IF_NOC_AXI_ARPROT         (m_axi_arprot),
     .IF_NOC_AXI_ARQOS          (m_axi_arqos),
     .IF_NOC_AXI_ARREGION       (m_axi_arregion),
     .IF_NOC_AXI_ARSIZE         (m_axi_arsize),
     .IF_NOC_AXI_ARUSER         (noc_m_axi_aruser),
     .IF_NOC_AXI_ARVALID        (m_axi_arvalid),
     .IF_NOC_AXI_AWADDR         (m_axi_awaddr),
     .IF_NOC_AXI_AWBURST        (m_axi_awburst),
     .IF_NOC_AXI_AWCACHE        (m_axi_awcache),
     .IF_NOC_AXI_AWCID          (m_axi_awid),
     .IF_NOC_AXI_AWLEN          (m_axi_awlen),
     .IF_NOC_AXI_AWLOCK         (m_axi_awlock),
     .IF_NOC_AXI_AWPROT         (m_axi_awprot),
     .IF_NOC_AXI_AWQOS          (m_axi_awqos),
     .IF_NOC_AXI_AWREGION       (m_axi_awregion),
     .IF_NOC_AXI_AWSIZE         (m_axi_awsize),
     .IF_NOC_AXI_AWUSER         (noc_m_axi_awuser),
     .IF_NOC_AXI_AWVALID        (m_axi_awvalid),
     .IF_NOC_AXI_BREADY         (m_axi_bready),
     .IF_NOC_AXI_RREADY         (m_axi_rready),
     .IF_NOC_AXI_WDATA          (noc_m_axi_wdata),
     .IF_NOC_AXI_WLAST          (m_axi_wlast),
     .IF_NOC_AXI_WSTRB          (m_axi_wstrb),
     .IF_NOC_AXI_WUSER          (noc_m_axi_wuser),
     .IF_NOC_AXI_WVALID         (m_axi_wvalid),
     .IF_NOC_AXI_ARREADY        (m_axi_arready),
     .IF_NOC_AXI_AWREADY        (m_axi_awready),
     .IF_NOC_AXI_BCID           (m_axi_bid),
     .IF_NOC_AXI_BRESP          (m_axi_bresp),
     .IF_NOC_AXI_BUSER          (m_axi_buser),
     .IF_NOC_AXI_BVALID         (m_axi_bvalid),
     .IF_NOC_AXI_RCID           (m_axi_rid),
     .IF_NOC_AXI_RDATA          (m_axi_rdata),
     .IF_NOC_AXI_RLAST          (m_axi_rlast),
     .IF_NOC_AXI_RRESP          (m_axi_rresp),
     .IF_NOC_AXI_RUSER          (noc_m_axi_ruser),
     .IF_NOC_AXI_RVALID         (m_axi_rvalid),
     .IF_NOC_AXI_WREADY         (m_axi_wready),
     .CLK                       (m_axi_aclk),
     .IF_NOC_AXI_AWADDR_PAR     (noc_m_axi_awaddr_par),
     .IF_NOC_AXI_RDATA_PAR      (noc_m_axi_rdata_par),
     .IF_NOC_AXI_RPOISON        (noc_m_axi_rpoison),
     .IF_NOC_AXI_WDATA_PAR      (noc_m_axi_wdata_par),
     .IF_NOC_AXI_WPOISON        (noc_m_axi_wpoison),
     .IF_NOC_AXI_ARADDR_PAR     (noc_m_axi_araddr_par),
     .NSU_USR_INTERRUPT_IN      (usr_interrupt_in)
   );    
  end : VNOC
  end else begin : NOC2

//synthesis translate_off
  defparam NOC2_NSU512_INST.BM_NOC2_NSU512_INST.MODULAR_NOC_FLOW = 1;
//synthesis translate_on

(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
  NOC2_NSU512 NOC2_NSU512_INST (
    .IF_NOC_AXI_ARADDR      (m_axi_araddr),
    .IF_NOC_AXI_ARADDR_PAR  (noc_m_axi_araddr_par),
    .IF_NOC_AXI_ARBURST     (m_axi_arburst),
    .IF_NOC_AXI_ARCACHE     (m_axi_arcache),
    .IF_NOC_AXI_ARCID       (m_axi_arid),
    .IF_NOC_AXI_ARLEN       (m_axi_arlen),
    .IF_NOC_AXI_ARLOCK      (m_axi_arlock),
    .IF_NOC_AXI_ARPROT      (m_axi_arprot),
    .IF_NOC_AXI_ARQOS       (m_axi_arqos),
    .IF_NOC_AXI_ARREGION    (m_axi_arregion),
    .IF_NOC_AXI_ARSIZE      (m_axi_arsize),
    .IF_NOC_AXI_ARUSER      (noc_m_axi_aruser),
    .IF_NOC_AXI_ARVALID     (m_axi_arvalid),
    .IF_NOC_AXI_AWADDR      (m_axi_awaddr),
    .IF_NOC_AXI_AWADDR_PAR  (noc_m_axi_awaddr_par),
    .IF_NOC_AXI_AWBURST     (m_axi_awburst),
    .IF_NOC_AXI_AWCACHE     (m_axi_awcache),
    .IF_NOC_AXI_AWCID       (m_axi_awid),
    .IF_NOC_AXI_AWLEN       (m_axi_awlen),
    .IF_NOC_AXI_AWLOCK      (m_axi_awlock),
    .IF_NOC_AXI_AWPROT      (m_axi_awprot),
    .IF_NOC_AXI_AWQOS       (m_axi_awqos),
    .IF_NOC_AXI_AWREGION    (m_axi_awregion),
    .IF_NOC_AXI_AWSIZE      (m_axi_awsize),
    .IF_NOC_AXI_AWUSER      (noc_m_axi_awuser),
    .IF_NOC_AXI_AWVALID     (m_axi_awvalid),
    .IF_NOC_AXI_BREADY      (m_axi_bready),
    .IF_NOC_AXI_RREADY      (m_axi_rready),
    .IF_NOC_AXI_TDEST       (),
    .IF_NOC_AXI_WDATA       (noc_m_axi_wdata),
    .IF_NOC_AXI_WDATA_PAR   (noc_m_axi_wdata_par),
    .IF_NOC_AXI_WLAST       (m_axi_wlast),
    .IF_NOC_AXI_WPOISON     (noc_m_axi_wpoison),
    .IF_NOC_AXI_WSTRB       (m_axi_wstrb),
    .IF_NOC_AXI_WUSER       (noc_m_axi_wuser),
    .IF_NOC_AXI_WVALID      (m_axi_wvalid),
    .NSU_FIREWALL_ERR       (),
    .CLK                    (m_axi_aclk),
    .IF_NOC_AXI_ARREADY     (m_axi_arready),
    .IF_NOC_AXI_AWREADY     (m_axi_awready),
    .IF_NOC_AXI_BCID        (m_axi_bid),
    .IF_NOC_AXI_BRESP       (m_axi_bresp),
    .IF_NOC_AXI_BUSER       (m_axi_buser),
    .IF_NOC_AXI_BVALID      (m_axi_bvalid),
    .IF_NOC_AXI_RCID        (m_axi_rid),
    .IF_NOC_AXI_RDATA       (m_axi_rdata),
    .IF_NOC_AXI_RDATA_PAR   (noc_m_axi_rdata_par),
    .IF_NOC_AXI_RLAST       (m_axi_rlast),
    .IF_NOC_AXI_RPOISON     (noc_m_axi_rpoison),
    .IF_NOC_AXI_RRESP       (m_axi_rresp),
    .IF_NOC_AXI_RUSER       (noc_m_axi_ruser),
    .IF_NOC_AXI_RVALID      (m_axi_rvalid),
    .IF_NOC_AXI_WREADY      (m_axi_wready),
    .NSU_USR_INTERRUPT_IN   (usr_interrupt_in)
  );
  end
endgenerate

endmodule
