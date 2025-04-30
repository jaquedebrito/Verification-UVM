// Importa o pacote UVM padrão (uvm_pkg) e o pacote de teste personalizado (test_pkg) que contém as classes de teste

// específicas do projeto.
module top;
  import uvm_pkg::*;
  import test_pkg::*;


  // Cria um sinal de clock com período de 10 unidades de tempo (5 unidades por semiciclo).
  // Essencial para sincronização de operações no ambiente de verificação e no DUT.

  // Clock generator
  logic clock;
  initial begin
   clock = 0;
   forever #30 clock = ~clock;
  end

  // Inicializa o sistema com reset ativo (1)
  // Depois de dois ciclos de clock, desativa o reset (0)
  // Garante que o DUT comece em um estado conhecido e estável

  // reset generator
  logic reset;
  initial begin
   reset = 1;
   repeat(2) @(negedge clock);
   reset = 0;
  end

  
  // Cria duas instâncias da interface j_if: uma para sinais de entrada (in) e outra para saída (out)
  // Instancia o DUT usando o operador de conexão implícita .* que conecta sinais com nomes correspondentes
  // O DUT é o circuito que será testado pelo ambiente de verificação

  // input and output interface instance for DUT
  j_if in(.*);
  j_if out(.*);
  dut d(.*); // circuito que vai ser testado


  // Configura gravação de formas de onda para diferentes simuladores (INCA, VCS, QUESTA)
  // Registra a interface de entrada virtual no banco de dados de configuração UVM
  // A string longa especifica o caminho hierárquico onde a interface estará disponível
  // Componentes nesse caminho podem recuperar a interface usando get()
  // Executa o teste UVM chamado "test" através da função run_test()

  initial begin
    // vendor dependent waveform recording
    `ifdef INCA
      $shm_open("waves.shm");
      $shm_probe("AS");
    `endif
    `ifdef VCS
      $vcdpluson;
    `endif
    `ifdef QUESTA
      $wlfdumpvars();
    `endif

    // register the input interface instance in the database
    uvm_config_db #(virtual j_if)::set(null, "uvm_test_top.env_JaquelineB.agent_h_Jaqueline.*", "j_vi", in);

    run_test("test");
  end
endmodule

