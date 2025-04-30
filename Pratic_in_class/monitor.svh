class monitor extends uvm_monitor;  
   `uvm_component_utils(monitor)

   uvm_analysis_port #(j_jb) out;
    
   virtual j_if j_vi; 

   function new(string name, uvm_component parent);
      super.new(name, parent);
      out = new("Saida", this);
   endfunction: new
    
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      assert( uvm_config_db #(virtual j_if)::get(this, "", "j_vi", j_vi) );
   endfunction
   
   task run_phase(uvm_phase phase);
      j_jb tr;
      forever begin
         wait (j_vi.reset === 0);
         tr = j_jb::type_id::create("tr");

         @(posedge j_vi.clock iff (j_vi.valid)); // at next rising clock which has valid set
         `bvm_begin_tr(tr) // start transaction recording
         tr.j = j_vi.j; // get transaction property value       
         out.write(tr);  
         
      end
   endtask

endclass

