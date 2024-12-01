module connector#(parameter N = 2, parameter value_size = 32, parameter index_size = 2)(input clk,
input [N*value_size - 1:0] pprod_in,
input [N*index_size - 1:0] ind,
output [N*value_size - 1:0] pprod_out
    );
    
 
reg[N*value_size - 1:0] temp;
reg[index_size-1:0] pos;
integer i, j, k;
always @ (posedge clk) begin
    for(i = 0; i < N; i = i+1) begin
        for(j = 0; j < value_size; j = j+1) begin
            for(k = 0; k < index_size; k = k+1) pos[k] = ind[i*index_size+k];
            temp[(pos-1)*value_size+j] = pprod_in[i*value_size+j];
        end
    end
	
end
      
assign pprod_out = temp;
endmodule