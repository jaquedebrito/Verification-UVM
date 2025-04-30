class drain extends uvm_component;
   `uvm_component_utils (drain)
   
   uvm_get_port #(j_jb) in; // porta de entrada que vai requisitar e receber novas transações;

   function new (string name = "drain_JAQUELINEB.", uvm_component parent = null);
      super.new (name, parent);
      in = new ("Entrada", this);
   endfunction
   
   task  run_phase (uvm_phase phase);
      j_jb tr;

      #60; 
      // laço infinito que so termina quando toda a simulaçao for encerrada
      forever begin
        #20; // alteração de 10 para 20
        in.get(tr); // get para solicitar uma nova trasanção, caso nao entregue um nova trasanção, ficará esperando, consumindo tempo de simulação, ate que a trasanção esteja disponivel
        `uvm_info("DRAIN, by Brito Jaqueline ", "Transaction received", UVM_LOW)
        #20; // alteração de 10 para 20
        `bvm_end_tr(tr);
      end

   endtask
   
endclass

