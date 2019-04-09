vlib SQRT

vlog -reportprogress 300 -work SQRT VV/Verification.sv
vcom -reportprogress 300 -work SQRT RTL/sqrt.vhd

##################################### VHDL TB
# vcom -reportprogress 300 -work SQRT TB/tb_sqrt.vhd
#####################################

##################################### SV TB
vlog -reportprogress 300 -work SQRT TB/tb_sqrt.sv
#####################################