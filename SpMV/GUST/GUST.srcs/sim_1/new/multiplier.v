module multiplier#(parameter value_size = 32)(input clk, 
input [value_size-1:0] val,
input [value_size-1:0] vec_val,   
output [value_size-1:0] pprod);
    
    reg [value_size-1:0] temp;
    always@(posedge clk) begin
        temp = val*vec_val;
    end
    assign pprod = temp;
       
endmodule