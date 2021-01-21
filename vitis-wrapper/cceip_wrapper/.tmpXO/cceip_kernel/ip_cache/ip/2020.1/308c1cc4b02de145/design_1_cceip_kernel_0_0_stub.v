// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Thu Jan 21 13:13:16 2021
// Host        : qqq running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_cceip_kernel_0_0_stub.v
// Design      : design_1_cceip_kernel_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "cceip_kernel,Vivado 2020.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(ap_clk, ap_rst_n, m00_axi_awvalid, 
  m00_axi_awready, m00_axi_awaddr, m00_axi_awlen, m00_axi_wvalid, m00_axi_wready, 
  m00_axi_wdata, m00_axi_wstrb, m00_axi_wlast, m00_axi_bvalid, m00_axi_bready, 
  m00_axi_arvalid, m00_axi_arready, m00_axi_araddr, m00_axi_arlen, m00_axi_rvalid, 
  m00_axi_rready, m00_axi_rdata, m00_axi_rlast, s_axi_control_awvalid, 
  s_axi_control_awready, s_axi_control_awaddr, s_axi_control_wvalid, 
  s_axi_control_wready, s_axi_control_wdata, s_axi_control_wstrb, s_axi_control_arvalid, 
  s_axi_control_arready, s_axi_control_araddr, s_axi_control_rvalid, 
  s_axi_control_rready, s_axi_control_rdata, s_axi_control_rresp, s_axi_control_bvalid, 
  s_axi_control_bready, s_axi_control_bresp, interrupt)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,m00_axi_awvalid,m00_axi_awready,m00_axi_awaddr[63:0],m00_axi_awlen[7:0],m00_axi_wvalid,m00_axi_wready,m00_axi_wdata[63:0],m00_axi_wstrb[7:0],m00_axi_wlast,m00_axi_bvalid,m00_axi_bready,m00_axi_arvalid,m00_axi_arready,m00_axi_araddr[63:0],m00_axi_arlen[7:0],m00_axi_rvalid,m00_axi_rready,m00_axi_rdata[63:0],m00_axi_rlast,s_axi_control_awvalid,s_axi_control_awready,s_axi_control_awaddr[11:0],s_axi_control_wvalid,s_axi_control_wready,s_axi_control_wdata[31:0],s_axi_control_wstrb[3:0],s_axi_control_arvalid,s_axi_control_arready,s_axi_control_araddr[11:0],s_axi_control_rvalid,s_axi_control_rready,s_axi_control_rdata[31:0],s_axi_control_rresp[1:0],s_axi_control_bvalid,s_axi_control_bready,s_axi_control_bresp[1:0],interrupt" */;
  input ap_clk;
  input ap_rst_n;
  output m00_axi_awvalid;
  input m00_axi_awready;
  output [63:0]m00_axi_awaddr;
  output [7:0]m00_axi_awlen;
  output m00_axi_wvalid;
  input m00_axi_wready;
  output [63:0]m00_axi_wdata;
  output [7:0]m00_axi_wstrb;
  output m00_axi_wlast;
  input m00_axi_bvalid;
  output m00_axi_bready;
  output m00_axi_arvalid;
  input m00_axi_arready;
  output [63:0]m00_axi_araddr;
  output [7:0]m00_axi_arlen;
  input m00_axi_rvalid;
  output m00_axi_rready;
  input [63:0]m00_axi_rdata;
  input m00_axi_rlast;
  input s_axi_control_awvalid;
  output s_axi_control_awready;
  input [11:0]s_axi_control_awaddr;
  input s_axi_control_wvalid;
  output s_axi_control_wready;
  input [31:0]s_axi_control_wdata;
  input [3:0]s_axi_control_wstrb;
  input s_axi_control_arvalid;
  output s_axi_control_arready;
  input [11:0]s_axi_control_araddr;
  output s_axi_control_rvalid;
  input s_axi_control_rready;
  output [31:0]s_axi_control_rdata;
  output [1:0]s_axi_control_rresp;
  output s_axi_control_bvalid;
  input s_axi_control_bready;
  output [1:0]s_axi_control_bresp;
  output interrupt;
endmodule
