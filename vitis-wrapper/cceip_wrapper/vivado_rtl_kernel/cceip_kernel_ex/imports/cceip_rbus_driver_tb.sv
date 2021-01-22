`default_nettype none
`timescale 1 ps / 1 ps

module cceip_rbus_driver_tb ();

parameter integer LP_CLK_PERIOD_PS = 4000; // 250 MHz
logic ap_clk = 0;
logic ap_reset_n = 1;
logic rbus_start = 0;
logic m_apb_pready = 1;
logic m_apb_pslverr = 0;

initial begin: AP_CLK
  forever begin
    ap_clk = #(LP_CLK_PERIOD_PS/2) ~ap_clk;
  end
end

initial begin
    @(posedge ap_clk);
    ap_reset_n = 0;
    repeat(20) @(posedge ap_clk);
    ap_reset_n = 1;
    #1ps;
    @(posedge ap_clk);
    rbus_start = 1;
end

cceip_rbus_driver dut (
    .ap_clk(ap_clk),
    .areset(!ap_reset_n),
    .rbus_start(rbus_start),
    .m_apb_pready(m_apb_pready),
    .m_apb_pslverr(m_apb_pslverr)
);

endmodule