// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XCCEIP_KERNEL_H
#define XCCEIP_KERNEL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xcceip_kernel_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XCceip_kernel_Config;
#endif

typedef struct {
    u32 Control_BaseAddress;
    u32 IsReady;
} XCceip_kernel;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XCceip_kernel_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XCceip_kernel_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XCceip_kernel_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XCceip_kernel_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XCceip_kernel_Initialize(XCceip_kernel *InstancePtr, u16 DeviceId);
XCceip_kernel_Config* XCceip_kernel_LookupConfig(u16 DeviceId);
int XCceip_kernel_CfgInitialize(XCceip_kernel *InstancePtr, XCceip_kernel_Config *ConfigPtr);
#else
int XCceip_kernel_Initialize(XCceip_kernel *InstancePtr, const char* InstanceName);
int XCceip_kernel_Release(XCceip_kernel *InstancePtr);
#endif

void XCceip_kernel_Start(XCceip_kernel *InstancePtr);
u32 XCceip_kernel_IsDone(XCceip_kernel *InstancePtr);
u32 XCceip_kernel_IsIdle(XCceip_kernel *InstancePtr);
u32 XCceip_kernel_IsReady(XCceip_kernel *InstancePtr);
void XCceip_kernel_EnableAutoRestart(XCceip_kernel *InstancePtr);
void XCceip_kernel_DisableAutoRestart(XCceip_kernel *InstancePtr);

void XCceip_kernel_Set_input_size(XCceip_kernel *InstancePtr, u64 Data);
u64 XCceip_kernel_Get_input_size(XCceip_kernel *InstancePtr);
void XCceip_kernel_Set_input_addr(XCceip_kernel *InstancePtr, u64 Data);
u64 XCceip_kernel_Get_input_addr(XCceip_kernel *InstancePtr);
void XCceip_kernel_Set_output_size_addr(XCceip_kernel *InstancePtr, u64 Data);
u64 XCceip_kernel_Get_output_size_addr(XCceip_kernel *InstancePtr);
void XCceip_kernel_Set_output_addr(XCceip_kernel *InstancePtr, u64 Data);
u64 XCceip_kernel_Get_output_addr(XCceip_kernel *InstancePtr);

void XCceip_kernel_InterruptGlobalEnable(XCceip_kernel *InstancePtr);
void XCceip_kernel_InterruptGlobalDisable(XCceip_kernel *InstancePtr);
void XCceip_kernel_InterruptEnable(XCceip_kernel *InstancePtr, u32 Mask);
void XCceip_kernel_InterruptDisable(XCceip_kernel *InstancePtr, u32 Mask);
void XCceip_kernel_InterruptClear(XCceip_kernel *InstancePtr, u32 Mask);
u32 XCceip_kernel_InterruptGetEnabled(XCceip_kernel *InstancePtr);
u32 XCceip_kernel_InterruptGetStatus(XCceip_kernel *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
