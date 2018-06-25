module fetch(lc3Interface.FETCH inf);
  always @(posedge inf.clock) begin
    wait (inf.Decode_done == 1);
    @(posedge inf.clock);
    inf.PC = inf.PC + 4;
    end
endmodule
    