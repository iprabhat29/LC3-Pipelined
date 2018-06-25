module execution(lc3Interface.ALU inf);
  always @(posedge inf.clock) begin
    @(inf.Decode_done == 1);
    $display("DR %d   SR1 %d    SR2 %d   Imm %d",inf.DR,inf.SR1,inf.SR2,inf.imm);
  end
endmodule