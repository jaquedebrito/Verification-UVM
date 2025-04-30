class sink extends uvm_component;
    `uvm_component_utils(sink)
    
    uvm_blocking_put_imp #(j_jb, sink) in;
    
    function new(string name = "sink", uvm_component parent);
        super.new(name, parent);
        in = new("Entrada", this);
    endfunction
    
    task put(j_jb tr);
        // Aqui  nós recebemos as transações de source
        `uvm_info("SINK", "Receiving transaction by Jaqueline_Brito", UVM_LOW)
        #30; // Espera a transação por 30ns para ser completa
        `bvm_end_tr(tr)
    endtask
endclass

