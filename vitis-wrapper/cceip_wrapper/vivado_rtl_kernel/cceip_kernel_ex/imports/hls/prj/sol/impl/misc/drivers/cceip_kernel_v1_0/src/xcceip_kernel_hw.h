// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x10 : Data signal of input_size
//        bit 31~0 - input_size[31:0] (Read/Write)
// 0x14 : Data signal of input_size
//        bit 31~0 - input_size[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of input_addr
//        bit 31~0 - input_addr[31:0] (Read/Write)
// 0x20 : Data signal of input_addr
//        bit 31~0 - input_addr[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of output_size_addr
//        bit 31~0 - output_size_addr[31:0] (Read/Write)
// 0x2c : Data signal of output_size_addr
//        bit 31~0 - output_size_addr[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of output_addr
//        bit 31~0 - output_addr[31:0] (Read/Write)
// 0x38 : Data signal of output_addr
//        bit 31~0 - output_addr[63:32] (Read/Write)
// 0x3c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XCCEIP_KERNEL_CONTROL_ADDR_AP_CTRL               0x00
#define XCCEIP_KERNEL_CONTROL_ADDR_GIE                   0x04
#define XCCEIP_KERNEL_CONTROL_ADDR_IER                   0x08
#define XCCEIP_KERNEL_CONTROL_ADDR_ISR                   0x0c
#define XCCEIP_KERNEL_CONTROL_ADDR_INPUT_SIZE_DATA       0x10
#define XCCEIP_KERNEL_CONTROL_BITS_INPUT_SIZE_DATA       64
#define XCCEIP_KERNEL_CONTROL_ADDR_INPUT_ADDR_DATA       0x1c
#define XCCEIP_KERNEL_CONTROL_BITS_INPUT_ADDR_DATA       64
#define XCCEIP_KERNEL_CONTROL_ADDR_OUTPUT_SIZE_ADDR_DATA 0x28
#define XCCEIP_KERNEL_CONTROL_BITS_OUTPUT_SIZE_ADDR_DATA 64
#define XCCEIP_KERNEL_CONTROL_ADDR_OUTPUT_ADDR_DATA      0x34
#define XCCEIP_KERNEL_CONTROL_BITS_OUTPUT_ADDR_DATA      64

