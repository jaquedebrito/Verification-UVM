class sqrt_test extends uvm_test;
    `uvm_component_utils(sqrt_test)

    // Componentes
    sqrt_env env_h;
    int unsigned num_transactions = 1000;
    time test_start_time;
    time test_end_time;

    // Construtor
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    // Fase de construção
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        // Configuração do número de transações
        if (uvm_config_db#(int)::get(this, "", "num_transactions", num_transactions)) begin
            if (num_transactions < 100) begin
                `uvm_warning("SQRT_TEST", $sformatf("num_transactions=%0d is too low, setting to 1000", num_transactions))
                num_transactions = 1000;
            end
        end

        // Criação do ambiente
        env_h = sqrt_env::type_id::create("env_h", this);
        
        // Configurações adicionais de debug
        uvm_config_db#(uvm_bitstream_t)::set(this, "*", "recording_detail", UVM_FULL);
    endfunction

    // Fase de end_of_elaboration
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        
        // Imprime a hierarquia do testbench
        if (get_report_verbosity_level() >= UVM_LOW) begin
            `uvm_info(get_type_name(), "Testbench Hierarchy:", UVM_LOW)
            print();
        end
    endfunction

    // Fase principal
    task run_phase(uvm_phase phase);
        sqrt_sequence seq;
        
        phase.raise_objection(this);
        test_start_time = $time;

        // Cria e configura a sequência
        seq = sqrt_sequence::type_id::create("seq");
        seq.set_transaction_count(num_transactions);
        
        // Inicia a sequência com tratamento de erro
        fork
            begin
                seq.start(env_h.agent_in_h.sequencer_h);
            end
            begin
                // Timeout de segurança
                #(1ms);
                `uvm_fatal("SQRT_TEST", "Test timeout after 1ms")
            end
        join_any
        disable fork;
        
        test_end_time = $time;
        phase.drop_objection(this);
    endtask

    // Fase de relatório
    function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        
        // Relatório simplificado
        `uvm_info(get_type_name(), $sformatf(
            "\n=== SQRT Test Report ===\n" ,
            "Test Start Time: %0t\n" ,
            "Test End Time: %0t\n" ,
            "Test Duration: %0t\n" ,
            "Total Transactions: %0d\n" ,
            "Average Time per Transaction: %0t\n",
            test_start_time,
            test_end_time,
            test_end_time - test_start_time,
            num_transactions,
            (test_end_time - test_start_time)/num_transactions
        ), UVM_LOW)
    endfunction

endclass