#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Sat Jan 23 16:05:30 CST 2021
# SW Build 2902540 on Wed May 27 19:54:35 MDT 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto 1222baf57c4a44ecab2a4c4b620792b5 --incr --debug typical --relax --mt 8 -L axi_infrastructure_v1_1_0 -L xil_defaultlib -L axi_vip_v1_1_7 -L lib_pkg_v1_0_2 -L axi_apb_bridge_v3_0_16 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot cceip_kernel_tb_behav xil_defaultlib.cceip_kernel_tb xil_defaultlib.glbl -log elaborate.log"
xelab -wto 1222baf57c4a44ecab2a4c4b620792b5 --incr --debug typical --relax --mt 8 -L axi_infrastructure_v1_1_0 -L xil_defaultlib -L axi_vip_v1_1_7 -L lib_pkg_v1_0_2 -L axi_apb_bridge_v3_0_16 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot cceip_kernel_tb_behav xil_defaultlib.cceip_kernel_tb xil_defaultlib.glbl -log elaborate.log

