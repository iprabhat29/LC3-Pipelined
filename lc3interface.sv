interface lc3Interface(input clock);
  logic reset;
  logic [15:0] PC;
  logic instrmem_rd;
  logic [15:0] instr_dout;
  logic complete_instr;
  bit complete_data;
  logic [15:0] Data_dout;
  logic [15:0] Data_din;
  logic Data_rd;
  logic [15:0] Data_addr;
  logic [15:0] SR1;
  logic [15:0] SR2;
  logic [15:0] DR;
  logic [4:0] imm;
  logic [3:0] func;
  bit Decode_done;
  modport TOP(input clock,reset,instr_dout,complete_instr,complete_data,Data_dout,
              output Data_addr,Data_rd,Data_din,instrmem_rd,PC);
  modport TEST(input clock,instrmem_rd,Data_rd,Data_addr,Decode_done,
               output reset,PC,instr_dout,complete_instr,complete_data,Data_dout);
  modport FETCH(input clock,complete_instr,Decode_done,output 
                PC,instrmem_rd);
  modport DECODE(input clock,instr_dout,complete_instr,complete_data,Data_dout,
                 output SR1,SR2,DR,imm,func,Data_addr,Decode_done);
  modport ALU(input clock,SR1,SR2,DR,imm,func,Decode_done);
  modport MONITOR(input instr_dout,complete_instr,SR1,SR2,DR,imm);
endinterface
  