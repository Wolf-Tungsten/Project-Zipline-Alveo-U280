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
    
  reg  input_size_r;
  reg  input_addr_r;
  reg  output_size_addr_r;
  reg  output_addr_r;

  reg          m00_read_start_r;
  reg          m00_read_ready_r;
  reg  [63:0]  m00_read_addr_r;
  reg  [63:0]  m00_read_size_r;
  reg          m00_write_start_r;
  reg  [63:0]  m00_write_addr_r;
  reg  [63:0]  m00_write_size_r;
  reg          m00_write_valid_r;
  
  logic         m00_read_valid;
  logic         m00_read_ready;
  logic         m00_read_data;
  logic         m00_read_last;
  logic         m00_read_done;
  logic         m00_write_valid;
  logic         m00_write_ready;
  logic         m00_write_data;
  logic         m00_write_last;
  logic         m00_write_done;
  
// The following contains SystemVerilog constructs and should not be used if using a tool that does not support this standard

   enum reg [3:0] {s_idle = 4'b0000,
                     s_launch_read_config = 4'b0001,
                     s_launch_read = 4'b0010,
                     s_launch_read_done = 4'b0011,
                     s_launch_write_size_config = 4'b0100,
                     s_launch_write_size = 4'b0101,
                     s_launch_write_size_done = 4'b0110,
                     s_launch_write_data_config = 4'b0111,
                     s_launch_write_data = 4'b1000,
                     s_launch_write_data_done = 4'b1001,
                     s_done= 4'b1010} state;

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
                  state <= s_launch_read;
               end
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
               if(m00_write_done) begin
                 state <= s_launch_write_data_config;
               end
            end
            s_launch_write_data_config : begin
               m00_write_addr_r <= output_addr_r;
               m00_write_size_r <= input_size_r;
               state <= s_launch_write_data;
            end
            s_launch_write_data : begin
               m00_write_start_r <= 1'b1;
               state <= s_launch_write_data_done;
            end
            s_launch_write_data_done : begin
               m00_write_start_r <= 1'b0;
               if(m00_write_done) begin
                  state <= s_done;
               end
            end
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
      .C_MAX_OUTSTANDING   ( 1                     ) ,
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
      .m_axis_areset           ( !areset              ) ,
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
      .C_MAX_OUTSTANDING   ( 1                     ) ,
      .C_INCLUDE_DATA_FIFO ( 1                     )
    )
    inst_axi_write_master (
      .aclk                    ( ap_clk                    ) ,
      .areset                  ( areset                  ) ,
      .ctrl_start              ( ap_start                ) ,
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
      .s_axis_areset           ( !areset              ) ,
      .s_axis_tvalid           ( m00_write_valid         ) ,
      .s_axis_tready           ( m00_write_ready         ) ,
      .s_axis_tdata            ( m00_write_data          )
    );
    

    always_comb begin : m00_router
       m00_read_ready = 0;
       m00_write_valid = 0;
       m00_write_data = 0;
       m00_read_ready = 0;
       if(state == s_launch_write_size_done) begin
          m00_write_data = input_size;
          m00_write_valid = 1;
          m00_write_last = 1;
       end else if (state == s_launch_write_data_done) begin
          m00_write_data = m00_read_data;
          m00_write_valid = m00_read_valid;
          m00_write_last = m00_read_last;
          m00_read_ready = m00_write_ready;
       end
    end
    
    
endmodule