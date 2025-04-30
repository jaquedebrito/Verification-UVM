class sqrt_env extends uvm_env;
    `uvm_component_utils(sqrt_env)
    
    sqrt_agent agent_in_h;
    sqrt_agent agent_out_h;
    sqrt_coverage_in coverage_in_h;
    sqrt_coverage_out coverage_out_h;
    uvm_tlm_analysis_fifo #(sqrt_transaction) agent_refmod;
    sqrt_refmod refmod_h;
    bvm_comparator #(sqrt_transaction) comparator_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
   
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        set_config_int("agent_in_h", "is_active", UVM_ACTIVE);
        agent_in_h = sqrt_agent::type_id::create("agent_in_h", this);
        set_config_int("agent_out_h", "is_active", UVM_PASSIVE);
        agent_out_h = sqrt_agent::type_id::create("agent_out_h", this);
        coverage_in_h = sqrt_coverage_in::type_id::create("coverage_in_h", this);
        coverage_out_h = sqrt_coverage_out::type_id::create("coverage_out_h", this);
        agent_refmod = new("agent_refmod", this);
        refmod_h = sqrt_refmod::type_id::create("refmod_h", this);
        comparator_h = bvm_comparator#(sqrt_transaction)::type_id::create("comparator_h", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        agent_in_h.out.connect(coverage_in_h.analysis_export);
        agent_in_h.out.connect(agent_refmod.analysis_export);
        refmod_h.in.connect(agent_refmod.get_export);
        refmod_h.out.connect(comparator_h.from_refmod);
        agent_out_h.out.connect(comparator_h.from_dut);
        agent_out_h.out.connect(coverage_out_h.analysis_export);
    endfunction
   
endclass