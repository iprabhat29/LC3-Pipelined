module clock_module(output bit clock);
  initial forever #10 clock = ~ clock;
  initial #1000 $finish;
endmodule
  