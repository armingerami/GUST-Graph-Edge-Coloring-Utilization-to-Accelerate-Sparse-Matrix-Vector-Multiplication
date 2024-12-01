module adder#(parameter value_size = 32)(input clk, 
input [value_size-1:0] pprod,
input signal,
input start, 
output [value_size-1:0] psum, 
output ready);
//signal == dump
    reg [value_size-1:0] storedValue;
    integer i;
    always@(posedge clk) begin
        if(start == 1) begin
            storedValue = 0;
        end else begin
            storedValue <= storedValue + pprod;
        end
    end

    assign ready = (signal==1'b1)?1'b1:1'b0;
    assign psum = storedValue;   

endmodule