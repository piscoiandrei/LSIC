`timescale 1ms / 1ns

module counter_tb;
  reg clk_t;
  reg rst_t;
  wire [9:0] seconds_t;
  wire tick_t;

  counter counter_i (
      .clk(clk_t),
      .rst(rst_t),
      .seconds(seconds_t),
      .tick(tick_t)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    rst_t = 0;
    #0.0001 rst_t = 1; // 100ns delay
    #0.0002 rst_t = 0; // 200ns delay
    #5_000 $finish(0); // 5s
  end

  initial begin
    clk_t = 0;
    forever begin
      #0.0002 clk_t = ~clk_t;
    end
  end
  
endmodule
