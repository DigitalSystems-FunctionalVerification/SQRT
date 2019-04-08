vlib SQRT

vlog -reportprogress 300 -work SQRT /home/darlan/Master/2019_1/VerificacaoFuncionalDeSistemasDigitais/SQRT/VV/Verification.sv
vcom -reportprogress 300 -work SQRT /home/darlan/Master/2019_1/VerificacaoFuncionalDeSistemasDigitais/SQRT/RTL/sqrt.vhd

##################################### VHDL TB
# vcom -reportprogress 300 -work SQRT /home/darlan/Master/2019_1/VerificacaoFuncionalDeSistemasDigitais/SQRT/TB/tb_sqrt.vhd
#####################################

##################################### SV TB
vlog -reportprogress 300 -work SQRT /home/darlan/Master/2019_1/VerificacaoFuncionalDeSistemasDigitais/SQRT/TB/tb_sqrt.sv
#####################################