class agent extends uvm_agent;
  `uvm_component_utils(agent)
    
   uvm_analysis_port #(j_jb) out;
    
   sequencer sequencer_h_JaqueB;
   driver_master driver_h_JaqueB;
   monitor monitor_h_JaqueB;

   function new(string name, uvm_component parent);
     super.new(name, parent);
   endfunction

   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     out = new("Saida", this);
     sequencer_h_JaqueB = sequencer::type_id::create("sequencer_h_JaqueB", this);
     driver_h_JaqueB = driver_master::type_id::create("driver_h_JaqueB", this);
     monitor_h_JaqueB = monitor::type_id::create("monitor_h_JaqueB", this);
   endfunction

   function void connect_phase(uvm_phase phase);
     monitor_h_JaqueB.out.connect (out);
     driver_h_JaqueB.seq_item_port.connect( sequencer_h_JaqueB.seq_item_export );
   endfunction
    
endclass

