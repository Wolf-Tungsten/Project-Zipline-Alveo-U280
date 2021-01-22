module cceip_inbound_prefix_rom (
    input   wire    [2:0]       prefix_pc,
    output  wire    [1:0]       prefix_tuser,
    output  wire    [63:0]      prefix_tdata
);

    wire    [63:0]      prefix_tdata_rom[8];
    wire    [1:0]       prefix_tuser_rom[8];

    assign prefix_tdata_rom[0] = 64'h400000000a000400; assign prefix_tuser_rom[0] = 2'h01;
    assign prefix_tdata_rom[1] = 64'h0000000000000000; assign prefix_tuser_rom[1] = 2'h02;
    assign prefix_tdata_rom[2] = 64'h800000000a000601; assign prefix_tuser_rom[2] = 2'h01;
    assign prefix_tdata_rom[3] = 64'h000000000780b000; assign prefix_tuser_rom[3] = 2'h00;
    assign prefix_tdata_rom[4] = 64'h3a00000000200d42; assign prefix_tuser_rom[4] = 2'h02;
    assign prefix_tdata_rom[5] = 64'hc00000000a00020b; assign prefix_tuser_rom[5] = 2'h03;
    assign prefix_tdata_rom[6] = 64'ha00000000a000005; assign prefix_tuser_rom[6] = 2'h01;

    assign prefix_tdata = prefix_tdata_rom[prefix_pc];
    assign prefix_tuser = prefix_tuser_rom[prefix_pc];

endmodule

module cceip_inbound_suffix_rom (
    input   wire    [2:0]       suffix_pc,
    output  wire    [1:0]       suffix_tuser,
    output  wire    [63:0]      suffix_tdata
);

    wire    [63:0]      suffix_tdata_rom[8];
    wire    [1:0]       suffix_tuser_rom[8];

    assign suffix_tdata_rom[0] = 64'h800000000a000409; assign suffix_tuser_rom[0] = 2'h01;
    assign suffix_tdata_rom[1] = 64'h0000000000000000; assign suffix_tuser_rom[1] = 2'h02;

    assign suffix_tdata = suffix_tdata_rom[suffix_pc];
    assign suffix_tuser = suffix_tuser_rom[suffix_pc];

endmodule

