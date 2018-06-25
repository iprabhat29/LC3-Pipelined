module test(lc3Interface.TEST inf);
  int i,j;
  initial begin
    i = 0;
    repeat(4) @(posedge inf.clock);
    inf.reset = 0;
	inf.PC = 16'd3000;
    $display("1.Prog Starts");
    while (1) begin
      @(inf.instrmem_rd == 1);
      inf.complete_instr = 0;
      repeat (2) @(posedge inf.clock);
      if (i==0) begin
        inf.instr_dout = 16'd5020;
      end
      else if(i ==1) begin
        inf.instr_dout = 16'b0001011111111100;
      end
      else if(i==2) begin
        inf.instr_dout = 16'd5031;
      end
      inf.complete_instr = 1;
      i = i + 1;
    end
  end
  
  initial begin;
    j = 0;
    while (1) begin
      if (j==0) begin
        @(inf.Data_rd == 1);
        repeat (2) @(posedge inf.clock);
        @(posedge inf.clock);
      	inf.Data_dout = 16'd1111;
        inf.complete_data = 1;
        @(posedge inf.clock);
        inf.complete_data = 0;
        j = j + 1;
      end
      if(j==1) begin
        @(inf.Data_rd == 1);
        inf.complete_data = 0;
        repeat (2) @(posedge inf.clock);
        @(posedge inf.clock);
        inf.Data_dout = 16'd2222;
        inf.complete_data = 1;
        @(posedge inf.clock);
        inf.complete_data = 0;
        j = j + 1;
      end
      if(j==2) begin
        @(inf.Data_rd == 1);
        inf.complete_data = 0;
        repeat (2) @(posedge inf.clock);
        @(posedge inf.clock);
        inf.Data_dout = 16'd3333;
        inf.complete_data = 1;
        @(posedge inf.clock);
        inf.complete_data = 0;
        j = j + 1;
      end
      if(j==3) begin
        @(inf.Data_rd == 1);
        inf.complete_data = 0;
        repeat (2) @(posedge inf.clock);
        @(posedge inf.clock);
        inf.Data_dout = 16'd4444;
        inf.complete_data = 1;
        @(posedge inf.clock);
        inf.complete_data = 0;
        j = j + 1;
      end
      if(j==4) begin
        @(inf.Data_rd == 1);
        inf.complete_data = 0;
        repeat (2) @(posedge inf.clock);
        @(posedge inf.clock);
        inf.Data_dout = 16'd5555;
        inf.complete_data = 1;
        @(posedge inf.clock);
        inf.complete_data = 0;
        j = j + 1;
      end
      if(j==5) begin
        @(inf.Data_rd == 1);
        inf.complete_data = 0;
        repeat (2) @(posedge inf.clock);
        @(posedge inf.clock);
        inf.Data_dout = 16'd6666;
        inf.complete_data = 1;
        @(posedge inf.clock);
        inf.complete_data = 0;
        j = j + 1;
      end
      if(j==6) begin
        @(inf.Data_rd == 1);
        inf.complete_data = 0;
        repeat (2) @(posedge inf.clock);
        @(posedge inf.clock);
        inf.Data_dout = 16'd7777;
        inf.complete_data = 1;
        @(posedge inf.clock);
        inf.complete_data = 0;
        j = j + 1;
      end
      if(j==7) begin
        @(inf.Data_rd == 1);
        inf.complete_data = 0;
        repeat (2) @(posedge inf.clock);
        @(posedge inf.clock);
        inf.Data_dout = 16'd8888;
        inf.complete_data = 1;
        @(posedge inf.clock);
        inf.complete_data = 0;
        j = j + 1;
      end
      if(j==8) begin
        @(inf.Data_rd == 1);
        inf.complete_data = 0;
        repeat (2) @(posedge inf.clock);
        @(posedge inf.clock);
        inf.Data_dout = 16'd9999;
        inf.complete_data = 1;
        @(posedge inf.clock);
        inf.complete_data = 0;
        j = j + 1;
      end
    end
  end 
endmodule
    
    
    
    
    