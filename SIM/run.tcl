do compile.tcl

##################################### VHDL TB
# vsim -novopt SQRT.tb_sqrt
# add wave -position insertpoint sim:/tb_sqrt/*
#####################################

##################################### SV TB
vsim -novopt SQRT.tb_sqrt_svl
add wave -position insertpoint sim:/tb_sqrt_svl/*
#####################################

run 450 ns
vdel -all -lib SQRT