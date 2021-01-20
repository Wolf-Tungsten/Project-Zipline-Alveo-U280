// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xcceip_kernel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XCceip_kernel_CfgInitialize(XCceip_kernel *InstancePtr, XCceip_kernel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XCceip_kernel_Start(XCceip_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XCceip_kernel_IsDone(XCceip_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XCceip_kernel_IsIdle(XCceip_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XCceip_kernel_IsReady(XCceip_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XCceip_kernel_EnableAutoRestart(XCceip_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XCceip_kernel_DisableAutoRestart(XCceip_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_AP_CTRL, 0);
}

void XCceip_kernel_Set_input_size(XCceip_kernel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_INPUT_SIZE_DATA, (u32)(Data));
    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_INPUT_SIZE_DATA + 4, (u32)(Data >> 32));
}

u64 XCceip_kernel_Get_input_size(XCceip_kernel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_INPUT_SIZE_DATA);
    Data += (u64)XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_INPUT_SIZE_DATA + 4) << 32;
    return Data;
}

void XCceip_kernel_Set_input_addr(XCceip_kernel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_INPUT_ADDR_DATA, (u32)(Data));
    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_INPUT_ADDR_DATA + 4, (u32)(Data >> 32));
}

u64 XCceip_kernel_Get_input_addr(XCceip_kernel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_INPUT_ADDR_DATA);
    Data += (u64)XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_INPUT_ADDR_DATA + 4) << 32;
    return Data;
}

void XCceip_kernel_Set_output_size_addr(XCceip_kernel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_OUTPUT_SIZE_ADDR_DATA, (u32)(Data));
    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_OUTPUT_SIZE_ADDR_DATA + 4, (u32)(Data >> 32));
}

u64 XCceip_kernel_Get_output_size_addr(XCceip_kernel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_OUTPUT_SIZE_ADDR_DATA);
    Data += (u64)XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_OUTPUT_SIZE_ADDR_DATA + 4) << 32;
    return Data;
}

void XCceip_kernel_Set_output_addr(XCceip_kernel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_OUTPUT_ADDR_DATA, (u32)(Data));
    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_OUTPUT_ADDR_DATA + 4, (u32)(Data >> 32));
}

u64 XCceip_kernel_Get_output_addr(XCceip_kernel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_OUTPUT_ADDR_DATA);
    Data += (u64)XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_OUTPUT_ADDR_DATA + 4) << 32;
    return Data;
}

void XCceip_kernel_InterruptGlobalEnable(XCceip_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_GIE, 1);
}

void XCceip_kernel_InterruptGlobalDisable(XCceip_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_GIE, 0);
}

void XCceip_kernel_InterruptEnable(XCceip_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_IER);
    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_IER, Register | Mask);
}

void XCceip_kernel_InterruptDisable(XCceip_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_IER);
    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XCceip_kernel_InterruptClear(XCceip_kernel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCceip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_ISR, Mask);
}

u32 XCceip_kernel_InterruptGetEnabled(XCceip_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_IER);
}

u32 XCceip_kernel_InterruptGetStatus(XCceip_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCceip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCCEIP_KERNEL_CONTROL_ADDR_ISR);
}

