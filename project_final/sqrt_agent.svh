class sqrt_agent extends uvm_agent;
    `uvm_component_utils(sqrt_agent)
    
    // Componentes do agente
    sqrt_driver driver_h;
    sqrt_monitor monitor_h;
    uvm_sequencer #(sqrt_transaction) sequencer_h;
    
    // Porta de análise
    uvm_analysis_port #(sqrt_transaction) out;
    
    function new(string name = "sqrt_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        out = new("Saida", this);
        sequencer_h = uvm_sequencer#(sqrt_transaction)::type_id::create("sequencer_h", this);
        driver_h = sqrt_driver::type_id::create("driver_h", this);
        monitor_h = sqrt_monitor::type_id::create("monitor_h", this);
    endfunction
    
    function void connect_phase(uvm_phase phase);
        monitor_h.out.connect(out);
        driver_h.seq_item_port.connect(sequencer_h.seq_item_export);
    endfunction

endclass