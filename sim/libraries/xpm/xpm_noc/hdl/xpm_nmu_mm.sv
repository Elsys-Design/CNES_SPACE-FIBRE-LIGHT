`timescale 1ps/1ps

(* XPM_MODULE = "TRUE", XPM_NOC = "NMU_MM", KEEP_HIERARCHY = "SOFT", DONT_TOUCH = "yes" *)
module xpm_nmu_mm # (
  parameter string  NOC_FABRIC            = "VNOC",  // VNOC/BLI
  parameter integer DATA_WIDTH            = 512,     // 32/64/128/256/512
  parameter integer ADDR_WIDTH            = 64,      // 12 to 64
  parameter integer ID_WIDTH              = 16,      // 0 to 16
  parameter integer AUSER_WIDTH           = 16,      // 16 for VNOC with parity disabled, 18 for VNOC with parity enabled 
  parameter integer DUSER_WIDTH           = 0,       // 2*DATA_WIDTH/8 for parity enablement with VNOC, 0 for VNOC with parity disabled cases
  parameter string  ENABLE_USR_INTERRUPT  = "false", // false/true
  parameter string  SIDEBAND_PINS         = "false"  // false/true/addr/data
) (

  (* X_INTERFACE_IGNORE = "true" *)
  input  wire                     s_axi_aclk,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWID" *)
  (* X_INTERFACE_MODE = "slave" *)
  input  wire [ID_WIDTH-1:0]      s_axi_awid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *)
  input  wire [ADDR_WIDTH-1:0]    s_axi_awaddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *)
  input  wire [7:0]               s_axi_awlen,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *)
  input  wire [2:0]               s_axi_awsize,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *)
  input  wire [1:0]               s_axi_awburst,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK" *)
  input  wire [0:0]               s_axi_awlock,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE" *)
  input  wire [3:0]               s_axi_awcache,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPORT" *)
  input  wire [2:0]               s_axi_awprot,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREGION" *)
  input  wire [3:0]               s_axi_awregion,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWQOS" *)
  input  wire [3:0]               s_axi_awqos,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWUSER" *)
  input  wire [AUSER_WIDTH-1:0]   s_axi_awuser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *)
  input  wire                     s_axi_awvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *)
  output wire                     s_axi_awready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WID" *)
  input  wire [ID_WIDTH-1:0]      s_axi_wid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *)
  input  wire [DATA_WIDTH-1:0]    s_axi_wdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *)
  input  wire [DATA_WIDTH/8-1:0]  s_axi_wstrb,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *)
  input  wire                     s_axi_wlast,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WUSER" *)
  input  wire [(DUSER_WIDTH == 0 ? 1 : DUSER_WIDTH)-1:0] s_axi_wuser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *)
  input  wire                     s_axi_wvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *)
  output wire                     s_axi_wready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BID" *)
  output wire [ID_WIDTH-1:0]      s_axi_bid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *)
  output wire [1:0]               s_axi_bresp,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BUSER" *)
  output wire [16-1:0]            s_axi_buser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *)
  output wire                     s_axi_bvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *)
  input  wire                     s_axi_bready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARID" *)
  input  wire [ID_WIDTH-1:0]      s_axi_arid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *)
  input  wire [ADDR_WIDTH-1:0]    s_axi_araddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *)
  input  wire [7:0]               s_axi_arlen,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *)
  input  wire [2:0]               s_axi_arsize,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *)
  input  wire [1:0]               s_axi_arburst,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK" *)
  input  wire [0:0]               s_axi_arlock,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE" *)
  input  wire [3:0]               s_axi_arcache,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *)
  input  wire [2:0]               s_axi_arprot,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREGION" *)
  input  wire [3:0]               s_axi_arregion,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARQOS" *)
  input  wire [3:0]               s_axi_arqos,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARUSER" *)
  input  wire [AUSER_WIDTH-1:0]   s_axi_aruser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *)
  input  wire                     s_axi_arvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *)
  output wire                     s_axi_arready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RID" *)
  output wire [ID_WIDTH-1:0]      s_axi_rid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *)
  output wire [DATA_WIDTH-1:0]    s_axi_rdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *)
  output wire [1:0]               s_axi_rresp,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *)
  output wire                     s_axi_rlast,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RUSER" *)
  output wire [(DUSER_WIDTH == 0 ? 1 : DUSER_WIDTH)-1:0]   s_axi_ruser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *)
  output wire                     s_axi_rvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *)
  input  wire                     s_axi_rready,

  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0]                nmu_usr_interrupt_in
);

//------------------------------------------------------------------------------
// Constants
//------------------------------------------------------------------------------
localparam XPM_NAME = "XPM_NMU";
localparam integer XPM_MODULE_ID = 2;
localparam NMU_WIDTH = (NOC_FABRIC == "VNOC") ? 512:256;
`include "noc_type.vh"

