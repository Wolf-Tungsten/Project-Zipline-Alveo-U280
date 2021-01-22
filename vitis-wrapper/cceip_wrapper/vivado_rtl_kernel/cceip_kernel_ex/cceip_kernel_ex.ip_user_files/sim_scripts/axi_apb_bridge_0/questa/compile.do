vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/axi_apb_bridge_v3_0_16
vlib questa_lib/msim/xil_defaultlib

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap axi_apb_bridge_v3_0_16 questa_lib/msim/axi_apb_bridge_v3_0_16
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xilinx_vip -64 -sv -L axi_vip_v1_1_7 -L xilinx_vip "+incdir+/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -sv -L axi_vip_v1_1_7 -L xilinx_vip "+incdir+/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../ipstatic/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work axi_apb_bridge_v3_0_16 -64 -93 \
"../../../ipstatic/hdl/axi_apb_bridge_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../cceip_kernel_ex.srcs/sources_1/ip/axi_apb_bridge_0/sim/axi_apb_bridge_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

