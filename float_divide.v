module get_sign(A, B, sign); // this is to get the sign of the output
  input A, B;
  output sign;

  xor(sign,A,B);
endmodule

module get_exp(A,B, exp);// this is to get the exponent of the result. depending on the division of the mantissa this value will be altered
  input [7:0] A, B;
  output [7:0]exp;
  assign exp = A-B;
endmodule





module fpdiv(AbyB, DONE, EXCEPTION, InputA, InputB, CLOCK, RESET);
input CLOCK, RESET;
input [31:0] InputA, InputB;
output [31:0] AbyB;
output DONE;
output [1:0] EXCEPTION;
wire [7:0]  expAbyB;
wire [22:0]  mantAbyB;
wire  signAbyB;

get_sign s_out (.A(InputA[31]), .B(InputB[31]), .sign(signAbyB));
get_exp exp_out (.A(InputA[30:23]), .B(InputB[30:23]), .exp(expAbyB));

endmodule
