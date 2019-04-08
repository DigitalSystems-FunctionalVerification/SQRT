do compile.do
vsim -novopt SQRT.tb_sqrt
add wave -position insertpoint sim:/tb_sqrt/*
run 450 ns