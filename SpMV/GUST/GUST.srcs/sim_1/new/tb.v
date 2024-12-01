`timescale 1ns / 1ps // Set the timescale for the simulation

module tb;
  parameter N = 2;
  parameter value_size = 32;
  parameter index_size = 2;
  
  reg clk;
  reg [N*value_size-1:0] val;  
  reg [N*value_size-1:0] vec_val;   
  reg [N*index_size-1:0] ind;
  reg [N-1:0] signals;
  reg start;
  
  wire [N*value_size-1:0] psum;
  wire [N-1:0] ready;
  wire [N*value_size-1:0] pprod;
  wire [N*value_size-1:0] pprod_connector_out;
  
  initial clk = 1;
  always #1 clk = ~clk;

main #(.N(N), .value_size(value_size), .index_size(index_size)) test(.clk(clk)
  ,.val(val)
  ,.vec_val(vec_val)
  ,.ind(ind)
  ,.signals(signals)
  ,.psum(psum)
  ,.ready(ready)
  ,.pprod(pprod)
  ,.pprod_connector_out(pprod_connector_out)
  ,.start(start));
   
   
//    multiplier #(.N(N)) i_m(
//            .clk(clk)
//            ,.val(val1[1*32-1:(1-1)*32])
//            ,.ind(ind1[15:0][1*16-1:(1-1)*16])
//            ,.psum(check_psums[1*N*32-1:(1-1)*N*32])
//            );
    
//    adder #(.N(N)) j_a(
//            .clk(clk)
//            ,.val(check_psums[1*N*32-1:(1-1)*N*32])
//            ,.ind(ind21[1*16-1:(1-1)*16])
//            ,.signals(signals1[1*2-1:(1-1)*2])
//            ,.psum(ans1[1*32-1:(1-1)*32])
//            ,.ready(ready1)
//            );
               
  initial begin
    start = 1;
    val[31:0] = 1;
    val[63:32] = 2;
    vec_val[31:0] = 3;
    vec_val[63:32] = 4;
    ind = 0;
    #2
    
    
    val[31:0] = 2;
    val[63:32] = 3;
    vec_val[31:0] = 4;
    vec_val[63:32] = 2;
    ind[1:0] = 1;
    ind[3:2] = 2;
    #2
    
    start = 0;
    val[31:0] = 0;
    val[63:32] = 0;
    vec_val[31:0] = 0;
    vec_val[63:32] = 0;
    ind[1:0] = 2;
    ind[3:2] = 1;
    #2
    
    val[31:0] = 0;
    val[63:32] = 0;
    vec_val[31:0] = 0;
    vec_val[63:32] = 0;
    ind = 0;
    signals[0] = 1;
    signals[1] = 1;
    #2
        
    $finish; // Terminate the simulation
  end

  // Compare the actual output to the expected output
 // assign sum_exp = 9'b00011001; // Set the expected output
  //always @* begin
  //  if (sum_act !== sum_exp) begin
    //  $display("Error: expected sum = %b, actual sum = %b", sum_exp, sum_act);
    //end
  //end
  
endmodule