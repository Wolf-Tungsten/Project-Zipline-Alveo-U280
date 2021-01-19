

set RTL_ROOT ../../rtl
set OUTPUT_DIR ./out

open_checkpoint $OUTPUT_DIR/slim_post_synth.dcp -part xcu280-fsvh2892-2L-e

opt_design
place_design
write_checkpoint -force $outputDir/slim_post_place.dcp
report_utilization -file $outputDir/slim_post_place_util.rpt
report_timing_summary -file $outputDir/slim_post_place_timing_summary.rpt