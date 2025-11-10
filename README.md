# Verification – Advanced Digital Systems Course

> **📄 [Resumo dos Projetos em Português](RESUMO_PROJETOS.md)** - Descrição detalhada de todos os projetos deste repositório

## 📘 Course Overview

**Verification** is an advanced course focused on verifying digital hardware designs using professional methodologies and tools. The course emphasizes a structured and scalable verification process, highlighting industry standards such as **SystemVerilog** and the **Universal Verification Methodology (UVM)**.

## 🎯 Course Objectives

- Master functional verification of complex digital systems.
- Understand and apply the UVM architecture and testbench components.
- Build reusable, scalable, and maintainable verification environments.
- Develop critical thinking for debugging and coverage analysis.

## 🧠 Topics Covered

- Structured Verification Process
- SystemVerilog Testbenches
- Randomization Techniques
- Functional Coverage
- UVM Testbench Architecture
- Agents, Drivers, Monitors, Scoreboards
- Analysis FIFOs and Reference Models
- Dual Agent Systems and DUT Integration
- Coverage-Driven Verification
- Advanced Debugging and Simulation Tools

## 🧰 UVM Methodology

UVM is used to provide a **common language and structure** across verification projects. It enables:

- **Known structures**: predictable architecture
- **Reusable components**: standard interfaces, agents, drivers
- **Scalability**: independently built and integrated modules
- **Productivity**: easier understanding and maintainability

UVM is the convergence of efforts from Cadence, Mentor, and Synopsys to unify verification methodologies.

## 🔧 UVM Testbench Structure

The course includes the development of a complete UVM testbench, with components such as:

- `uvm_test`, `uvm_env`, `uvm_agent`, `uvm_sequence`, `uvm_driver`, `uvm_monitor`
- `uvm_scoreboard`, `uvm_analysis_fifo`, reference models, and comparators
- Interface-based DUT connection
- Transaction-level modeling
- Functional coverage analysis

## 🧪 Methodological Approach

- **Plan – Develop – Execute – Analyze**
- Emphasis on **coverage, reusability**, and **randomized testing**
- Encouragement of **modular design and verification**

## 👨‍🏫 Course Instructors

- Prof. **Marcos Ricardo Alcântara Morais** – UAEE
- Prof. **Joseana Macêdo Fechine Régis de Araújo** – UASC
- **Elmar Melcher** – UASC  
Course offered through **CEEI – UFCG**

## 📚 Reference Material

### Core Material
- Taraate, Vaibbhav. *SystemVerilog for Hardware Description: RTL Design and Verification*, Springer 2020.
- IEEE Std 1800.2 – *UVM Standard Reference Manual*

### Supplementary
- Mentor Graphics UVM Cookbook
- Doulos Training Resources
- Cadence/Verification Academy materials

## 📂 Repository Projects

This repository contains two main verification projects:

### 1. **Pratic_in_class** - Basic Adder with UVM
- Simple adder design (adds 250 to input value)
- Complete UVM testbench with all standard components
- 5 detailed progress reports (PDF format)
- Ideal for learning UVM fundamentals

### 2. **project_final** - Square Root Calculator
- Iterative square root algorithm implementation
- Full UVM verification environment
- Input and output functional coverage
- Advanced state machine verification

**📄 For detailed project descriptions, see [RESUMO_PROJETOS.md](RESUMO_PROJETOS.md) (in Portuguese)**

## 🚀 Getting Started

1. Clone the repository
2. Set up the simulator (e.g., QuestaSim, VCS)
3. Navigate to a project directory (`Pratic_in_class` or `project_final`)
4. Run simulation using `vsim -do wave.do` or your preferred command
5. Analyze waveform and coverage reports

## 👩‍💼 Target Audience

This course is intended for upper-level undergraduate or graduate students in Electrical or Computer Engineering, and professionals interested in formal and functional hardware verification using UVM.

## 📬 Contact

For collaboration or questions, feel free to reach out via GitHub Issues or through institutional channels.

