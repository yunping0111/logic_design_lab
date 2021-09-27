`timescale 1ns/1ps

module Dmux_1x4_4bit(in, a, b, c, d, sel);
input [3:0] in;
input [1:0] sel;
output [3:0] a, b, c, d;

wire not1, not0;
not n1(not1, sel[1]);
not n0(not0, sel[0]);

wire aA, aB, aC, aD;
and andA(aA, not1, not0);
and andB(aB, not1, sel[0]);
and andC(aC, sel[1], not0);
and andD(aD, sel[1], sel[0]);

//wire A, B, C, D;
and a3(a[3], aA, in[3]);
and a2(a[2], aA, in[2]);
and a1(a[1], aA, in[1]);
and a0(a[0], aA, in[0]);

and b3(b[3], aB, in[3]);
and b2(b[2], aB, in[2]);
and b1(b[1], aB, in[1]);
and b0(b[0], aB, in[0]);

and c3(c[3], aC, in[3]);
and c2(c[2], aC, in[2]);
and c1(c[1], aC, in[1]);
and c0(c[0], aC, in[0]);

and d3(d[3], aD, in[3]);
and d2(d[2], aD, in[2]);
and d1(d[1], aD, in[1]);
and d0(d[0], aD, in[0]);

endmodule