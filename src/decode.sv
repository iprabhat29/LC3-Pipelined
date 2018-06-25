module decode(lc3Interface.DECODE inf);
  logic [15:0] temp;
  always @(*) begin
    wait (inf.complete_instr == 1);    
    inf.Decode_done = 0;
    $display("3. Decoding Instruction New %d    %b",inf.instr_dout,inf.instr_dout);
    case (inf.instr_dout[15:12])
      4'b0001: begin
        if (inf.instr_dout[5] == 0) begin
          inf.Decode_done = 0;
          @(posedge inf.clock);
          inf.Data_addr = inf.instr_dout[11:9];
          @(inf.complete_data == 1);
          inf.DR = inf.Data_dout;
          //$display(inf.DR);
          @(posedge inf.clock);
          inf.Data_addr = inf.instr_dout[8:6];
          @(posedge inf.clock);
          @(inf.complete_data == 1);
          inf.SR1 = inf.Data_dout;
          //$display(inf.SR1);
          @(posedge inf.clock);
          inf.Data_addr = inf.instr_dout[2:0];
          @(posedge inf.clock);
          @(inf.complete_data == 1);
          inf.SR2 = inf.Data_dout;
          //$display(inf.SR2);
          inf.Decode_done = 1;
          @(posedge inf.clock);
          inf.Decode_done = 0;
        end        
        else if (inf.instr_dout[5] == 1) begin
          temp = inf.instr_dout;
          inf.Decode_done = 0;
          @(posedge inf.clock);
          inf.Data_addr = inf.instr_dout[11:9];
          @(inf.complete_data == 1);
          inf.DR = inf.Data_dout;
          @(posedge inf.clock);
          inf.Data_addr = inf.instr_dout[8:6];
          @(posedge inf.clock);
          @(inf.complete_data == 1);
          inf.SR1 = inf.Data_dout;
          @(posedge inf.clock);
          inf.SR2 = 16'bx;
          //$display("%b",temp);
          if (temp[4] == 0) begin
            inf.imm = {11'b00000000000,temp};
          end
          else if(temp[4] == 1)
            inf.imm = {11'b11111111111,temp};            
          inf.Decode_done = 1;
          @(posedge inf.clock);
          inf.Decode_done = 0;
        end
      end
      4'b0000: begin
      end
    endcase
  end
endmodule
    