onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib control_cceip_kernel_vip_opt

do {wave.do}

view wave
view structure
view signals

do {control_cceip_kernel_vip.udo}

run -all

quit -force
