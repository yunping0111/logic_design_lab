`timescale 1ns/1ps

module Half_Adder(a, b, cout, sum);
input a, b;
output cout, sum;
my_and and0(cout, a, b);
my_xor xor0(sum, a, b);

endmodule

module Full_Adder (a, b, cin, cout, sum);
input a, b, cin;
output cout, sum;
wire tmp0;
my_xor xor0(tmp0, a, b);
my_xor xor1(sum, tmp0, cin);

wire a0, a1, a2, b0;
my_and and0(a0, a, b);
my_and and1(a1, a, cin);
my_and and2(a2, cin, b);
my_or or0(b0, a0, a1);
my_or or1(cout, b0, a2);

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