#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/vitis-wrapper/cceip_wrapper/vivado_rtl_kernel/cceip_kernel_ex/imports/hls/prj/sol/.autopilot/db/a.g.bc ${1+"$@"}
