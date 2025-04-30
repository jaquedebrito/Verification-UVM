class sqrt_coverage_in extends bvm_cover #(sqrt_transaction);
    `uvm_component_utils(sqrt_coverage_in)

    covergroup transaction_covergroup;
        option.per_instance = 1;
        option.comment = "Cobertura para transações de entrada do SQRT";

        // Cobertura do radicando (entrada)
        cp_rad: coverpoint coverage_transaction.rad {
            option.comment = "Cobertura dos valores do radicando";
            bins zero = {0};                     // Caso especial: raiz de 0
            bins pequenos = {[1:15]};            // Números pequenos
            bins medios = {[16:99]};             // Números médios
            bins grandes = {[100:255]};          // Números grandes
            bins quadrados_perfeitos = {1,4,9,16,25,36,49,64,81,100,121,144,169,196,225}; 
            illegal_bins invalidos = {[256:$]};  // Valores inválidos para WIDTH=8
            option.at_least = 3;
            option.weight = 2;
        }

        // Cobertura dos sinais de controle
        cp_start: coverpoint coverage_transaction.start {
            bins start_trans = (0 => 1);
            bins start_idle = (1 => 0);
        }

        cp_busy: coverpoint coverage_transaction.busy {
            bins busy_ativo = (0 => 1);
            bins busy_inativo = (1 => 0);
        }

        cp_valid: coverpoint coverage_transaction.valid {
            bins valid_ativo = (0 => 1);
            bins valid_inativo = (1 => 0);
        }

        // Cruzamentos
        cross_start_busy: cross cp_start, cp_busy {
            option.comment = "Cruzamento start x busy";
        }
        cross_busy_valid: cross cp_busy, cp_valid {
            option.comment = "Cruzamento busy x valid";
        }
        cross_rad_ctrl: cross cp_rad, cp_start, cp_busy {
            option.comment = "Cruzamento rad x controles";
        }
    endgroup

    `bvm_cover_utils(sqrt_transaction)

endclass