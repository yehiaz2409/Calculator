`timescale 1ns / 1ps


module main(input B1,B2,B3,B4,B5,B6,B7,B8,B9,clk_in,reset, output reg[6:0] seg,output reg dp, output reg[3:0] anode, output reg[3:0]digit1 = 0, digit2 = 0, digit3 = 0, digit4 = 0);
wire clk_out;
wire [1:0] sel;
clockdivider #(500000)myclk(.clk(clk_in),.rst(reset),.clk_out(clk_out));
counter mycount(clk_out,reset,sel);
always @(sel) begin
case(sel)
            2'b00 : anode = 4'b1110;
            2'b01 : anode = 4'b1101;
            2'b10 : anode = 4'b1011;
            2'b11 : anode = 4'b0111;
       endcase
end
always @(sel) begin
case(sel)
0 : dp = 1;
1 : dp = 1;
2 : dp = 0;
3 : dp = 1;
endcase
end
wire [6:0] seg1,seg2,seg3,seg4;
decoder d1(digit4,seg1);
decoder d2(digit3,seg2);
decoder d3(digit2,seg3);
decoder d4(digit1,seg4);
reg [3:0]first = 0, second = 0, third = 0, fourth = 0;
always @(posedge reset) begin
    seg = 7'b1111110;
    digit1 = 0;
    digit2 = 0;
    digit3 = 0;
    digit4 = 0;
    first = 0;
    second = 0;
    third = 0;
    fourth = 0;
end
always @(sel) begin
case(sel)
0: seg = seg1;
1: seg = seg2;
2: seg = seg3;
3: seg = seg4;
endcase
end
always @(posedge B1) begin
    if (first == 4'b1001) begin
        first = 4'b0000;
        digit1 = first;
end
else begin
        first = first + 1;
        digit1 = first;
    end
end

always @(posedge B2) begin
    if (second == 4'b1001) begin
        second = 4'b0000;
        digit2 = second;
end
else begin
        second = second + 1;
        digit2 = second;
    end
end

always @(posedge B3) begin
    if (third == 4'b1001) begin
        third = 4'b0000;
        digit3 = third;
end
else begin
        third = third + 1;
        digit3 = third;
    end
end

always @(posedge B4) begin
    if (fourth == 4'b1001) begin
        fourth = 4'b0000;
        digit4 = fourth;
end
else begin
        fourth = fourth + 1;
        digit4 = fourth;
    end
end
reg [6:0] num1, num2;
reg [7:0] addition;
reg [8:0] subtraction;
always @(posedge B5) begin
    num1 = first*10 + second;
    num2 = third*10 + fourth;
    addition = num1 + num2;
    digit1 = 0;
    digit4 = addition % 10;
    addition = addition/10;
    digit3 = addition%10;
    addition = addition/10;
    digit2 = addition%10;
end

always @(posedge B6) begin
    num1 = first*10 + second;
    num2 = third*10 + fourth;
    if (num1 > num2 | num2 == num1) begin
       subtraction = num1-num2; 
       digit1 = 0;
       digit4 = subtraction % 10;
       subtraction = subtraction/10;
       digit3 = subtraction%10;
       subtraction = subtraction/10;
       digit2 = subtraction%10;
    end
    else begin
        
       subtraction = num2 - num1;
       digit1 = 10;
       digit4 = subtraction % 10;
       subtraction = subtraction/10;
       digit3 = subtraction%10;
       subtraction = subtraction/10;
       digit2 = subtraction%10;
    end
end

reg [13:0] multiplication;

always @(posedge B7) begin
    num1 = first*10 + second;
    num2 = third*10 + fourth;
    multiplication = num1 * num2;
    digit4 = multiplication % 10;
    multiplication = multiplication/10;
    digit3 = multiplication%10;
    multiplication = multiplication/10;
    digit2 = multiplication%10;
    multiplication = multiplication/10;
    digit1 = multiplication%10;
end

reg [6:0] division;

always @(posedge B8) begin
    num1 = first*10 + second;
    num2 = third*10 + fourth;
    if (num1 == 0) begin
        division = 0;
    end
    else begin
        division = num1/num2;
        digit1 = 0;
        digit2 = 0;
        digit4 = division % 10;
        division = division/10;
        digit3 = division%10;
    end
end

always @(posedge B9) begin
    digit1 = first;
    digit2 = second;
    digit3 = third;
    digit4 = fourth;
end


endmodule
