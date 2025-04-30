class source extends uvm_component;
   `uvm_component_utils (source)

   // creating a put_port which will accept a "j_jb" type of data
   uvm_blocking_put_port #(j_jb) out;

   function new (string name = "source by Jaqueline_Brito", uvm_component parent);
      super.new (name, parent);
      out = new ("Saída", this);
   endfunction

   task run_phase (uvm_phase phase);
      j_jb  tr;

      phase.raise_objection(this); // avoid simulation to finish immediately

      // Trocando as 10 transações do professor por 6 transações que vão ser enviadas via put_port
      repeat (6) begin
         #60;                        // Espera 60ns
         tr = j_jb::type_id::create("Jaque_tr", this); // Aqui esta a alteração de NEW para CREATE, referente a fabrica UVM
         assert(tr.randomize ());
         `bvm_begin_tr(tr)          // start transaction recording
         `uvm_info ("SOURCE", "Sending transaction by Jaqueline_Brito", UVM_LOW)
         out.put (tr);              // send transaction to put_port
      end

      #220;                          // allow for some downstream processing time
      phase.drop_objection(this);   // allow simulation to finish
   endtask
endclass

