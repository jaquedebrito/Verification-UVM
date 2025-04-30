module top;
    import uvm_pkg::*;
    import sqrt_test_pkg::*;

    // Clock generator
    logic clk;
    initial begin
        clk = 0;
        forever #30 clk = ~clk;
    end

    // Interfaces
    sqrt_if sqrt_vi_in(clk);
    sqrt_if sqrt_vi_out(clk);

    // DUT com conexões explícitas
    sqrt #(
        .WIDTH(8),    // Largura do radicando conforme especificação
        .FBITS(0)     // Sem bits fracionários
    ) dut (
        .clk(clk),
        // Sinais da interface de entrada
        .start(sqrt_vi_in.start),
        .rad(sqrt_vi_in.rad),
        // Sinais da interface de saída
        .busy(sqrt_vi_out.busy),
        .valid(sqrt_vi_out.valid),
        .root(sqrt_vi_out.root),
        .rem(sqrt_vi_out.rem)
    );

    initial begin
        // Recording configuration
        void'(uvm_config_db#(int)::set(null, "*", "recording_detail", UVM_FULL));
        
        // Interface configuration
        uvm_config_db#(virtual sqrt_if)::set(null, "uvm_test_top.env_h.agent_in_h.*", "vif", sqrt_vi_in);
        uvm_config_db#(virtual sqrt_if)::set(null, "uvm_test_top.env_h.agent_out_h.*", "vif", sqrt_vi_out);

        // Wave dumping
        $shm_open("waves.shm");
        $shm_probe("ACTF");

        run_test("sqrt_test");
    end
endmodule