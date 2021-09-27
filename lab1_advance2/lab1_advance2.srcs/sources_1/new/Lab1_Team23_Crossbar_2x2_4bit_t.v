`timescale 1ns/1ps

module Crossbar_2x2_4bit_t;
reg [3:0]in1 = 4'b0000;
reg [3:0]in2 = 4'b0010;
reg control = 1'b0;
wire [3:0]out1, out2;

Crossbar_2x2_4bit m1(
    .in1 (in1),
    .in2 (in2),
    .control (control),
    .out1 (out1),
    .out2 (out2)
);

// uncommment and add "+access+r" to your nverilog command to dump fsdb waveform on NTHUCAD
// initial begin
//      $fsdbDumpfile("MUX.fsdb");
//      $fsdbDumpvars;
// end

initial begin
    repeat (2 ** 3) begin
        #1 control = control + 1'b1;
        in1 = in1 + 4'b1;
        in2 = in2 + 4'b1;
    end
    #1 $finish;
end
endmodule