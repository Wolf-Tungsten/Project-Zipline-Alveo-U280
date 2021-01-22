`default_nettype none
`timescale 1 ps / 1 ps

module cceip_inbound_tb ();

parameter integer LP_CLK_PERIOD_PS = 4000; // 250 MHz

logic ap_clk = 0;
logic ap_reset_n = 1;


initial begin: AP_CLK
  forever begin
    ap_clk = #(LP_CLK_PERIOD_PS/2) ~ap_clk;
  end
end

logic inbound_start = 0;
logic [63:0] input_data_size = 6;
logic [63:0] input_count = 0;
logic [63:0] input_data = 0;
logic input_ready;
logic input_valid = 0;

initial begin
    @(posedge ap_clk);
    ap_reset_n = 0;
    repeat(20) @(posedge ap_clk);
    ap_reset_n = 1;
    #1ps;
    @(posedge ap_clk);
    inbound_start = 1;
    while (input_count < input_data_size) begin
      @(posedge ap_clk);
        input_valid = 1;
        if(input_ready)begin
          input_data += 1;
          input_count += 8;
        end
    end
    input_valid = 0;
end



cceip_inbound dut(
  .ap_clk(ap_clk),
  .areset(!ap_reset_n),
  .inbound_start(inbound_start),
  .input_data_size(input_data_size),

  .mm_s_axis_tvalid(1),
  .mm_s_axis_tdata(input_data),
  .mm_s_axis_tready(input_ready),
  
  .cceip_m_axis_tready(1)
);

endmodule