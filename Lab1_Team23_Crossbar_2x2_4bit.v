`timescale 1ns/1ps

module Crossbar_2x2_4bit(in1, in2, control, out1, out2);
input [3:0] in1, in2;
input control;
output [3:0] out1, out2;
wire [3:0] mid1, mid2, mid3, mid4;
wire notcon;
not notc(notcon, control);
Dmux_1x2_4bit DMux1(in1, mid2, mid1, notcon);
Dmux_1x2_4bit DMux2(in2, mid4, mid3, control);
Mux_2x1_4bit Mux1(mid3, mid1, notcon, out1);
Mux_2x1_4bit Mux2(mid4, mid2, control, out2);
endmodule


module Mux_2x1_4bit(a, b, sel, f);
input [3:0] a, b;
input sel;
output [3:0] f;
wire notsel;
not not0(notsel, sel);
wire [3:0] A, B;
and and0(A[0], a[0], sel);
and and1(A[1], a[1], sel);
and and2(A[2], a[2], sel);
and and3(A[3], a[3], sel);
and and00(B[0], b[0], notsel);
and and01(B[1], b[1], notsel);
and and02(B[2], b[2], notsel);
and and03(B[3], b[3], notsel);

or or0(f[0], A[0], B[0]);
or or1(f[1], A[1], B[1]);
or or2(f[2], A[2], B[2]);
or or3(f[3], A[3], B[3]);
endmodule


module Dmux_1x2_4bit(in, aa, bb, sel);
input [3:0] in;
input sel;
output [3:0] aa, bb;
wire not0;
not n0(not0, sel);
wire aA, aB, aC, aD;
and andA(aA, sel);
and andB(aB, not0);
and a3(aa[3], aA, in[3]);
and a2(aa[2], aA, in[2]);
and a1(aa[1], aA, in[1]);
and a0(aa[0], aA, in[0]);
and b3(bb[3], aB, in[3]);
and b2(bb[2], aB, in[2]);
and b1(bb[1], aB, in[1]);
and b0(bb[0], aB, in[0]);

endmodule
