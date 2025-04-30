class coverage_in extends bvm_cover #(j_jb);
   `uvm_component_utils(coverage_in)

   covergroup transaction_covergroup;
     	option.per_instance = 1;
     	coverpoint coverage_transaction.j {
       	bins d[4] = {[0:9], [10:19], [20:29], [30:39]};  // 4 bins para intervalos de 10 unidades
       	option.at_least = 4;  // Pelo menos 4 ocorrências em cada bin
     	}
   endgroup
   `bvm_cover_utils(j_jb)
endclass

