class refmod extends uvm_component;
   `uvm_component_utils(refmod)

   uvm_get_port #(j_jb) in;            // Solicitar nova trasanção, que pode ser conectada na saida de uma FIFO
   uvm_blocking_put_port #(j_jb) out;   

   function new(string name, uvm_component parent=null);
      super.new(name,parent);
      in  = new("Entrada",  this);
      out = new("Saída", this);
   endfunction : new

   task run_phase (uvm_phase phase);

     j_jb tr_in, tr_out; // variaveis para transações que entram e saem

     forever begin

      // laço infinito
        in.get(tr_in); // requisição da transação, se tiver disponivel, vai retornar tr_in

        #60;
        `bvm_end_tr(tr_in); // Aqui é marcado finalização da trasanção

        tr_out = j_jb::type_id::create("Jaque_out", this);
        tr_out.j = tr_in.j + 250; // alterando 100 para 250
        `bvm_begin_tr(tr_out)
        #60;
        out.put(tr_out); // Envia a trasanção para o modelo de referencia
     end

   endtask

endclass

