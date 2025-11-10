# Resumo dos Projetos - Verification UVM

Este repositório contém projetos práticos de verificação de sistemas digitais utilizando a metodologia UVM (Universal Verification Methodology) desenvolvidos como parte do curso de Sistemas Digitais Avançados da UFCG.

## 📁 Estrutura do Repositório

O repositório está organizado em dois projetos principais:

### 1. **Pratic_in_class** - Projeto de Prática em Aula

**Descrição**: Implementação de um somador simples com testbench UVM completo.

**Design Under Test (DUT)**: 
- Módulo que adiciona o valor constante 250 ao dado de entrada
- Interface baseada em handshake com sinais `valid`, `clock` e `reset`
- Entrada/Saída: valor de 8 bits (`j`)

**Componentes UVM Implementados**:
- `agent.svh` - Agente UVM para controle dos componentes
- `driver.svh` - Driver mestre para enviar transações ao DUT
- `monitor.svh` - Monitor para observar sinais do DUT
- `sequence.svh` - Sequências de teste (classe `a_sequence`)
- `env.svh` - Ambiente de verificação
- `test.svh` - Casos de teste
- `trans.svh` - Classe de transação (`j_jb`)
- `refmod.svh` - Modelo de referência
- `source.svh`, `sink.svh`, `drain.svh` - Componentes de análise
- `analysis_source.svh` - Componente de análise
- `coverage_in.svh` - Cobertura funcional

**Arquivos de Suporte**:
- `interface.sv` - Interface modular (`j_if`) com modports inp/outp
- `top.sv` - Módulo top-level do testbench
- `test_pkg.sv` - Pacote com todas as classes de teste
- `wave.do`, `cover.do` - Scripts para visualização e cobertura
- Relatórios UVM (1-5) em formato PDF documentando o progresso

**Objetivo Pedagógico**: Introdução aos conceitos básicos de UVM com um design simples, permitindo focar na estrutura do testbench e metodologia de verificação.

---

### 2. **project_final** - Projeto Final: Calculadora de Raiz Quadrada

**Descrição**: Implementação completa de uma calculadora de raiz quadrada com testbench UVM robusto.

**Design Under Test (DUT)**:
- Módulo `sqrt` que calcula raiz quadrada e resto
- Algoritmo iterativo com controle de estados
- Parâmetros configuráveis: `WIDTH=8` (largura), `FBITS=0` (bits fracionários)
- Sinais de controle: `start`, `busy`, `valid`
- Entradas/Saídas:
  - `rad` [7:0] - radicando (valor de entrada)
  - `root` [7:0] - raiz quadrada
  - `rem` [7:0] - resto da operação

**Componentes UVM Implementados**:
- `sqrt_agent.svh` - Agente UVM
- `sqrt_driver.svh` - Driver para estímulos
- `sqrt_monitor.svh` - Monitor de sinais
- `sqrt_sequence.svh` - Sequências de teste
- `sqrt_env.svh` - Ambiente de verificação
- `sqrt_test.svh` - Casos de teste
- `sqrt_transaction.svh` - Classe de transação
- `sqrt_refmod.svh` - Modelo de referência (golden model)
- `sqrt_coverage_in.svh` - Cobertura de entrada
- `sqrt_coverage_out.svh` - Cobertura de saída

**Arquivos de Suporte**:
- `sqrt_if.sv` - Interface com modports para driver e monitor
- `sqrt_tb.sv` - Testbench standalone (opcional)
- `top.sv` - Módulo top-level do ambiente UVM
- `sqrt_test_pkg.sv` - Pacote de teste
- `wave.do`, `coverage.sh` - Scripts de simulação e análise

**Características Avançadas**:
- Controle de estados (busy/valid/start)
- Verificação de temporização
- Cobertura funcional de entradas e saídas
- Modelo de referência para comparação
- Análise de corner cases

**Objetivo Pedagógico**: Aplicação completa da metodologia UVM em um design mais complexo, incluindo controle de estados, verificação de algoritmos iterativos e análise de cobertura abrangente.

---

## 🎯 Metodologia Aplicada

Ambos os projetos seguem a estrutura padrão UVM:

```
uvm_test
  └── uvm_env
       ├── uvm_agent
       │    ├── uvm_sequencer
       │    ├── uvm_driver
       │    └── uvm_monitor
       ├── uvm_scoreboard
       ├── reference_model
       └── coverage_collectors
```

### Elementos Comuns:

1. **Separação de Responsabilidades**: Driver (estímulos), Monitor (observação), Scoreboard (verificação)
2. **Reusabilidade**: Componentes modulares e parametrizáveis
3. **Interface Modular**: Uso de modports para separação clara de direção de sinais
4. **Cobertura Funcional**: Classes dedicadas para análise de cobertura
5. **Modelo de Referência**: Golden model para verificação automática
6. **Automação**: Scripts para simulação e análise de resultados

## 📊 Comparação dos Projetos

| Aspecto | Pratic_in_class | project_final |
|---------|-----------------|---------------|
| **Complexidade do DUT** | Baixa (somador) | Alta (calculadora iterativa) |
| **Controle de Estados** | Mínimo (valid) | Completo (start/busy/valid) |
| **Largura de Dados** | 8 bits | Parametrizável (padrão 8 bits) |
| **Ciclos por Operação** | 1 | Múltiplos (iterativo) |
| **Cobertura** | Entrada apenas | Entrada e Saída |
| **Documentação** | 5 relatórios PDF | Scripts e código |
| **Aplicação** | Didática básica | Projeto completo |

## 🚀 Como Usar

### Pratic_in_class
```bash
cd Pratic_in_class
# Executar simulação com seu simulador preferido (QuestaSim, VCS, etc.)
vsim -do wave.do
# Para cobertura
vsim -do cover.do
```

### project_final
```bash
cd project_final
# Executar simulação
vsim -do wave.do
# Análise de cobertura
./coverage.sh
```

## 📚 Aprendizado

Estes projetos demonstram:
- Progressão de conceitos simples para complexos
- Aplicação prática da metodologia UVM
- Estruturação de ambientes de verificação escaláveis
- Técnicas de cobertura funcional
- Desenvolvimento de modelos de referência
- Automação de verificação

## 👥 Autores

Desenvolvido como parte do curso **Verification - Advanced Digital Systems** oferecido pela UFCG (Universidade Federal de Campina Grande).

**Instrutores**:
- Prof. Marcos Ricardo Alcântara Morais – UAEE
- Prof. Joseana Macêdo Fechine Régis de Araújo – UASC
- Elmar Melcher – UASC

## 📖 Referências

- IEEE Std 1800.2 – UVM Standard Reference Manual
- Taraate, Vaibbhav. *SystemVerilog for Hardware Description*
- Mentor Graphics UVM Cookbook
- Doulos Training Resources

---

*Última atualização: 2025*
