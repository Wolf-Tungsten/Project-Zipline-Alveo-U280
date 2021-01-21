#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/nvme0n1/Applications/Xilinx2020.1/Vitis/2020.1/bin:/nvme0n1/Applications/Xilinx2020.1/Vitis/2020.1/bin:/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/bin
else
  PATH=/nvme0n1/Applications/Xilinx2020.1/Vitis/2020.1/bin:/nvme0n1/Applications/Xilinx2020.1/Vitis/2020.1/bin:/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/vitis-wrapper/cceip_wrapper/vivado_rtl_kernel/cceip_kernel_ex/cceip_kernel_ex.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log cceip_kernel.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source cceip_kernel.tcl
