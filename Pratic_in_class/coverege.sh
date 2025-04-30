#gedit *.sv & 
echo  "============================================================================================================"
echo  "============================================================================================================"

#irun -access +r -uvm +uvm_set_config_int="*",recording_detail,1 -coverage all -covoverwrite -DSYSTEM_CLOCK_UNITS_PER_SECOND=100 ../bvm/system_clock.c +incdir+../bvm ../bvm/*.sv *.sv +UVM_VERBOSITY=LOW
#irun -access +r -uvm +uvm_set_config_int="*",recording_detail,1 -coverage all -covoverwrite -DSYSTEM_CLOCK_UNITS_PER_SECOND=100 ../bvm/system_clock.c +incdir+bvm bvm/*.sv *.sv +UVM_VERBOSITY=LOW
#irun -access +r -uvm +uvm_set_config_int="*",recording_detail,1 +incdir+../bvm ../bvm/*.sv  *.sv +UVM_VERBOSITY=LOW

#irun -access +r -uvm +uvm_set_config_int="*",recording_detail,1 +define+BVM_ASSERT_BEGIN_TR=void\' ./bvm/system_clock.c +incdir+./bvm ./bvm/*.sv *.sv +UVM_VERBOSITY=LOW

# gcc -shared -fPIC -o bvm/system_clock.so bvm/system_clock.c

#irun -access +r -uvm +uvm_set_config_int="*",recording_detail,1 -coverage all -covoverwrite -DSYSTEM_CLOCK_UNITS_PER_SECOND=100 ../bvm/system_clock.c +incdir+../bvm ../bvm/*.sv *.sv +UVM_VERBOSITY=LOW


cobertura
irun -access +r -uvm +uvm_set_config_int="*",recording_detail,1 -coverage all -covoverwrite -DSYSTEM_CLOCK_UNITS_PER_SECOND=100 ./bvm/system_clock.c +incdir+./bvm ./bvm/*.sv *.sv +UVM_VERBOSITY=LOW

simvision  -NOCOPYRIGHT -input simvision.svcf

imc -load cov_work/scope/test
