// Driver Master: Converte transações de alto nível em sinais para a interface
class driver_master extends uvm_driver #(j_jb);
  `uvm_component_utils(driver_master)  // Registro na fábrica UVM

  // Construtor padrão com nome e referência ao pai
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  // Interface virtual que será conectada à interface física
  virtual j_if j_vi;

  // Fase de construção: obtém a instância da interface do banco de dados UVM
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    assert( uvm_config_db #(virtual j_if)::get(this, "", "j_vi", j_vi) );  // Falha se interface não encontrada
  endfunction

  // Fase de execução: gerencia as tarefas principais do driver
  task run_phase(uvm_phase phase);
    // Inicializa sinais com valores indefinidos
    j_vi.valid <= 'x;
    j_vi.j  <= 'x;   
    
    fork
    reset_signals();  // Monitora e responde ao sinal de reset
    get_and_drive();  // Processa transações do sequencer
    join
  endtask

  // Gerencia os sinais durante o reset
  task reset_signals();
    forever begin
    wait (j_vi.reset === 1);        // Espera reset ativo
    j_vi.valid <= 0;                // Desativa valid
    j_vi.j  <= 'x;                  // Coloca dados em estado indefinido
    @(negedge j_vi.reset);          // Espera fim do reset
    end
  endtask

  // Obtém transações do sequencer e as converte em sinais para o DUT
  task get_and_drive();
    j_jb tr_sequencer;  // Transação recebida do sequencer

    forever begin
    wait (j_vi.reset === 0);                // Aguarda reset inativo
    seq_item_port.get_next_item(tr_sequencer); // Obtém próxima transação

    // Aplica os sinais na interface no próximo ciclo de clock
    @(posedge j_vi.clock);
    j_vi.valid <= 1;                // Ativa sinal valid
    j_vi.j <= tr_sequencer.j;       // Aplica valor da transação

    seq_item_port.item_done();      // Notifica conclusão da transação

    @(posedge j_vi.clock);
    j_vi.valid <= 0;                // Desativa valid por um ciclo
    @(posedge j_vi.clock);          // Espera mais um ciclo antes da próxima transação
    end
  endtask
endclass

