onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib axi_apb_bridge_0_opt

do {wave.do}

view wave
view structure
view signals

do {axi_apb_bridge_0.udo}

run -all

quit -force