module cceip_inbound (
    input   wire                ap_clk,
    input   wire                areset,

    input   wire                inbound_start,
    output  wire                inbound_done,

    input   wire    [63:0]      input_data_size,

    input   wire                mm_s_axis_tvalid,
    output  wire                mm_s_axis_tready,
    input   wire                mm_s_axis_tlast,
    input   wire    [63:0]      mm_s_axis_tdata,

    output  logic               cceip_m_axis_tvalid,
    input   wire                cceip_m_axis_tready,
    output  wire                cceip_m_axis_tlast,
    output  wire    [7:0]       cceip_m_axis_tstrb,
    output  wire    [7:0]       cceip_m_axis_tuser,
    output  wire                cceip_m_axis_tid,
    output  wire    [63:0]      cceip_m_axis_tdata
);

    reg [2:0]   prefix_pc_r;
    reg [2:0]   suffix_pc_r;
    reg [63:0]  input_data_size_r;
    reg [63:0]  input_data_counter_r;
    
    reg                 cceip_m_axis_tvalid_r;
    reg                 cceip_m_axis_tlast_r;
    reg     [7:0]       cceip_m_axis_tstrb_r;
    reg     [7:0]       cceip_m_axis_tuser_r;
    reg     [63:0]      cceip_m_axis_tdata_r;

    wire    [1:0]  prefix_tuser;
    wire    [63:0] prefix_tdata;
    cceip_inbound_prefix_rom prefix_rom_inst (
        .prefix_pc(prefix_pc_r),
        .prefix_tdata(prefix_tdata),
        .prefix_tuser(prefix_tuser)
    );

    wire    [1:0]  suffix_tuser;
    wire    [63:0] suffix_tdata;
    cceip_inbound_suffix_rom suffix_rom_inst (
        .suffix_pc(suffix_pc_r),
        .suffix_tdata(suffix_tdata),
        .suffix_tuser(suffix_tuser)
    );



    enum reg [3:0] {
        s_idle,
        s_prefix,
        s_data,
        s_suffix,
        s_done
    } state;

    always @(posedge ap_clk) begin
        if(areset) begin
            state <= s_idle;
        end else begin
            case(state)
                s_idle : begin
                    if(inbound_start) begin
                        state <= s_prefix;
                        input_data_size_r <= input_data_size;
                        prefix_pc_r <= 0;
                        suffix_pc_r <= 0;
                        input_data_counter_r <= 0;
                    end
                end
                s_prefix : begin
                    cceip_m_axis_tvalid_r <= 1;
                    cceip_m_axis_tdata_r <= prefix_tdata;
                    cceip_m_axis_tuser_r <= {6'h0, prefix_tuser};
                    cceip_m_axis_tlast_r <= 0;
                    cceip_m_axis_tstrb_r <= 8'hff;
                    if(cceip_m_axis_tready) begin
                        if(suffix_pc_r == 3'h7) begin
                            cceip_m_axis_tvalid_r <= 0;
                            state <= s_data;
                        end else begin
                            prefix_pc_r += 1;
                        end
                    end
                end
                s_data : begin
                    cceip_m_axis_tuser_r <= 8'h0;
                    cceip_m_axis_tlast_r <= 0;
                    cceip_m_axis_tstrb_r <= 8'hff;
                    // 传输一个数据则 += 8
                    if(mm_s_axis_tvalid == 1 && cceip_m_axis_tready == 1) begin
                        input_data_counter_r += 8;
                    end
                    if(input_data_counter_r >= input_data_size_r) begin
                        cceip_m_axis_tuser_r <= 8'h2; // 最后8个字节要给出EoT
                        case (input_data_counter_r - input_data_size_r)
                            1 : begin
                                cceip_m_axis_tstrb_r <= 8'b0000_0001;
                            end
                            2 : begin
                                cceip_m_axis_tstrb_r <= 8'b0000_0011;
                            end
                            3 : begin
                                cceip_m_axis_tstrb_r <= 8'b0000_0111;
                            end
                            4 : begin
                                cceip_m_axis_tstrb_r <= 8'b0000_1111;
                            end
                            5 : begin
                                cceip_m_axis_tstrb_r <= 8'b0001_1111;
                            end
                            6 : begin
                                cceip_m_axis_tstrb_r <= 8'b0011_1111;
                            end
                            7 : begin
                                cceip_m_axis_tstrb_r <= 8'b0111_1111;
                            end
                            default : begin
                                cceip_m_axis_tstrb_r <= 8'b1111_1111;
                            end
                        endcase
                        state <= s_suffix;
                    end
                end
                s_suffix : begin
                    cceip_m_axis_tvalid_r <= 1;
                    cceip_m_axis_tdata_r <= suffix_tdata;
                    cceip_m_axis_tuser_r <= {6'h0, suffix_tuser};
                    cceip_m_axis_tlast_r <= 0;
                    cceip_m_axis_tstrb_r <= 8'hff;
                    if(cceip_m_axis_tready) begin
                        if(suffix_pc_r == 3'h1) begin
                            cceip_m_axis_tlast_r <= 1;
                        end else if(suffix_pc_r == 3'h2) begin
                            cceip_m_axis_tvalid_r <= 0;
                            state <= s_done;
                        end else begin
                            suffix_pc_r += 1;
                        end
                    end
                end
                s_done : begin
                    state <= s_idle;
                end
            endcase
        end
    end

    assign inbound_done = (state == s_done);

    // 处于s_data状态时，由 cceip 驱动 ready 进行流控
    assign mm_s_axis_tready = (state == s_data) && cceip_m_axis_tready;
    
    // cceip tvalid 逻辑
    always_comb begin : cceip_m_axis_tvalid_logic
        cceip_m_axis_tvalid = 0;
        if(state == s_suffix || state == s_prefix) begin
            cceip_m_axis_tvalid = cceip_m_axis_tvalid_r;
        end else if(state == s_data) begin
            cceip_m_axis_tvalid = mm_s_axis_tvalid;
        end
    end
    
    // cceip data 逻辑
    assign cceip_m_axis_tdata = (state == s_data) ? mm_s_axis_tdata : cceip_m_axis_tdata_r;

    assign cceip_m_axis_tlast = cceip_m_axis_tlast_r;
    assign cceip_m_axis_tstrb = cceip_m_axis_tstrb_r;
    assign cceip_m_axis_tuser = cceip_m_axis_tuser_r;
    assign cceip_m_axis_tid = 0;


endmodule

