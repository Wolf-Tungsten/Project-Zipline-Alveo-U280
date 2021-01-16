/*************************************************************************
*
* Copyright � Microsoft Corporation. All rights reserved.
* Copyright � Broadcom Inc. All rights reserved.
* Licensed under the MIT License.
*
*************************************************************************/


























module cr_crcgc_crc
  #(
     parameter POLYNOMIAL = 32'h82F63B78,  
     parameter N_CRC_WIDTH = 32,   
     parameter N_DATA_WIDTH = 64
   )  
  (
  
  crc,
  
  clk, rst_n, data_in, data_valid, data_vbytes, enable, init_value,
  init
  );
`include "ccx_std.vh"
  
  localparam N_VBYTES_WIDTH = N_DATA_WIDTH/8;
  
  
  
  
  input                              clk;
  input                              rst_n; 
 
  
  
  
  input logic [N_DATA_WIDTH-1:0]     data_in;
  input logic                        data_valid;
  input logic [N_VBYTES_WIDTH-1:0]   data_vbytes; 
                                       
  
  
  
  input logic                        enable;
  input logic [N_CRC_WIDTH-1:0]      init_value;
  input logic                        init;
                                    
  
  
  
  output logic [N_CRC_WIDTH-1:0]    crc;

  
  
  `CCX_STD_DECLARE_CRC(mycrc, POLYNOMIAL, N_CRC_WIDTH,N_DATA_WIDTH );
  
  
  logic [N_CRC_WIDTH-1:0]    crc_d;
  logic [N_CRC_WIDTH-1:0]    crc_r;
  logic [N_CRC_WIDTH-1:0]    crc_in;
  
  logic [N_VBYTES_WIDTH-1:0] data_vbits;
  
  
  
  
  
  always_comb begin
    if (enable) begin
      crc = crc_r;
    end
    else begin
      crc = {N_CRC_WIDTH{1'b0}};
    end
  end
  
  
  
  
  
  always_comb
    begin
      case (data_vbytes)
        8'b00000001 : data_vbits = 7'd8;
        8'b00000011 : data_vbits = 7'd16;
        8'b00000111 : data_vbits = 7'd24;
        8'b00001111 : data_vbits = 7'd32;
        8'b00011111 : data_vbits = 7'd40;
        8'b00111111 : data_vbits = 7'd48;
        8'b01111111 : data_vbits = 7'd52;
        8'b11111111 : data_vbits = 7'd64;
        default     : data_vbits = 7'd0;
      endcase 
    end 
  
  
  
  
  
  
  
  assign crc_d = mycrc(data_in,crc_in,data_vbits);
  assign crc_in = crc_r;
  

  
  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      crc_r <= {N_CRC_WIDTH{1'b0}};
    end
    else begin
      if (init) begin
        crc_r <= init_value;
      end
      else if (data_valid)  begin
      if (data_valid)  begin
        crc_r   <= crc_d;
      end
    end 
  end
  end // grh fix
        
endmodule 








