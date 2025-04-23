module adder#(parameter N = 1, parameter value_size = 32, parameter index_size = 7)(input clk, 
input [N*value_size-1:0] val,
input [index_size-1:0] ind, 
//input  signal,
input start, 
output [value_size-1:0] psum 
//output ready
);
//signal == dump
    reg [value_size-1:0] storedValue;
    reg [value_size-1:0] in1, in2;
    reg [value_size-1:0] temp;
    integer i;
    always@(posedge clk) begin
        if(start == 1) begin
            storedValue <= 0;
            temp <= 32'b0;
        end else begin
            if(ind == 0) begin
//                storedValue = storedValue;
                temp = 32'b0;
            end else begin 
                for(i = value_size-1; i >= 0; i = i - 1) temp[i] = val[(ind-1)*value_size + i]; 
//                storedValue = storedValue + temp;
            end       
            storedValue <= psum;
        end
    end
    
    
//    assign ready = (signal==1'b1)?1'b1:1'b0;
//    assign psum = storedValue;
    fp_adder fp_adder(.a(storedValue), .b(temp), .result(psum));
    
endmodule



module fp_adder(
input [31:0] a,
input [31:0] b,
output [31:0] result);

wire operation_add_sub_signal;
wire enable;
wire output_sign;

wire [31:0] op_a,op_b;
wire [23:0] significand_a,significand_b;
wire [7:0] exp_diff;


wire [23:0] significand_b_add_sub;
wire [7:0] exp_b_add_sub;

wire [24:0] significand_add;
wire [30:0] add_sum;

wire [23:0] significand_sub_complement;
wire [24:0] significand_sub;
wire [30:0] sub_diff;
wire [24:0] subtraction_diff; 
wire [7:0] exp_sub;

assign {enable,op_a,op_b} = (a[30:0] < b[30:0]) ? {1'b1,b,a} : {1'b0,a,b};							// For operations always op_a must not be less than b

assign exp_a = op_a[30:23];
assign exp_b = op_b[30:23];


assign output_sign = op_a[31] ;

assign operation_subtract_signal = ~(op_a[31] ^ op_b[31]);
																// Assign significand values according to Hidden Bit.
assign significand_a = (|op_a[30:23]) ? {1'b1,op_a[22:0]} : {1'b0,op_a[22:0]};							// If exponent is zero,hidden bit = 0,else 1
assign significand_b = (|op_b[30:23]) ? {1'b1,op_b[22:0]} : {1'b0,op_b[22:0]};

assign exp_diff = op_a[30:23] - op_b[30:23];											// Exponent difference calculation
assign significand_b_add_sub = significand_b >> exp_diff;
assign exp_b_add_sub = op_b[30:23] + exp_diff; 

assign perform = (op_a[30:23] == exp_b_add_sub);										// Checking if exponents are same


// Add Block //
assign significand_add = (perform & operation_subtract_signal) ? (significand_a + significand_b_add_sub) : 25'd0; 

assign add_sum[22:0] = significand_add[24] ? significand_add[23:1] : significand_add[22:0];					// res will be most 23 bits if carry generated, else least 22 bits.

