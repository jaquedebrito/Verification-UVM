class sqrt_transaction extends uvm_sequence_item;
    `uvm_object_utils(sqrt_transaction)
    
    // Campos de entrada - usando os mesmos nomes do DUT
    rand bit [7:0] rad;     
    bit start;
    bit busy;
    bit valid;
    
    // Campos de saída - usando os mesmos nomes do DUT
    bit [7:0] root;
    bit [7:0] rem;         
    
    function new(string name = "sqrt_transaction");
        super.new(name);
    endfunction
    
    function void do_copy(uvm_object rhs);
        sqrt_transaction tr;
        if (!$cast(tr, rhs)) begin
            `uvm_error("SQRT_TR", "Cast failed in do_copy")
            return;
        end
        super.do_copy(rhs);
        rad = tr.rad;          
        start = tr.start;
        busy = tr.busy;
        valid = tr.valid;
        root = tr.root;
        rem = tr.rem;          
    endfunction
    
    function bit do_compare(uvm_object rhs, uvm_comparer comparer);
        sqrt_transaction tr;
        if (!$cast(tr, rhs)) return 0;
        return (super.do_compare(rhs, comparer) &&
                rad == tr.rad &&       
                start == tr.start &&
                busy == tr.busy &&
                valid == tr.valid &&
                root == tr.root &&
                rem == tr.rem);         
    endfunction
endclass