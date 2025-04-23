module fp_multiplier(
input [31:0] a,
input [31:0] b,
output [31:0] result);

wire sign,round,normalised;
wire [8:0] exponent,sum_exponent;
wire [22:0] product_mantissa;
wire [23:0] op_a,op_b;
wire [47:0] product,product_normalised; 


assign sign = a[31] ^ b[31];   				
assign op_a = (|a[30:23]) ? {1'b1,a[22:0]} : {1'b0,a[22:0]};
assign op_b = (|b[30:23]) ? {1'b1,b[22:0]} : {1'b0,b[22:0]};
assign product = op_a * op_b;													
assign round = |product_normalised[22:0];  								
assign normalised = product[47] ? 1'b1 : 1'b0;	
assign product_normalised = normalised ? product : product << 1;				
assign product_mantissa = product_normalised[46:24] + (product_normalised[23] & round); 	
assign sum_exponent = a[30:23] + b[30:23];
assign exponent = sum_exponent - 8'd127 + normalised;	
assign result = {sign,exponent[7:0],product_mantissa};

endmodule
