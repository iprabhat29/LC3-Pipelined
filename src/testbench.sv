`include "clock.sv"
module testbench;
  bit clock;
  clock_module clk(clock);
  lc3Interface inf(clock);
  TOP DUT(inf);
  decode d(inf);
  test t(inf);
  mon m(inf);
  fetch f(inf);
  execution e(inf);
endmodule
  
  