//------------------------------------------------------------------------------
// Configuration DRCs
//------------------------------------------------------------------------------
initial begin : config_drc_nmu_mm
    reg drc_err_flag;
    drc_err_flag = 0;
    #1;
    
    if (DATA_WIDTH != 32 && DATA_WIDTH != 64 && DATA_WIDTH != 128 && DATA_WIDTH != 256 && DATA_WIDTH != 512) begin
      $error("[%s %0d-%0d] DATA_WIDTH (%d) is not supported. Valid options are 32/64/128/256/512. %m", XPM_NAME, XPM_MODULE_ID, 1, DATA_WIDTH);
      drc_err_flag = 1;
    end

    if (ADDR_WIDTH < 12 || ADDR_WIDTH > 64) begin
      $error("[%s %0d-%0d] ADDR_WIDTH (%d) is not supported. Valid range is 12-64. %m", XPM_NAME, XPM_MODULE_ID, 2,  ADDR_WIDTH);
      drc_err_flag = 1;
    end

    if (ID_WIDTH > 16 && NOC_FABRIC == "VNOC") begin
      $error("[%s %0d-%0d] ID_WIDTH (%d) is not supported. Valid range is 1-16. %m", XPM_NAME, XPM_MODULE_ID, 3,  ID_WIDTH);
      drc_err_flag = 1;
    end else if (ID_WIDTH > 7 && NOC_FABRIC == "BLI") begin
      $error("[%s %0d-%0d] ID_WIDTH (%d) is not supported. Valid range is 1-7. %m", XPM_NAME, XPM_MODULE_ID, 3,  ID_WIDTH);
      drc_err_flag = 1;
    end
   
    if (SIDEBAND_PINS == "false" &&  NOC_FABRIC == "VNOC" && AUSER_WIDTH != 16) begin
      $error("[%s %0d-%0d] AUSER_WIDTH (%d) is not supported. Valid value is 16 for VNOC category with SIDEBAND_PINS values as false . %m", XPM_NAME, XPM_MODULE_ID, 4,  AUSER_WIDTH);
      drc_err_flag = 1;
    end
    
    if (SIDEBAND_PINS == "true" &&  NOC_FABRIC == "VNOC" && AUSER_WIDTH != 18) begin
      $error("[%s %0d-%0d] AUSER_WIDTH (%d) is not supported. Valid value is 18 for VNOC category with SIDEBAND_PINS values as true . %m", XPM_NAME, XPM_MODULE_ID, 5,  AUSER_WIDTH);
      drc_err_flag = 1;
    end

    if (SIDEBAND_PINS == "true" &&  NOC_FABRIC == "VNOC" && DUSER_WIDTH != 2*DATA_WIDTH/8) begin
      $error("[%s %0d-%0d] DUSER_WIDTH (%d) is not supported. Valid option is 2*DATA_WIDTH/8 for VNOC category with SIDEBAND_PINS values as true. %m", XPM_NAME, XPM_MODULE_ID, 6,  DUSER_WIDTH);
      drc_err_flag = 1;
    end
    
   if (SIDEBAND_PINS == "false" &&  NOC_FABRIC == "VNOC" && DUSER_WIDTH != 0) begin
      $error("[%s %0d-%0d] DUSER_WIDTH (%d) is not supported. Valid value is 0 for VNOC category with SIDEBAND_PINS values as false. %m", XPM_NAME, XPM_MODULE_ID, 7,  DUSER_WIDTH);
      drc_err_flag = 1;
    end
   

