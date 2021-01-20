// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xcceip_kernel.h"

extern XCceip_kernel_Config XCceip_kernel_ConfigTable[];

XCceip_kernel_Config *XCceip_kernel_LookupConfig(u16 DeviceId) {
	XCceip_kernel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XCCEIP_KERNEL_NUM_INSTANCES; Index++) {
		if (XCceip_kernel_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XCceip_kernel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XCceip_kernel_Initialize(XCceip_kernel *InstancePtr, u16 DeviceId) {
	XCceip_kernel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XCceip_kernel_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XCceip_kernel_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

