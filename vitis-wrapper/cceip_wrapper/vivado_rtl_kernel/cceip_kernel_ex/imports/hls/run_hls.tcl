# This is a generated file. Use and modify at your own risk.
################################################################################

open_project prj
open_solution sol
set_part  xcu280-fsvh2892-2L-e
add_files ../cceip_kernel_cmodel.cpp
set_top cceip_kernel
config_sdx -optimization_level none -target xocc
config_rtl -auto_prefix=0
csynth_design
exit

