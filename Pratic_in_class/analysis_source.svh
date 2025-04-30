class analysis_source extends uvm_component;
   `uvm_component_utils (analysis_source)

   uvm_analysis_port #(j_jb) out;

   function new (string name = "source by Jaqueline_Brito", uvm_component parent);
     	super.new (name, parent);
     	out = new ("Saída", this);
   endfunction

   task run_phase (uvm_phase phase);
     	j_jb  tr;

     	forever begin
        	#15; // Espera algum tempo antes da transação começar
        	tr = j_jb::type_id::create("tr", this);
        	assert(tr.randomize ());
        	`bvm_begin_tr(tr)  
        	`uvm_info ("SOURCE", "Sending transaction by Aluna: Brito, Jaqueline", UVM_LOW)
        	out.write (tr);  // Envia transação para porta de análise
     	end

   endtask
endclass

