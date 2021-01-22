-makelib ies_lib/xilinx_vip -sv \
  "/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xpm -sv \
  "/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
  "/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "/nvme0n1/Applications/Xilinx2020.1/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/lib_pkg_v1_0_2 \
  "../../../ipstatic/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/axi_apb_bridge_v3_0_16 \
  "../../../ipstatic/hdl/axi_apb_bridge_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../cceip_kernel_ex.srcs/sources_1/ip/axi_apb_bridge_0/sim/axi_apb_bridge_0.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

