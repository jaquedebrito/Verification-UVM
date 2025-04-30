#!/bin/bash

# Comando exato como no modelo, mantendo a ordem dos arquivos
xrun -access +r \
    -uvm \
    +uvm_set_config_int="*",recording_detail,1 \
    -coverage all \
    -covoverwrite \
    -DSYSTEM_CLOCK_UNITS_PER_SECOND=100 \
    ./bvm/system_clock.c \
    +incdir+./bvm \
    ./bvm/bvm_pkg.sv \
    dut.sv \
    sqrt_if.sv \
    sqrt_test_pkg.sv \
    top.sv \
    +UVM_VERBOSITY=LOW

# Executa o SimVision com o arquivo de configuração
simvision -NOCOPYRIGHT -input simvision.svcf

# Carrega os resultados de cobertura
imc -load cov_work/scope/test
