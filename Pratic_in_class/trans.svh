class j_jb extends uvm_sequence_item;
    
    rand int j;

    constraint a_positive { j > 0; }
    constraint a_small { j < 40; }

    `uvm_object_utils_begin(j_jb) // Necessário para gravar a trasanção
        `uvm_field_int(j, UVM_ALL_ON | UVM_DEC)
    `uvm_object_utils_end  
    
endclass

