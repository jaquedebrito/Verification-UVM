interface sqrt_if (input logic clk);
    
    logic start;         // handshake signal to start calculation
    logic busy;         // indicates calculation in progress
    logic valid;        // indicates result is valid
    logic [7:0] rad;    // input radicand
    logic [7:0] root;   // output root
    logic [7:0] rem;    // output remainder

    // Modport for input signals (driver side)
    modport inp (
        input  clk,
        output start,
        output rad,
        input  busy,
        input  valid,
        input  root,
        input  rem
    );

    // Modport for output signals (monitor side)
    modport outp (
        input  clk,
        input  start,
        input  rad,
        output busy,
        output valid,
        output root,
        output rem
    );

endinterface