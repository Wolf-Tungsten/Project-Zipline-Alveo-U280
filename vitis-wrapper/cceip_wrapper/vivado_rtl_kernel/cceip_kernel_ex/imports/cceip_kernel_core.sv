`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2021 02:43:59 PM
// Design Name: 
// Module Name: cceip_kernel_core
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cceip_kernel_core
#(
  parameter integer C_M00_AXI_ADDR_WIDTH       = 64 ,
  parameter integer C_M00_AXI_DATA_WIDTH       = 64,
  parameter integer C_XFER_SIZE_WIDTH        = 64
)
(
  // System Signals
  input wire                                    ap_clk               ,
  input wire                                    areset             ,
  // Extra clocks
  input wire                                    kernel_clk         ,
  input wire                                    kernel_rst         ,
  // AXI4 master interface
  output wire                                   m00_axi_awvalid      ,
  input wire                                    m00_axi_awready      ,
  output wire [C_M00_AXI_ADDR_WIDTH-1:0]          m00_axi_awaddr       ,
  output wire [8-1:0]                           m00_axi_awlen        ,
  output wire                                   m00_axi_wvalid       ,
  input wire                                    m00_axi_wready       ,
  output wire [C_M00_AXI_DATA_WIDTH-1:0]          m00_axi_wdata        ,
  output wire [C_M00_AXI_DATA_WIDTH/8-1:0]        m00_axi_wstrb        ,
  output wire                                   m00_axi_wlast        ,
  output wire                                   m00_axi_arvalid      ,
  input wire                                    m00_axi_arready      ,
  output wire [C_M00_AXI_ADDR_WIDTH-1:0]          m00_axi_araddr       ,
  output wire [8-1:0]                           m00_axi_arlen        ,
  input wire                                    m00_axi_rvalid       ,
  output wire                                   m00_axi_rready       ,
  input wire [C_M00_AXI_DATA_WIDTH-1:0]           m00_axi_rdata        ,
  input wire                                    m00_axi_rlast        ,
  input wire                                    m00_axi_bvalid       ,
  output wire                                   m00_axi_bready       ,
  // Control Signals
  input wire                                    ap_start           ,
  output wire                                   ap_done            ,
  output wire                                   ap_idle            , 
  output wire                                   ap_ready           ,  
  // Scalar Parameters
  input  wire [63:0]                            input_size     ,
  input  wire [63:0]                            input_addr     ,
  input  wire [63:0]                            output_size_addr    ,
  input  wire [63:0]                            output_addr    
);

  //////////////////////////////////////
  // Input Argument Reg
  //////////////////////////////////////    
  reg [63:0]  input_size_r;
  reg [63:0]  input_addr_r;
  reg [63:0]  output_size_addr_r;
  reg [63:0]  output_addr_r;

  //////////////////////////////////////
  // Memory Port Reg
  //////////////////////////////////////
  reg          m00_read_start_r;
  reg          m00_read_ready_r;
  reg  [63:0]  m00_read_addr_r;
  reg  [63:0]  m00_read_size_r;
  reg          m00_write_start_r;
  reg  [63:0]  m00_write_addr_r;
  reg  [63:0]  m00_write_size_r;
  reg          m00_write_valid_r;
  
  //////////////////////////////////////
  // Memory Port Wire
  //////////////////////////////////////
  logic            m00_read_valid;
  logic            m00_read_ready;
  logic [63:0]     m00_read_data;
  logic            m00_read_last;
  logic            m00_read_done;
  logic            m00_write_valid;
  logic            m00_write_ready;
  logic [63:0]     m00_write_data;
  logic            m00_write_last;
  logic            m00_write_done;

  //////////////////////////////////////
  // rBUS driver to config cceip
  //////////////////////////////////////
  reg    rbus_start_r;
  wire   rbus_done;
  
  wire  [19:0]  rbus_driver_to_cceip_apb_paddr;
  wire          rbus_driver_to_cceip_apb_psel;
  wire          rbus_driver_to_cceip_apb_penable;
  wire          rbus_driver_to_cceip_apb_pwrite;
  wire  [31:0]  rbus_driver_to_cceip_apb_pwdata;  
  wire  [31:0]  rbus_driver_to_cceip_apb_prdata;
  wire          rbus_driver_to_cceip_apb_pready;                      
  wire          rbus_driver_to_cceip_apb_pslverr;

  cceip_rbus_driver inst_rbus_driver (
      .ap_clk(ap_clk),  //  input     wire ap_clk,
      .areset(areset),  //  input     wire areset,

      .rbus_start(rbus_start_r), //  input     wire rbus_start,
      .rbus_done(rbus_done),     //  output    wire rbus_done,

      .m_apb_paddr(rbus_driver_to_cceip_apb_paddr),//  output  wire  [19:0]  m_apb_paddr,
      .m_apb_psel(rbus_driver_to_cceip_apb_psel),//  output  wire  m_apb_psel,
      .m_apb_penable(rbus_driver_to_cceip_apb_penable),//  output  wire  m_apb_penable,
      .m_apb_pwrite(rbus_driver_to_cceip_apb_pwrite),//  output  wire  m_apb_pwrite,
      .m_apb_pwdata(rbus_driver_to_cceip_apb_pwdata),//  output  wire [31:0]  m_apb_pwdata,  
      .m_apb_prdata(rbus_driver_to_cceip_apb_prdata),//  input  wire  [31:0]  m_apb_prdata,
      .m_apb_pready(rbus_driver_to_cceip_apb_pready),//  input  wire  m_apb_pready,                      
      .m_apb_pslverr(rbus_driver_to_cceip_apb_pslverr)//  input  wire  m_apb_pslverr
  );
  

  //////////////////////////////////////
  // State Machine
  //////////////////////////////////////

   enum reg [4:0] {s_idle,
                     s_cceip_reset, // 对cceip进行reset
                     s_cceip_rbus_config, // 对 cceip 进行 config
                     s_wait_cceip_rbus_config, // 等待 cceip config 完成
                     s_launch_read_config,
                     s_launch_read,
                     s_launch_read_done, // m00 发起读事务
                     s_write_data_trans_config,
                     s_write_data_trans,
                     s_write_data, 
                     s_write_data_snap,
                     s_write_data_padd,
                     s_wait_write_data_done, // 等待 cceip 输出全部写入mem
                     s_launch_write_size_config, 
                     s_launch_write_size,
                     s_launch_write_size_done,
                     s_waiting_write_size_done, // m00 发起
                     s_done} state;

   assign ap_ready = state == s_idle;
   assign ap_idle = state == s_idle;
   assign ap_done = state == s_done;

   always @(posedge ap_clk)
      if (areset) begin
         state <= s_idle;
         m00_read_start_r <= 0;
         m00_write_start_r <= 0;
      end
      else
         case (state)
            s_idle : begin
               if (ap_start) begin
                  input_addr_r <= input_addr;
                  input_size_r <= input_size;
                  output_size_addr_r <= output_size_addr;
                  output_addr_r <= output_addr;
                  state <= s_cceip_reset;
               end
            end
            s_cceip_reset : begin
               // 1. 对 cceip 进行 reset
               state <= s_cceip_rbus_config;
            end
            s_cceip_rbus_config : begin
               
            end
            
            s_launch_read_config : begin
               m00_read_addr_r <= input_addr_r;
               m00_read_size_r <= input_size_r;
               state <= s_launch_read;
            end
            s_launch_read : begin
               m00_read_start_r <= 1'b1;
               state <= s_launch_read_done;
            end
            s_launch_read_done : begin
               m00_read_start_r <= 1'b0;
               state <= s_launch_write_size_config;
            end
            s_launch_write_size_config : begin
               m00_write_addr_r <= output_size_addr_r;
               m00_write_size_r <= 64'd8;
               state <= s_launch_write_size;
            end
            s_launch_write_size : begin
               m00_write_start_r <= 1'b1;
               state <= s_launch_write_size_done;
            end
            s_launch_write_size_done : begin
               m00_write_start_r <= 1'b0;
               if(m00_write_ready) begin
                 state <= s_waiting_write_size_done;
               end
            end
            s_waiting_write_size_done: begin
               if(m00_write_done) begin
                  //state <= s_launch_write_data_config;
               end
            end
            // s_launch_write_data_config : begin
            //    m00_write_addr_r <= output_addr_r;
            //    m00_write_size_r <= input_size_r;
            //    state <= s_launch_write_data;
            // end
            // s_launch_write_data : begin
            //    m00_write_start_r <= 1'b1;
            //    state <= s_launch_write_data_done;
            // end
            // s_launch_write_data_done : begin
            //    m00_write_start_r <= 1'b0;
            //    if(m00_write_done) begin
            //       state <= s_done;
            //    end
            // end
            s_done : begin
               // 产生一个周期有效的 s_done
               state <= s_idle;
            end
         endcase
        
        
        
           
   // AXI4 Read Master, output format is an AXI4-Stream master, one stream per thread.
    cceip_kernel_example_axi_read_master #(
      .C_M_AXI_ADDR_WIDTH  ( C_M00_AXI_ADDR_WIDTH    ) ,
      .C_M_AXI_DATA_WIDTH  ( C_M00_AXI_DATA_WIDTH    ) ,
      .C_XFER_SIZE_WIDTH   ( C_XFER_SIZE_WIDTH     ) ,
      .C_MAX_OUTSTANDING   ( 32                     ) ,
      .C_INCLUDE_DATA_FIFO ( 1                     )
    )
    inst_axi_read_master (
      .aclk                    ( ap_clk                    ) ,
      .areset                  ( areset                  ) ,
      .ctrl_start              ( m00_read_start_r        ) ,
      .ctrl_done               ( m00_read_done           ) ,
      .ctrl_addr_offset        ( m00_read_addr_r         ) ,
      .ctrl_xfer_size_in_bytes ( m00_read_size_r         ) ,
      .m_axi_arvalid           ( m00_axi_arvalid           ) ,
      .m_axi_arready           ( m00_axi_arready           ) ,
      .m_axi_araddr            ( m00_axi_araddr            ) ,
      .m_axi_arlen             ( m00_axi_arlen             ) ,
      .m_axi_rvalid            ( m00_axi_rvalid            ) ,
      .m_axi_rready            ( m00_axi_rready            ) ,
      .m_axi_rdata             ( m00_axi_rdata             ) ,
      .m_axi_rlast             ( m00_axi_rlast             ) ,
      .m_axis_aclk             ( ap_clk              ) ,
      .m_axis_areset           ( areset              ) ,
      .m_axis_tvalid           ( m00_read_valid          ) ,
      .m_axis_tready           ( m00_read_ready          ) ,
      .m_axis_tlast            ( m00_read_last           ) ,
      .m_axis_tdata            ( m00_read_data           )
    );
    
    // AXI4 Write Master
    cceip_kernel_example_axi_write_master #(
      .C_M_AXI_ADDR_WIDTH  ( C_M00_AXI_ADDR_WIDTH    ) ,
      .C_M_AXI_DATA_WIDTH  ( C_M00_AXI_DATA_WIDTH    ) ,
      .C_XFER_SIZE_WIDTH   ( C_XFER_SIZE_WIDTH     ) ,
      .C_MAX_OUTSTANDING   ( 32                     ) ,
      .C_INCLUDE_DATA_FIFO ( 1                     )
    )
    inst_axi_write_master (
      .aclk                    ( ap_clk                    ) ,
      .areset                  ( areset                  ) ,
      .ctrl_start              ( m00_write_start_r                ) ,
      .ctrl_done               ( m00_write_done          ) ,
      .ctrl_addr_offset        ( m00_write_addr_r        ) ,
      .ctrl_xfer_size_in_bytes ( m00_write_size_r        ) ,
      .m_axi_awvalid           ( m00_axi_awvalid           ) ,
      .m_axi_awready           ( m00_axi_awready           ) ,
      .m_axi_awaddr            ( m00_axi_awaddr            ) ,
      .m_axi_awlen             ( m00_axi_awlen             ) ,
      .m_axi_wvalid            ( m00_axi_wvalid            ) ,
      .m_axi_wready            ( m00_axi_wready            ) ,
      .m_axi_wdata             ( m00_axi_wdata             ) ,
      .m_axi_wstrb             ( m00_axi_wstrb             ) ,
      .m_axi_wlast             ( m00_axi_wlast             ) ,
      .m_axi_bvalid            ( m00_axi_bvalid            ) ,
      .m_axi_bready            ( m00_axi_bready            ) ,
      .s_axis_aclk             ( ap_clk              ) ,
      .s_axis_areset           ( areset              ) ,
      .s_axis_tvalid           ( m00_write_valid         ) ,
      .s_axis_tready           ( m00_write_ready         ) ,
      .s_axis_tdata            ( m00_write_data          )
    );
    
    
    
endmodule