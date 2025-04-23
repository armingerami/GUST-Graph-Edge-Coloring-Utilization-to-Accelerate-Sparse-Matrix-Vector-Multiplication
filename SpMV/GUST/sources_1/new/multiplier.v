//module multiplier#(parameter N = 2, parameter value_size = 32)(input clk, 
//input [value_size-1:0] val,
//input [value_size-1:0] vec_val,   
//output [value_size-1:0] pprod);
    
////    reg [value_size-1:0] temp;
////    always@(posedge clk) begin
////        temp = val*vec_val;
////    end
////    assign psum = temp;

//    fp_multiplier fp_multiplier(.a(val), .b(vec_val), .result(pprod));
       
//endmodule

module multiplier#(parameter N = 1, parameter value_size = 32)(
// input clk,
input [value_size-1:0] val,
input [value_size-1:0] vec_val,
output [value_size-1:0] pprod);

wire sign,round,normalised;
wire [8:0] exponent,sum_exponent;
wire [22:0] product_mantissa;
wire [23:0] op_a,op_b;
wire [47:0] product,product_normalised; 


assign sign = val[31] ^ vec_val[31];   				
assign op_a = (|val[30:23]) ? {1'b1,val[22:0]} : {1'b0,val[22:0]};
assign op_b = (|vec_val[30:23]) ? {1'b1,vec_val[22:0]} : {1'b0,vec_val[22:0]};
assign product = op_a * op_b;													
assign round = |product_normalised[22:0];  								
assign normalised = product[47] ? 1'b1 : 1'b0;	
assign product_normalised = normalised ? product : product << 1;				
assign product_mantissa = product_normalised[46:24] + (product_normalised[23] & round); 	
assign sum_exponent = val[30:23] + vec_val[30:23];
assign exponent = sum_exponent - 8'd127 + normalised;	
assign pprod = {sign,exponent[7:0],product_mantissa};

endmodule