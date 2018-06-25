`include "lc3interface.sv"
`include "test.sv"
`include "decode.sv"
`include "monitor.sv"
`include "fetch.sv"
`include "alu.sv"
module TOP(lc3Interface.TOP inf);
  always @(inf.PC) begin
    if (!inf.reset) begin
      inf.instrmem_rd = 1;
      @(inf.complete_instr == 1);
      $display("2.New Instruction Starts");
      inf.instrmem_rd = 0;
    end
    //else $display("RESET");
  end
  
  always @(inf.Data_addr) begin
    if(!inf.reset) begin
      inf.Data_rd = 1;
      //$display("TOP MEM Interfaced");
      @(inf.complete_data==1);
      @(posedge inf.clock);
      inf.Data_rd = 0;
    end
    //else
      //$display("RESTE");
  end
endmodule