//    if (READ_TRAFFIC_CLASS != "LOW_LATENCY" && READ_TRAFFIC_CLASS != "ISOCHRONOUS" && READ_TRAFFIC_CLASS != "BEST_EFFORT") begin
//      $error("[%s %0d-%0d] READ_TRAFFIC_CLASS (%s) is not supported. Valid options are LOW_LATENCY / ISOCHRONOUS / BEST_EFFORT. %m", XPM_NAME, XPM_MODULE_ID, 8,  READ_TRAFFIC_CLASS);
//      drc_err_flag = 1;
//    end

//    if (WRITE_TRAFFIC_CLASS != "ISOCHRONOUS" && WRITE_TRAFFIC_CLASS != "BEST_EFFORT") begin
//      $error("[%s %0d-%0d] WRITE_TRAFFIC_CLASS (%s) is not supported. Valid options are LOW_LATENCY / ISOCHRONOUS / BEST_EFFORT. %m", XPM_NAME, XPM_MODULE_ID, 9,  WRITE_TRAFFIC_CLASS);
//      drc_err_flag = 1;
//    end
    
    if ( NOC_FABRIC != "VNOC" && NOC_FABRIC != "BLI" ) begin
      $error("[%s %0d-%0d]  NOC_FABRIC (%s) is not supported. Valid values are VNOC or BLI. %m", XPM_NAME, XPM_MODULE_ID, 10,  NOC_FABRIC);
      drc_err_flag = 1;
    end

    if (drc_err_flag == 1)
      #1 $finish;
end : config_drc_nmu_mm

//------------------------------------------------------------------------------
// Local Wire Declaration
//------------------------------------------------------------------------------
wire [3:0] usr_interrupt_in;
//wire axi_in_nc, axi_in_1;
wire [NMU_WIDTH-1:0] noc_axi_rdata;
//wire [DIFF_BITS-1:0] rdata_pad_wire;
wire [DATA_WIDTH/8-1:0] noc_axi_rdata_par;
wire noc_axi_rpoison;
wire [DATA_WIDTH/8-1:0]   noc_axi_wdata_par;
wire [DUSER_WIDTH-1:0]   axi_ruser, noc_axi_ruser;
wire noc_axi_wpoison;
wire [7:0] noc_axi_araddr_par;
wire [7:0] noc_axi_awaddr_par;
wire [15:0] noc_axi_aruser;
wire [15:0] noc_axi_awuser;
wire [15:0] noc_axi_wuser;


//------------------------------------------------------------------------------
// Mapping Interrupt signal
//------------------------------------------------------------------------------
assign usr_interrupt_in = (ENABLE_USR_INTERRUPT == "true")? nmu_usr_interrupt_in: 4'b0 ;
//assign axi_in_1 = (NOC_FABRIC == "VNOC") ? axi_in_nc: axi_in;

assign s_axi_rdata =  noc_axi_rdata[DATA_WIDTH-1:0];

//------------------------------------------------------------------------------
// Mapping Parity and Poison signals over USER signals
//------------------------------------------------------------------------------
genvar k;
generate for (k=0; k<DATA_WIDTH/8; k=k+1)
  begin
    if ( SIDEBAND_PINS == "data" || SIDEBAND_PINS == "true" ) begin
      assign axi_ruser[(k*2)+0]         = noc_axi_rpoison;
      assign axi_ruser[(k*2)+1]         = noc_axi_rdata_par[k];
      assign noc_axi_wdata_par[k] = s_axi_wuser[(k*2)+1];
    end
  end
endgenerate

if (NOC_FABRIC == "PS") begin
  assign axi_ruser[0] = noc_axi_rpoison;
  assign axi_ruser[16:1] = noc_axi_rdata_par[15:0];
  assign noc_axi_wdata_par   = s_axi_wuser[16:1];
