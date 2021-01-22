module cceip_rbus_driver (
    input     wire ap_clk,
    input     wire areset,

    input     wire rbus_start,
    output    wire rbus_done,

    output  wire  [19:0]  m_apb_paddr,
    output  wire  m_apb_psel,
    output  wire  m_apb_penable,
    output  wire  m_apb_pwrite,
    output  wire [31:0]  m_apb_pwdata,  
    input  wire  [31:0]  m_apb_prdata,
    input  wire  m_apb_pready,                      
    input  wire  m_apb_pslverr

);

reg     [19:0]      s_axi_awaddr_r;
reg                 s_axi_awvalid_r;
wire                s_axi_awready;
reg     [31:0]      s_axi_wdata_r;
reg                 s_axi_wvalid_r; 
wire                s_axi_wready; 
wire    [1:0]       s_axi_bresp; 
wire                s_axi_bvalid;
reg                 s_axi_bready_r;

enum reg [3:0] { s_idle, s_awaddr, s_wdata, s_bready, s_done } state;


always @(posedge ap_clk) begin
    if(areset) begin
        state <= s_idle;
        s_axi_awaddr_r <= 0;
        s_axi_awvalid_r <= 0;
        s_axi_wdata_r <= 0;
        s_axi_wvalid_r <= 0;
        s_axi_bready_r <= 0;
    end else begin
        case(state)
            s_idle : begin
                if(rbus_start) begin
                    state <= s_awaddr;
                    s_axi_awaddr_r <= 0; // 向0地址写0
                    s_axi_awvalid_r <= 0; // valid 为 0
                end
            end
            s_awaddr : begin
                s_axi_awvalid_r <= 1;
                if(s_axi_awready) begin
                    state <= s_wdata;
                    s_axi_awvalid_r <= 0;
                end
            end
            s_wdata : begin
                s_axi_wdata_r <= 32'hce640000;
                s_axi_wvalid_r <= 1;
                if(s_axi_wready) begin
                    state <= s_bready;
                    s_axi_wvalid_r <= 0;
                end
            end
            s_bready : begin
                s_axi_bready_r <= 1;
                if(s_axi_bvalid && s_axi_bresp == 00) begin
                    state <= s_done;
                    s_axi_bready_r <= 0;
                end
            end
            s_done : begin
                state <= s_idle;
            end
        endcase
    end
end

assign rbus_done = (state == s_done);

axi_apb_bridge_0 apb_actor_inst (
  .s_axi_aclk(ap_clk),        // input wire s_axi_aclk
  .s_axi_aresetn(!areset),  // input wire s_axi_aresetn
  .s_axi_awaddr(s_axi_awaddr_r),    // input wire [19 : 0] s_axi_awaddr
  .s_axi_awvalid(s_axi_awvalid_r),  // input wire s_axi_awvalid
  .s_axi_awready(s_axi_awready),  // output wire s_axi_awready
  .s_axi_wdata(s_axi_wdata_r),      // input wire [31 : 0] s_axi_wdata
  .s_axi_wvalid(s_axi_wvalid_r),    // input wire s_axi_wvalid
  .s_axi_wready(s_axi_wready),    // output wire s_axi_wready
  .s_axi_bresp(s_axi_bresp),      // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid(s_axi_bvalid),    // output wire s_axi_bvalid
  .s_axi_bready(s_axi_bready_r),    // input wire s_axi_bready
  .s_axi_araddr(20'b0),    // input wire [19 : 0] s_axi_araddr
  .s_axi_arvalid(1'b0),  // input wire s_axi_arvalid
  .s_axi_arready(),  // output wire s_axi_arready
  .s_axi_rdata(),      // output wire [31 : 0] s_axi_rdata
  .s_axi_rresp(),      // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid(),    // output wire s_axi_rvalid
  .s_axi_rready(1'b0),    // input wire s_axi_rready
  .m_apb_paddr(m_apb_paddr),      // output wire [19 : 0] m_apb_paddr
  .m_apb_psel(m_apb_psel),        // output wire [0 : 0] m_apb_psel
  .m_apb_penable(m_apb_penable),  // output wire m_apb_penable
  .m_apb_pwrite(m_apb_pwrite),    // output wire m_apb_pwrite
  .m_apb_pwdata(m_apb_pwdata),    // output wire [31 : 0] m_apb_pwdata
  .m_apb_pready(m_apb_pready),    // input wire [0 : 0] m_apb_pready
  .m_apb_prdata(m_apb_prdata),    // input wire [31 : 0] m_apb_prdata
  .m_apb_pslverr(m_apb_pslverr)  // input wire [0 : 0] m_apb_pslverr
);

endmodule