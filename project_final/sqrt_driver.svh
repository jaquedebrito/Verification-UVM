class sqrt_driver extends uvm_driver #(sqrt_transaction);
    `uvm_component_utils(sqrt_driver)
    
    virtual sqrt_if vif;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual sqrt_if)::get(this, "", "vif", vif))
            `uvm_fatal("SQRT_DRV", "Virtual interface not found")
    endfunction
    
    // Inicialização dos sinais no início
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        // Inicializa sinais de entrada
        vif.start <= 0;
        vif.rad <= 0;
    endfunction
    
    task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(req);
            
            // Espera um ciclo antes de começar
            @(posedge vif.clk);
            
            // Envia o radicando e ativa start
            vif.rad <= req.rad;
            vif.start <= 1;
            
            // Mantém start por um ciclo
            @(posedge vif.clk);
            vif.start <= 0;
            
            // Espera ficar ocupado (busy)
            wait(vif.busy);
            
            // Espera o resultado ficar pronto (valid)
            wait(vif.valid);
            
            // Espera um ciclo adicional para estabilização
            @(posedge vif.clk);
            
            seq_item_port.item_done();
        end
    endtask
endclass