end
else if (NOC_FABRIC == "AIE") begin
  assign axi_ruser[16] = 1'b0;
  assign noc_axi_wdata_par   = {(DATA_WIDTH/8){1'b0}};
end

assign noc_axi_wpoison = (NOC_FABRIC == "PS" || SIDEBAND_PINS == "data" || SIDEBAND_PINS == "true") ? s_axi_wuser[0] : 1'b0;
//NoC doesn't transfer RUSER from NSU to NMU
assign s_axi_ruser   = (NOC_FABRIC == "PS" || SIDEBAND_PINS == "data" || SIDEBAND_PINS == "true") ? axi_ruser : noc_axi_ruser;

assign noc_axi_araddr_par = (NOC_FABRIC == "PS" || SIDEBAND_PINS == "addr" || SIDEBAND_PINS == "true") ? s_axi_aruser[17:10] : 8'b0;
assign noc_axi_awaddr_par = (NOC_FABRIC == "PS" || SIDEBAND_PINS == "addr" || SIDEBAND_PINS == "true") ? s_axi_awuser[17:10] : 8'b0;

assign noc_axi_aruser = (NOC_FABRIC == "PS" || SIDEBAND_PINS == "addr" || SIDEBAND_PINS == "true") ? {6'b0,s_axi_aruser[9:0]} : s_axi_aruser ; 
assign noc_axi_awuser = (NOC_FABRIC == "PS" || SIDEBAND_PINS == "addr" || SIDEBAND_PINS == "true") ? {6'b0,s_axi_awuser[9:0]} : s_axi_awuser ; 
//assign noc_axi_wuser = (NOC_FABRIC == "PS" || SIDEBAND_PINS == "addr" || SIDEBAND_PINS == "true") ? {16{1'b0}} : s_axi_wuser ;
//NoC doesn't transfer WUSER from NMU to NSU
assign noc_axi_wuser =  {16{1'b0}} ; 

//------------------------------------------------------------------------------
// Instantiating NMU Unisim
//------------------------------------------------------------------------------
generate
  if (NOC_TYPE == "NOC1" ) begin : NOC1
  if (NOC_FABRIC == "VNOC" ) begin : VNOC

//synthesis translate_off
  defparam NOC_NMU512_INST.BM_NOC_NMU512_INST.MODULAR_NOC_FLOW = 1;
//synthesis translate_on

(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
    NOC_NMU512 NOC_NMU512_INST (
      .IF_NOC_AXI_WVALID      (s_axi_wvalid),
      .IF_NOC_AXI_WREADY      (s_axi_wready),
      .IF_NOC_AXI_WLAST       (s_axi_wlast),
      .IF_NOC_AXI_AWID        (s_axi_awid),
      .IF_NOC_AXI_WDATA       (s_axi_wdata),
      .IF_NOC_AXI_WSTRB       (s_axi_wstrb),
      .IF_NOC_AXI_ARREADY     (s_axi_arready),
      .IF_NOC_AXI_AWREADY     (s_axi_awready),
      .IF_NOC_AXI_BID         (s_axi_bid),
      .IF_NOC_AXI_BRESP       (s_axi_bresp),
      .IF_NOC_AXI_BUSER       (s_axi_buser),
      .IF_NOC_AXI_BVALID      (s_axi_bvalid),
      .IF_NOC_AXI_RDATA       (noc_axi_rdata),
      .IF_NOC_AXI_WDATA_PAR   (noc_axi_wdata_par),
      .IF_NOC_AXI_RID         (s_axi_rid),
      .IF_NOC_AXI_RLAST       (s_axi_rlast),
      .IF_NOC_AXI_WPOISON     (noc_axi_wpoison),
      .IF_NOC_AXI_RRESP       (s_axi_rresp),
      .IF_NOC_AXI_RUSER       (noc_axi_ruser),
      .IF_NOC_AXI_RVALID      (s_axi_rvalid),
      .IF_NOC_AXI_ARADDR      ({{64-ADDR_WIDTH{1'b0}},s_axi_araddr}),
      .IF_NOC_AXI_ARADDR_PAR  (noc_axi_araddr_par),
      .IF_NOC_AXI_AWADDR_PAR  (noc_axi_awaddr_par),
      .IF_NOC_AXI_ARBURST     (s_axi_arburst),
      .IF_NOC_AXI_ARCACHE     (s_axi_arcache),
      .IF_NOC_AXI_ARID        (s_axi_arid),
      .IF_NOC_AXI_ARLEN       (s_axi_arlen),
      .IF_NOC_AXI_ARLOCK      (s_axi_arlock),
      .IF_NOC_AXI_ARPROT      (s_axi_arprot),
      .IF_NOC_AXI_ARQOS       (s_axi_arqos),
      .IF_NOC_AXI_ARREGION    (s_axi_arregion),
      .IF_NOC_AXI_ARSIZE      (s_axi_arsize),
      .IF_NOC_AXI_ARUSER      (noc_axi_aruser),
      .IF_NOC_AXI_ARVALID     (s_axi_arvalid),
      .IF_NOC_AXI_AWADDR      ({{64-ADDR_WIDTH{1'b0}},s_axi_awaddr}),
      .IF_NOC_AXI_AWBURST     (s_axi_awburst),
      .IF_NOC_AXI_AWCACHE     (s_axi_awcache),
      .IF_NOC_AXI_AWLEN       (s_axi_awlen),
      .IF_NOC_AXI_AWLOCK      (s_axi_awlock),
      .IF_NOC_AXI_AWPROT      (s_axi_awprot),
      .IF_NOC_AXI_AWQOS       (s_axi_awqos),
      .IF_NOC_AXI_AWREGION    (s_axi_awregion),
      .IF_NOC_AXI_AWSIZE      (s_axi_awsize),
      .IF_NOC_AXI_AWUSER      (noc_axi_awuser),
      .IF_NOC_AXI_AWVALID     (s_axi_awvalid),
      .IF_NOC_AXI_BREADY      (s_axi_bready),
      .IF_NOC_AXI_RREADY      (s_axi_rready),
      .IF_NOC_AXI_WID         ('h0),
      .IF_NOC_AXI_WUSER       (noc_axi_wuser),
      .NMU_RD_DEST_MODE       ('b0),
      .NMU_RD_USR_DST         ('b0),
      .NMU_WR_DEST_MODE       ('b0),
      .NMU_WR_USR_DST         ('b0),
      .NMU_USR_INTERRUPT_IN   (usr_interrupt_in),
      .IF_NOC_AXI_RDATA_PAR   (noc_axi_rdata_par),
      .CLK                    (s_axi_aclk),
      .IF_NOC_AXI_RPOISON     (noc_axi_rpoison)
  );
  end else begin : BLI

//synthesis translate_off
  defparam NOC_NMU_HBM2E_INST.BM_NOC_NMU_HBM2E_INST.MODULAR_NOC_FLOW = 1;
//synthesis translate_on

(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
     NOC_NMU_HBM2E NOC_NMU_HBM2E_INST (
      .IF_NOC_AXI_TOP_WVALID    (s_axi_wvalid),     
      .IF_NOC_AXI_TOP_WREADY    (s_axi_wready),     
      .IF_NOC_AXI_TOP_WLAST     (s_axi_wlast),      
      .IF_NOC_AXI_TOP_AWID      (s_axi_awid),       
      .IF_NOC_AXI_TOP_WDATA     (s_axi_wdata),      
      .IF_NOC_AXI_TOP_WSTRB     (s_axi_wstrb),      
      .IF_NOC_AXI_TOP_ARREADY   (s_axi_arready),    
      .IF_NOC_AXI_TOP_AWREADY   (s_axi_awready),    
      .IF_NOC_AXI_TOP_BID       (s_axi_bid),        
      .IF_NOC_AXI_TOP_BRESP     (s_axi_bresp),      
      .IF_NOC_AXI_TOP_BUSER     (s_axi_buser),      
      .IF_NOC_AXI_TOP_BVALID    (s_axi_bvalid),     
      .IF_NOC_AXI_TOP_RDATA     (noc_axi_rdata),    
      .IF_NOC_AXI_TOP_WDATA_PAR (noc_axi_wdata_par),
      .IF_NOC_AXI_TOP_RID       (s_axi_rid),        
      .IF_NOC_AXI_TOP_RLAST     (s_axi_rlast),      
      .IF_NOC_AXI_TOP_WPOISON   (noc_axi_wpoison),  
      .IF_NOC_AXI_TOP_RRESP     (s_axi_rresp),      
      .IF_NOC_AXI_TOP_RVALID    (s_axi_rvalid),       
      .IF_NOC_AXI_TOP_ARADDR    ({{64-ADDR_WIDTH{1'b0}},s_axi_araddr}),
      .IF_NOC_AXI_TOP_ARADDR_PAR(noc_axi_araddr_par), 
      .IF_NOC_AXI_TOP_AWADDR_PAR(noc_axi_awaddr_par), 
      .IF_NOC_AXI_TOP_ARBURST   (s_axi_arburst),      
      .IF_NOC_AXI_TOP_ARCACHE   (s_axi_arcache),      
      .IF_NOC_AXI_TOP_ARID      (s_axi_arid),         
      .IF_NOC_AXI_TOP_ARLEN     (s_axi_arlen),        
      .IF_NOC_AXI_TOP_ARLOCK    (s_axi_arlock),       
      .IF_NOC_AXI_TOP_ARPROT    (s_axi_arprot),       
      .IF_NOC_AXI_TOP_ARSIZE    (s_axi_arsize),       
      .IF_NOC_AXI_TOP_ARUSER    (noc_axi_aruser),     
      .IF_NOC_AXI_TOP_ARVALID   (s_axi_arvalid),      
      .IF_NOC_AXI_TOP_AWADDR    ({{64-ADDR_WIDTH{1'b0}},s_axi_awaddr}),
      .IF_NOC_AXI_TOP_AWBURST   (s_axi_awburst),      
      .IF_NOC_AXI_TOP_AWCACHE   (s_axi_awcache),      
      .IF_NOC_AXI_TOP_AWLEN     (s_axi_awlen),        
      .IF_NOC_AXI_TOP_AWLOCK    (s_axi_awlock),       
      .IF_NOC_AXI_TOP_AWPROT    (s_axi_awprot),       
      .IF_NOC_AXI_TOP_AWSIZE    (s_axi_awsize),  
      .IF_NOC_AXI_TOP_AWUSER    (noc_axi_awuser),
      .IF_NOC_AXI_TOP_AWVALID   (s_axi_awvalid), 
      .IF_NOC_AXI_TOP_BREADY    (s_axi_bready),  
      .IF_NOC_AXI_TOP_RREADY    (s_axi_rready),  
      .IF_NOC_AXI_TOP_RD_DEST_MODE ('b0),
      .IF_NOC_AXI_TOP_RD_USR_DST   ('b0),
      .IF_NOC_AXI_TOP_WR_DEST_MODE ('b0),
      .IF_NOC_AXI_TOP_WR_USR_DST   ('b0),
      .NMU_USR_INTERRUPT_IN     (usr_interrupt_in), 
      .IF_NOC_AXI_TOP_RDATA_PAR (noc_axi_rdata_par),
      .CLK                      (s_axi_aclk),       
      .IF_NOC_AXI_TOP_RPOISON   (noc_axi_rpoison)   
   );
   end
   end else if (NOC_TYPE == "NOC2") begin : NOC2

//synthesis translate_off
  defparam NOC2_NMU512_INST.BM_NOC2_NMU512_INST.MODULAR_NOC_FLOW = 1;
//synthesis translate_on

(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
    NOC2_NMU512 NOC2_NMU512_INST (
      .IF_NOC_AXI_WVALID      (s_axi_wvalid),
      .IF_NOC_AXI_WREADY      (s_axi_wready),
      .IF_NOC_AXI_WLAST       (s_axi_wlast),
      .IF_NOC_AXI_AWID        (s_axi_awid),
      .IF_NOC_AXI_WDATA       (s_axi_wdata),
      .IF_NOC_AXI_WSTRB       (s_axi_wstrb),
      .IF_NOC_AXI_ARREADY     (s_axi_arready),
      .IF_NOC_AXI_AWREADY     (s_axi_awready),
      .IF_NOC_AXI_BID         (s_axi_bid),
      .IF_NOC_AXI_BRESP       (s_axi_bresp),
      .IF_NOC_AXI_BUSER       (s_axi_buser),
      .IF_NOC_AXI_BVALID      (s_axi_bvalid),
      .IF_NOC_AXI_RDATA       (noc_axi_rdata),
      .IF_NOC_AXI_WDATA_PAR   (noc_axi_wdata_par),
      .IF_NOC_AXI_RID         (s_axi_rid),
      .IF_NOC_AXI_RLAST       (s_axi_rlast),
      .IF_NOC_AXI_WPOISON     (noc_axi_wpoison),
      .IF_NOC_AXI_RRESP       (s_axi_rresp),
      .IF_NOC_AXI_RUSER       (noc_axi_ruser),
      .IF_NOC_AXI_RVALID      (s_axi_rvalid),
      .IF_NOC_AXI_ARADDR      ({{64-ADDR_WIDTH{1'b0}},s_axi_araddr}),
      .IF_NOC_AXI_ARADDR_PAR  (noc_axi_araddr_par),
      .IF_NOC_AXI_AWADDR_PAR  (noc_axi_awaddr_par),
      .IF_NOC_AXI_ARBURST     (s_axi_arburst),
      .IF_NOC_AXI_ARCACHE     (s_axi_arcache),
      .IF_NOC_AXI_ARID        (s_axi_arid),
      .IF_NOC_AXI_ARLEN       (s_axi_arlen),
      .IF_NOC_AXI_ARLOCK      (s_axi_arlock),
      .IF_NOC_AXI_ARPROT      (s_axi_arprot),
      .IF_NOC_AXI_ARQOS       (s_axi_arqos),
      .IF_NOC_AXI_ARREGION    (s_axi_arregion),
      .IF_NOC_AXI_ARSIZE      (s_axi_arsize),
      .IF_NOC_AXI_ARUSER      (noc_axi_aruser),
      .IF_NOC_AXI_ARVALID     (s_axi_arvalid),
      .IF_NOC_AXI_AWADDR      ({{64-ADDR_WIDTH{1'b0}},s_axi_awaddr}),
      .IF_NOC_AXI_AWBURST     (s_axi_awburst),
      .IF_NOC_AXI_AWCACHE     (s_axi_awcache),
      .IF_NOC_AXI_AWLEN       (s_axi_awlen),
      .IF_NOC_AXI_AWLOCK      (s_axi_awlock),
      .IF_NOC_AXI_AWPROT      (s_axi_awprot),
      .IF_NOC_AXI_AWQOS       (s_axi_awqos),
      .IF_NOC_AXI_AWREGION    (s_axi_awregion),
      .IF_NOC_AXI_AWSIZE      (s_axi_awsize),
      .IF_NOC_AXI_AWUSER      (noc_axi_awuser),
      .IF_NOC_AXI_AWVALID     (s_axi_awvalid),
      .IF_NOC_AXI_BREADY      (s_axi_bready),
      .IF_NOC_AXI_RREADY      (s_axi_rready),
      .IF_NOC_AXI_WID         ('h0),
      .IF_NOC_AXI_WUSER       (noc_axi_wuser),
      .NMU_RD_DEST_MODE       ('b0),
      .NMU_RD_USR_DST         ('b0),
      .NMU_WR_DEST_MODE       ('b0),
      .NMU_WR_USR_DST         ('b0),
      .NMU_USR_INTERRUPT_IN   (usr_interrupt_in),
      .IF_NOC_AXI_RDATA_PAR   (noc_axi_rdata_par),
      .CLK                    (s_axi_aclk),
      .IF_NOC_AXI_RPOISON     (noc_axi_rpoison)
      );
   end
endgenerate

endmodule



