`timescale 1ns / 1ps

module simfile();
reg B1 = 0, B2 = 0, B3 = 0, B4 = 0, B5 = 0, B6 = 0, B7 = 0, B8 = 0, B9= 0;
reg clk = 0;
reg reset = 0;
wire dp;
wire[6:0] seg;
wire [3:0] anode;
wire [3:0] digit1, digit2, digit3, digit4;
main myfile(.B1(B1),.B2(B2),.B3(B3),.B4(B4),.B5(B5),.B6(B6),.B7(B7),.B8(B8),.B9(B9),.clk_in(clk),.reset(reset),  .seg(seg),.dp(dp), .anode(anode), .digit1(digit1), .digit2(digit2), .digit3(digit3), .digit4(digit4));

initial begin
    reset = 1;
    #5
    reset = 0;
    for (integer i = 0; i < 9; i=i+1) begin
        B1 = 1;
        #100;
        B1 = 0;
        #100;
    end
    for (integer i = 0; i < 9; i=i+1) begin
        B2 = 1;
        #100;
        B2 = 0;
        #100;
    end
    for (integer i = 0; i < 9; i=i+1) begin
        B3 = 1;
        #100;
        B3 = 0;
        #100;
    end
    for (integer i = 0; i < 9; i=i+1) begin
        B4 = 1;
        #100;
        B4 = 0;
        #100;
    end
    B7 = 1;
    #100;
    B7 = 0;
    #100;
    B5 = 1;
    #100;
    B5 = 0; 
    B6 = 1;
    #100
    B6 = 0; 
    #100;
    B8 = 1;
    #100
    B8 = 0;
    B9 = 1;
    #100;
    B9 = 0;
    #100;
    for (integer i = 0; i < 9; i=i+1) begin
        B4 = 1;
        #100;
        B4 = 0;
        #100;
    end
    B6 = 1;
    #100;
    B6 = 0;
    #100;
    B8 = 1;
    #100;
    B8 = 0;
    #100;
    B9 = 1;
    #100;
    B9 = 0;
    #100;
    for (integer i = 0; i < 4; i=i+1) begin
        B1 = 1;
        #100;
        B1 = 0;
        #100;
    end
    for (integer i = 0; i < 3; i=i+1) begin
        B2 = 1;
        #100;
        B2 = 0;
        #100;
    end
    B6 = 1;
    #100;
    B6 = 0;
    #100;
    B8 = 1;
    #100;
    B8 = 0;
    #100;
    B7 = 1;
    #100;
    B7 = 0;
    #100;
    B9 = 1;
    #100;
    B9 = 0;
    #100;
    for (integer i = 0; i < 2; i=i+1) begin
        B3 = 1;
        #100;
        B3 = 0;
        #100;
    end
    for (integer i = 0; i < 2; i=i+1) begin
        B4 = 1;
        #100;
        B4 = 0;
        #100;
    end
    B8 = 1;
    #100;
    B8 = 0;
    #100;
end


always
    #5 clk = ~clk;
endmodule
