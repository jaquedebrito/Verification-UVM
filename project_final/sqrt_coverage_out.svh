class sqrt_coverage_out extends bvm_cover #(sqrt_transaction);
    `uvm_component_utils(sqrt_coverage_out)

    covergroup transaction_covergroup;
        option.per_instance = 1;
        option.comment = "Cobertura para transações de saída do SQRT";

        // Cobertura da raiz quadrada (saída)
        cp_root: coverpoint coverage_transaction.root {
            option.comment = "Cobertura dos valores da raiz";
            bins zero = {0};                // Caso especial
            bins pequenos = {[1:7]};        // Raízes pequenas
            bins medios = {[8:15]};         // Raízes médias
            bins grandes = {[16:31]};       // Raízes grandes
            option.at_least = 3;
        }

        // Cobertura do resto
        cp_rem: coverpoint coverage_transaction.rem {
            option.comment = "Cobertura dos valores do resto";
            bins zero = {0};                // Quadrados perfeitos
            bins pequenos = {[1:7]};        // Restos pequenos
            bins medios = {[8:15]};         // Restos médios
            bins grandes = {[16:31]};       // Restos grandes
            option.at_least = 3;
        }

        // Cruzamentos
        cross_root_rem: cross cp_root, cp_rem {
            option.comment = "Cruzamento raiz x resto";
            // Casos especiais de interesse
            bins quadrados_perfeitos = binsof(cp_rem.zero);
            bins resto_maximo = binsof(cp_rem.grandes);
        }
    endgroup

    `bvm_cover_utils(sqrt_transaction)

endclass