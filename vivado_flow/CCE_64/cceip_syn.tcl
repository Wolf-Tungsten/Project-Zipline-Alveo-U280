

set RTL_ROOT ../../rtl
set OUTPUT_DIR ./out

file mkdir $OUTPUT_DIR

set INCLUDE_PATH "$RTL_ROOT/common/include
$RTL_ROOT/cr_cceip_64
$RTL_ROOT/common/nx_library
$RTL_ROOT/common/axi
$RTL_ROOT/cr_isf
$RTL_ROOT/cr_osf
$RTL_ROOT/cr_cg
$RTL_ROOT/cr_crcgc
$RTL_ROOT/cr_prefix
$RTL_ROOT/cr_prefix_attach
$RTL_ROOT/cr_lz77_comp
$RTL_ROOT/cr_huf_comp
$RTL_ROOT/cr_xp10_decomp
$RTL_ROOT/cr_cceip_64_support
$RTL_ROOT/cr_cceip_64_sa
$RTL_ROOT/cr_su
$RTL_ROOT/mem_wrappers/bimc_master/top"

read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/cr_cceip_64/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/common/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/common/include/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/common/nx_library/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/common/cr_tlvp/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/common/cr_tlvp_apps/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/common/cr_crc/*.sv* ] 
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/common/axi/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/common/cr_adler/*.sv* ] 
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/common/cr_crc16t/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/common/fifo/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/cr_isf/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/cr_osf/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/cr_cg/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/cr_crcgc/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/cr_prefix/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/cr_prefix_attach/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/cr_huf_comp/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/cr_xp10_decomp/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/cr_cceip_64_support/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/cr_cceip_64_sa/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/cr_su/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/mem_wrappers/bimc_master/top/*.sv* ]
read_verilog -library CCEIP_LIB -sv -verbose [ glob $RTL_ROOT/cr_lz77_comp/*.sv* ]

synth_design -top cr_cceip_64 -part xcu280-fsvh2892-2L-e -include $INCLUDE_PATH \
-verilog_define ENA_BIMC -verilog_define SYNTHESIS

write_checkpoint -force $OUTPUT_DIR/post_synth.dcp

report_timing_summary -file $OUTPUT_DIR/post_synth_timing_summary.rpt

report_utilization -file $OUTPUT_DIR/post_synth_util.rpt