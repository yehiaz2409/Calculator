`timescale 1ns / 1ps


module counter(input clk,reset,output reg[1:0] sel);
always @(posedge reset) begin
    sel = 0;
end
always @(posedge clk) begin
    if (sel == 3) begin
        sel = 0;
    end
    else begin
        sel = sel + 1;
    end
end
endmodule