assign add_sum[30:23] = significand_add[24] ? (1'b1 + op_a[30:23]) : op_a[30:23];						// If carry generates in sum value then exponent is added with 1 else feed as it is.

// Sub Block //
assign significand_sub_complement = (perform & !operation_subtract_signal) ? ~(significand_b_add_sub) + 24'd1 : 24'd0 ; 

assign significand_sub = perform ? (significand_a + significand_sub_complement) : 25'd0;

priority_encoder pe(significand_sub,op_a[30:23],subtraction_diff,exp_sub);

assign sub_diff[30:23] = exp_sub;

assign sub_diff[22:0] = subtraction_diff[22:0];

// Output //
assign result = (!operation_subtract_signal) ? {output_sign,sub_diff} : {output_sign,add_sum};

endmodule

module priority_encoder(
			input [24:0] significand,
			input [7:0] exp_a,
			output reg [24:0] Significand,
			output [7:0] exp_sub
			);

reg [4:0] shift;

always @(significand)
begin
	casex (significand)
		25'b1_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx :	begin
													Significand = significand;
									 				shift = 5'd0;
								 			  	end
		25'b1_01xx_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin						
										 			Significand = significand << 1;
									 				shift = 5'd1;
								 			  	end

		25'b1_001x_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin						
										 			Significand = significand << 2;
									 				shift = 5'd2;
								 				end

		25'b1_0001_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin 							
													Significand = significand << 3;
								 	 				shift = 5'd3;
								 				end

		25'b1_0000_1xxx_xxxx_xxxx_xxxx_xxxx : 	begin						
									 				Significand = significand << 4;
								 	 				shift = 5'd4;
								 				end

		25'b1_0000_01xx_xxxx_xxxx_xxxx_xxxx : 	begin						
									 				Significand = significand << 5;
								 	 				shift = 5'd5;
								 				end

		25'b1_0000_001x_xxxx_xxxx_xxxx_xxxx : 	begin						// 24'h020000
									 				Significand = significand << 6;
								 	 				shift = 5'd6;
								 				end

		25'b1_0000_0001_xxxx_xxxx_xxxx_xxxx : 	begin						// 24'h010000
									 				Significand = significand << 7;
								 	 				shift = 5'd7;
								 				end

		25'b1_0000_0000_1xxx_xxxx_xxxx_xxxx : 	begin						// 24'h008000
									 				Significand = significand << 8;
								 	 				shift = 5'd8;
								 				end

		25'b1_0000_0000_01xx_xxxx_xxxx_xxxx : 	begin						// 24'h004000
									 				Significand = significand << 9;
								 	 				shift = 5'd9;
								 				end

		25'b1_0000_0000_001x_xxxx_xxxx_xxxx : 	begin						// 24'h002000
									 				Significand = significand << 10;
								 	 				shift = 5'd10;
								 				end

		25'b1_0000_0000_0001_xxxx_xxxx_xxxx : 	begin						// 24'h001000
									 				Significand = significand << 11;
								 	 				shift = 5'd11;
								 				end

		25'b1_0000_0000_0000_1xxx_xxxx_xxxx : 	begin						// 24'h000800
									 				Significand = significand << 12;
								 	 				shift = 5'd12;
								 				end

		25'b1_0000_0000_0000_01xx_xxxx_xxxx : 	begin						// 24'h000400
									 				Significand = significand << 13;
								 	 				shift = 5'd13;
								 				end

		25'b1_0000_0000_0000_001x_xxxx_xxxx : 	begin						// 24'h000200
									 				Significand = significand << 14;
								 	 				shift = 5'd14;
								 				end

		25'b1_0000_0000_0000_0001_xxxx_xxxx  : 	begin						// 24'h000100
									 				Significand = significand << 15;
								 	 				shift = 5'd15;
								 				end

		25'b1_0000_0000_0000_0000_1xxx_xxxx : 	begin						// 24'h000080
									 				Significand = significand << 16;
								 	 				shift = 5'd16;
								 				end

		25'b1_0000_0000_0000_0000_01xx_xxxx : 	begin						// 24'h000040
											 		Significand = significand << 17;
										 	 		shift = 5'd17;
												end

		25'b1_0000_0000_0000_0000_001x_xxxx : 	begin						// 24'h000020
									 				Significand = significand << 18;
								 	 				shift = 5'd18;
								 				end

		25'b1_0000_0000_0000_0000_0001_xxxx : 	begin						// 24'h000010
									 				Significand = significand << 19;
								 	 				shift = 5'd19;
												end

		25'b1_0000_0000_0000_0000_0000_1xxx :	begin						// 24'h000008
									 				Significand = significand << 20;
								 					shift = 5'd20;
								 				end

		25'b1_0000_0000_0000_0000_0000_01xx : 	begin						// 24'h000004
									 				Significand = significand << 21;
								 	 				shift = 5'd21;
								 				end

		25'b1_0000_0000_0000_0000_0000_001x : 	begin						// 24'h000002
									 				Significand = significand << 22;
								 	 				shift = 5'd22;
								 				end

		25'b1_0000_0000_0000_0000_0000_0001 : 	begin						// 24'h000001
									 				Significand = significand << 23;
								 	 				shift = 5'd23;
								 				end

		25'b1_0000_0000_0000_0000_0000_0000 : 	begin						// 24'h000000
								 					Significand = significand << 24;
							 	 					shift = 5'd24;
								 				end
		default : 	begin
						Significand = (~significand) + 1'b1;
						shift = 8'd0;
					end

	endcase
end
assign exp_sub = exp_a - shift;

endmodule