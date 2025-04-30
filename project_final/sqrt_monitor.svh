class sqrt_monitor extends uvm_monitor;
    `uvm_component_utils(sqrt_monitor)
    
    virtual sqrt_if vif;
    uvm_analysis_port #(sqrt_transaction) out;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
        out = new("out", this);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual sqrt_if)::get(this, "", "vif", vif))
            `uvm_fatal("SQRT_MON", "Virtual interface not found")
    endfunction
    
    task run_phase(uvm_phase phase);
        sqrt_transaction tr;
        forever begin
            @(posedge vif.clk);
            
            // Cria nova transação quando start é ativado
            if (vif.start) begin
                tr = sqrt_transaction::type_id::create("tr");
                tr.start = vif.start;
                tr.rad = vif.rad;
                tr.busy = vif.busy;
                tr.valid = vif.valid;
                tr.root = vif.root;
                tr.rem = vif.rem;
                
                // Espera até o resultado ficar pronto
                while (!vif.valid) begin
                    @(posedge vif.clk);
                    tr.busy = vif.busy;
                    tr.valid = vif.valid;
                    tr.root = vif.root;
                    tr.rem = vif.rem;
                end
                
                out.write(tr);
            end
            
            // Opcional: Monitorar mudanças de estado mesmo sem start
            else if (vif.busy || vif.valid) begin
                tr = sqrt_transaction::type_id::create("tr");
                tr.start = vif.start;
                tr.rad = vif.rad;
                tr.busy = vif.busy;
                tr.valid = vif.valid;
                tr.root = vif.root;
                tr.rem = vif.rem;
                out.write(tr);
            end
        end
    endtask
endclass