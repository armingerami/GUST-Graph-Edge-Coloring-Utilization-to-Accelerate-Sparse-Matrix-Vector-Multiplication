module main#(parameter N = 256, parameter value_size = 32, parameter index_size = 5)(input clk,
input [N*value_size-1:0] val,
input [N*value_size-1:0] vec_val,
input [N*index_size-1:0] ind,
//input [N-1:0] signals,
output [N*value_size-1:0] ans,
//output [N-1:0] ready,
//output [N*value_size-1:0] psums,
input start
    );
//ind starts from 1 and goes to N  
    
    wire [N*value_size-1:0] psums;
        
//    assign check_psums = psums;    
    
    genvar i, j;
    generate        
        for (i=1; i<=N; i=i+1) begin 
            multiplier #(.N(N), .value_size(value_size)) i_m(
//            .clk(clk),
            .val(val[i*value_size-1:(i-1)*value_size])
            ,.vec_val(vec_val[i*value_size-1:(i-1)*value_size])
            ,.pprod(psums[i*value_size-1:(i-1)*value_size])
            );
        end
        
        for (j=1; j<=N; j=j+1) begin 
            adder #(.N(N), .value_size(value_size), .index_size(index_size)) j_a(
            .clk(clk)
            ,.val(psums)
            ,.ind(ind[j*index_size-1:(j-1)*index_size])
//            ,.signal(signals[j-1])
            ,.psum(ans[j*value_size-1:(j-1)*value_size])
//            ,.ready(ready[j-1])
            ,.start(start)
            );
        end
    endgenerate

endmodule

