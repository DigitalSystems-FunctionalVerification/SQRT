do compile.tcl

##################################### VHDL TB
# vsim -novopt SQRT.tb_sqrt
# add wave -position insertpoint sim:/tb_sqrt/*
#####################################

##################################### SV TB
vsim -novopt SQRT.tb_sqrt_svl
add wave -position insertpoint sim:/tb_sqrt_svl/*
# add wave -position insertpoint  \
# sim:/tb_sqrt_svl/#ublk#149220460#24/driver
#####################################

run 3150 ns
vdel -all -lib SQRT