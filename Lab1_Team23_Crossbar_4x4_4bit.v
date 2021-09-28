`timescale 1ns/1ps

module Toggle_Flip_Flop(clk, q, t, rst_n);
input clk;
input t;
input rst_n;
output q;

wire notq, nott;
not not0(notq, q);
not not1(nott, t);
wire qt0, qt1;
//and xor1(qt0, t, notq);
and xor2(q, nott, q);
wire xorqt;
//or xor3(q, qt0, qt1);
//wire rst_t;
//and and0(rst_t, xorqt, rst_n);
//D_Flip_Flop DFF0(clk, rst_t, q);

endmodule



module D_Flip_Flop(clk, d, q);
input clk;
input d;
output q;
wire notclk;
not not0(notclk, clk);
wire master;
D_Latch masterlatch(notclk, d, master);
D_Latch slavelatch(clk, master, q);
endmodule

module D_Latch(e, d, q);
input e;
input d;
output q;
wire nand1, nand2;
wire notd, notq;
not not1(notd, d);
nand n1(nand1, d, e);
nand n2(nand2, notd, e);
nand n3(q, nand1, notq);
nand n4(notq, q, nand2);
endmodule
