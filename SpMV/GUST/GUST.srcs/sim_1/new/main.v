module main#(parameter N = 8, parameter value_size = 32, parameter index_size = 7)(input clk,
input [N*value_size-1:0] val,
input [N*value_size-1:0] vec_val,
input [N*index_size-1:0] ind,
input [N-1:0] signals,
output [N*value_size-1:0] psum,
output [N-1:0] ready,
output [N*value_size-1:0] pprod,
output [N*value_size-1:0] pprod_connector_out,
input start
    );
//ind starts from 1 and goes to N      
    //wire [value_size-1:0] test;
        
    genvar i, j;
    generate        
        for (i=1; i<=N; i=i+1) begin 
            multiplier #(.value_size(value_size)) i_m(
            .clk(clk)
            ,.val(val[i*value_size-1:(i-1)*value_size])
            ,.vec_val(vec_val[i*value_size-1:(i-1)*value_size])
            ,.pprod(pprod[i*value_size-1:(i-1)*value_size])
            );
        end
        
        for (j=1; j<=N; j=j+1) begin 
            adder #(.value_size(value_size)) j_a(
            .clk(clk)
            ,.pprod(pprod_connector_out[j*value_size-1:(j-1)*value_size])
            ,.signal(signals[j-1])
            ,.psum(psum[j*value_size-1:(j-1)*value_size])
            ,.ready(ready[j-1])
            ,.start(start)
            );
        end
    endgenerate
    
    connector #(.N(N), .value_size(value_size), .index_size(index_size)) c(
    .clk(clk),
    .pprod_in(pprod),
    .pprod_out(pprod_connector_out),
    .ind(ind)
    );
    

endmodule
