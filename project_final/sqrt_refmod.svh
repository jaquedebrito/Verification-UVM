class sqrt_refmod extends uvm_component;
    `uvm_component_utils(sqrt_refmod)

    // Portas TLM
    uvm_get_port #(sqrt_transaction) in;
    uvm_blocking_put_port #(sqrt_transaction) out;

    // Parâmetros
    localparam WIDTH = 8;
    localparam MAX_VALUE = (1 << WIDTH) - 1;

    // Estatísticas
    protected int num_calculations;
    protected int num_perfect_squares;
    protected int num_non_perfect;

    function new(string name = "sqrt_refmod", uvm_component parent = null);
        super.new(name, parent);
        in = new("in", this);
        out = new("out", this);
        num_calculations = 0;
        num_perfect_squares = 0;
        num_non_perfect = 0;
    endfunction

    task run_phase(uvm_phase phase);
        sqrt_transaction tr_in, tr_out;

        forever begin
            // Obtém transação de entrada
            in.get(tr_in);
            `bvm_end_tr(tr_in)    // Marca o fim da transação de entrada

            // Cria e configura transação de saída
            tr_out = sqrt_transaction::type_id::create("tr_out", this);
            tr_out.rad = tr_in.rad;
            tr_out.start = 1'b1;
            tr_out.busy = 1'b0;
            tr_out.valid = 1'b1;
            
            // Calcula resultado
            calculate_sqrt(tr_out.rad, tr_out.root, tr_out.rem);
            
            // Atualiza estatísticas
            num_calculations++;
            if(tr_out.rem == 0)
                num_perfect_squares++;
            else
                num_non_perfect++;

            // Marca início da transação de saída e envia
            `bvm_begin_tr(tr_out)
            out.put(tr_out);
        end
    endtask

    protected function void calculate_sqrt(
        input  logic [WIDTH-1:0] rad,
        output logic [WIDTH-1:0] root,
        output logic [WIDTH-1:0] rem
    );
        logic [WIDTH-1:0] temp_root;
        logic [(2*WIDTH)-1:0] temp_square;
        
        temp_root = '0;
        
        // Algoritmo de raiz quadrada
        for(int i = (WIDTH/2)-1; i >= 0; i--) begin
            logic [WIDTH-1:0] try_bit;
            try_bit = 1'b1 << i;
            
            temp_square = (temp_root | try_bit);
            temp_square = temp_square * temp_square;
            
            if(temp_square <= rad) begin
                temp_root = temp_root | try_bit;
            end
        end
        
        root = temp_root;
        rem = rad - (root * root);
    endfunction

    function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        `uvm_info(get_type_name(), 
                 $sformatf("\n=== Reference Model Statistics ===\n" ,
                          "Total Calculations: %0d\n" ,
                          "Perfect Squares: %0d\n" ,
                          "Non-Perfect Squares: %0d\n", 
                          num_calculations,
                          num_perfect_squares,
                          num_non_perfect), 
                 UVM_LOW)
    endfunction

endclass