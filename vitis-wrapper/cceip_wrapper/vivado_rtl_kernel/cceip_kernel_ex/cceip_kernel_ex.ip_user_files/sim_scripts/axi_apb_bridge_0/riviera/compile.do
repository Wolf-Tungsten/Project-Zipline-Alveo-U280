vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/lib_pkg_v1_0_2
vlib riviera/axi_apb_bridge_v3_0_16
vlib riviera/xil_defaultlib

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap axi_apb_bridge_v3_0_16 riviera/axi_apb_bridge_v3_0_16
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xilinx_vip  -sv2k12 "+incdir+/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/include" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../ipstatic/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work axi_apb_bridge_v3_0_16 -93 \
"../../../ipstatic/hdl/axi_apb_bridge_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../cceip_kernel_ex.srcs/sources_1/ip/axi_apb_bridge_0/sim/axi_apb_bridge_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

