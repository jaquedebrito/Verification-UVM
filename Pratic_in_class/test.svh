class test extends uvm_test;  
   `uvm_component_utils(test)

   env env_h;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_h = env::type_id::create("env_JaquelineB", this);
  endfunction

  task run_phase(uvm_phase phase);
    a_sequence seq;
    seq = a_sequence::type_id::create("sequencer_h_JaqueB");
    seq.start(env_h.agent_h_Jaqueline.sequencer_h_JaqueB);
  endtask


endclass
