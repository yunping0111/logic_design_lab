`timescale 1ns/1ps

module Majority(a, b, c, out);
input a, b, c;
output out;
wire tmp0, tmp1, tmp2, tmp3;
my_and and0(tmp0, a, b);
my_and and1(tmp1, a, c);
my_and and2(tmp2, b, c);
my_or or0(tmp3, tmp0, tmp1);
my_or or1(out, tmp3, tmp2);

endmodule


module and3(f, a, b, c);
input a, b, c;
wire tmp0, tmp1;
output f;
my_and and0(tmp0, a, b);
nand nand0(tmp1, tmp0, tmp0);
nand nand1(f, tmp1, c);
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