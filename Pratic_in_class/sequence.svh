class a_sequence extends uvm_sequence #(j_jb);
  `uvm_object_utils(a_sequence)

  function new (string name = "a_sequence");
    super.new(name);
  endfunction: new

  task body;
    j_jb tr;

    forever begin
      `uvm_do(tr)
    end  
  endtask

endclass