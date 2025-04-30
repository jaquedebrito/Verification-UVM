module dut (j_if.inp in,
            j_if.outp out);

  always_ff @(posedge in.clock)
     if (in.reset) begin
        out.valid <= 0;
        out.j <= 0;
     end
     else if(in.valid) begin
        out.valid <= 1;
        out.j <= in.j + 250;
     end
     else out.valid <= 0;

endmodule

