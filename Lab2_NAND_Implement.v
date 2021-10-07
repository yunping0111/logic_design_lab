`timescale 1ns/1ps

module NAND_Implement (a, b, sel, out);
input a, b;
input [2:0] sel;
output out;

wire nsel[2:0];
my_not nots0(nsel[0], sel[0]);
my_not nots1(nsel[1], sel[1]);
my_not nots2(nsel[2], sel[2]);

wire sel0, sel1, sel2, sel3, sel4, sel5, sel6, sel7;
my_and3 ma0(sel0, nsel[2], nsel[1], nsel[0]);
my_and3 ma1(sel1, nsel[2], nsel[1], sel[0]);
my_and3 ma2(sel2, nsel[2], sel[1], nsel[0]);
my_and3 ma3(sel3, nsel[2], sel[1], sel[0]);
my_and3 ma4(sel4, sel[2], nsel[1], nsel[0]);
my_and3 ma5(sel5, sel[2], nsel[1], sel[0]);
my_and3 ma6(sel6, sel[2], sel[1], nsel[0]);
my_and3 ma7(sel7, sel[2], sel[1], sel[0]);

wire out0, out1, out2, out3, out4, out5, out6, out7;
nand o0(out0, a, b);
my_and o1(out1, a, b);
my_or o2(out2, a, b);
my_nor o3(out3, a, b);
my_xor o4 (out4, a, b); 
my_xnor o5 (out5, a, b);
my_not o6 (out6, a);
my_not o7 (out7, a);

wire ans0, ans1, ans2, ans3, ans4, ans5, ans6, ans7;
my_and a0(ans0, sel0, out0);
my_and a1(ans1, sel1, out1);
my_and a2(ans2, sel2, out2);
my_and a3(ans3, sel3, out3);
my_and a4(ans4, sel4, out4);
my_and a5(ans5, sel5, out5);
my_and a6(ans6, sel6, out6);
my_and a7(ans7, sel7, out7);

or7 ansss(out, ans0, ans1, ans2, ans3, ans4, ans5, ans6, ans7);
endmodule

module or7 (ans, a, b, c, d, e, f, g, h);
input a, b, c, d, e, f, g, h;
output ans;
wire tmp0, tmp1, tmp2, tmp3, tmp4, tmp5;
my_or or0(tmp0, a, b);
my_or or1(tmp1, c, d);
my_or or2(tmp2, e, f);
my_or or3(tmp3, g, h);
my_or or4(tmp5, tmp0, tmp1);
my_or or5(tmp4, tmp2, tmp3);
my_or or6(ans, tmp5, tmp4);
endmodule

module my_and3(f, a, b, c);
input a, b, c;
wire tmp0, tmp1;
output f;
my_and and0(tmp0, a, b);
my_and and1(f, tmp0, c);
endmodule

module my_not(f, x);
input x;
output f;
nand notnand(f, x, x);
endmodule

module my_and(f, x, y);
input x, y;
output f;
wire z;
nand nand0(z, x, y);
nand nand1(f, z, z);
endmodule

module my_or(f, x, y);
input x, y;
output f;
wire nx, ny;
nand notx(nx, x, x);
nand noty(ny, y, y);
nand nandor(f, nx, ny);
endmodule

module my_nor(f, x, y);
input x, y;
output f;
wire nx, ny, tmp;
nand notx(nx, x, x);
nand noty(ny, y, y);
nand nand3(tmp, nx, ny);
nand nand4(f, tmp, tmp);
endmodule

module my_xor(f, x, y);
input x, y;
output f;
wire a, b, c;
nand nand5(a, x, y);
nand nand6(b, a, x);
nand nand7(c, a, y);
nand nand8(f, b, c);
endmodule

module my_xnor(f, x, y);
input x, y;
output f;
wire a, b, c, tmp;
nand nand5(a, x, y);
nand nand6(b, a, x);
nand nand7(c, a, y);
nand nand8(tmp, b, c);
nand nand9(f, tmp, tmp);
endmodule