class env extends uvm_env;
   `uvm_component_utils(env)
    
      agent agent_h_Jaqueline;
      coverage_in coverage_in_Jaqueline;
      uvm_tlm_analysis_fifo #(j_jb) agent_refmod;
      refmod refmod_jaqueline;
      sink sink_jaqueline;

      function new(string name, uvm_component parent);
        super.new(name, parent);
      endfunction
      
      function void build_phase(uvm_phase phase);
         super.build_phase(phase);
         agent_h_Jaqueline = agent::type_id::create("agent_h_Jaqueline", this);
         coverage_in_Jaqueline = coverage_in::type_id::create("coverage_in_Jaqueline", this);
         agent_refmod = new("agent_refmod",this);
         refmod_jaqueline = refmod::type_id::create("refmod_jaqueline", this);
         sink_jaqueline = sink::type_id::create("sink_jaqueline", this);
      endfunction

      function void connect_phase(uvm_phase phase);
         agent_h_Jaqueline.out.connect (coverage_in_Jaqueline.analysis_export);
         agent_h_Jaqueline.out.connect (agent_refmod.analysis_export);
         refmod_jaqueline.in.connect (agent_refmod.get_export );
         refmod_jaqueline.out.connect( sink_jaqueline.in );
      endfunction
   
endclass

