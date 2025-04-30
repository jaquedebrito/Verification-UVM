class sqrt_sequence extends uvm_sequence #(sqrt_transaction);
    `uvm_object_utils(sqrt_sequence)
    
    // Contador de transações
    int transaction_count = 1000;

    function new(string name = "sqrt_sequence");
        super.new(name);
    endfunction

    // Permite configurar o número de transações
    function void set_transaction_count(int count);
        transaction_count = count;
    endfunction

    task body();
        sqrt_transaction tr;

        `uvm_info("SQRT_SEQ", 
                 $sformatf("Starting sequence at %0t", $time), 
                 UVM_MEDIUM)

        repeat(transaction_count) begin
            tr = sqrt_transaction::type_id::create("tr");
            
            start_item(tr);
            
            if (!tr.randomize() with { 
                rad inside {[0:255]};  // Range válido para WIDTH=8
                start == 1;           // Sempre ativo para simplificar
            }) begin
                `uvm_error("SQRT_SEQ", "Randomization failed")
            end

            finish_item(tr);
        end

        `uvm_info("SQRT_SEQ", 
                 $sformatf("Sequence completed at %0t", $time), 
                 UVM_MEDIUM)
    endtask
endclass