`timescale 1ns / 1ps // Set the timescale for the simulation

module tb;
  parameter N = 2;
  parameter value_size = 32;
  parameter index_size = 3;
  
  reg clk;
  reg [N*value_size-1:0] val;  
  reg [N*value_size-1:0] vec_val;   
  reg [N*index_size-1:0] ind;
  reg [N-1:0] signals;
  reg start;
  
  wire [N*value_size-1:0] ans;
  wire [N-1:0] ready;
  wire [N*value_size-1:0] check_psums;
  
  wire [value_size-1:0] fp_result;
  
  initial clk = 1;
  always #1 clk = ~clk;

main #(.N(N), .value_size(value_size), .index_size(index_size)) test(.clk(clk)
  ,.val(val)
  ,.vec_val(vec_val)
  ,.ind(ind)
  ,.signals(signals)
  ,.ans(ans)
  ,.ready(ready)
  ,.psums(check_psums)
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

//  fp_multiplier fp_multiplier(
//            .a(val[31:0])
//            ,.b(val[63:32])
//            ,.result(fp_result)
//            );

//    fp_adder fp_adder(
//            .a(val[31:0])
//            ,.b(val[63:32])
//            ,.result(fp_result)
//            );
            
  //1.1 = 32'b0011111110001100110011001100110000000000
  //      32'h3F8CCCCD
  //2.1 = 32'b0100000000001100110011001100110000000000
  //      32'h40066666
  //2.31 = 32'b0100000000010011001100110011001100000000
  //      32'4013D70A
  //3.2 = 32'b0100000001001100110011001100110000000000  
  //      32'h404CCCCC   
  //1.21 = 3f9ae148
  //4.41 = 408d1eb8  
  //5.62 = 40b3d709  
  
  initial begin
    start = 1;
    val[31:0] = 32'h3F8CCCCD;
    val[63:32] = 32'h40066666;
    vec_val[31:0] = 32'h3F8CCCCD;
    vec_val[63:32] = 32'h40066666;
    ind = 0;
    #2
//    $display("in1 = %h, in2 = %h, ans = %h", val[31:0], val[63:32], fp_result);
    
    start = 0;
    val[31:0] = 32'h3F8CCCCD;
    val[63:32] = 32'h40066666;
    vec_val[31:0] = 32'h3F8CCCCD;
    vec_val[63:32] = 32'h40066666;
    ind[2:0] = 1;
    ind[5:3] = 2;
    #2
    
    val[31:0] = 0;
    val[63:32] = 0;
    vec_val[31:0] = 0;
    vec_val[63:32] = 0;
    ind[2:0] = 2;
    ind[5:3] = 1;
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