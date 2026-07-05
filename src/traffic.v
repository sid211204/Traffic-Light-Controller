`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2026 10:00:09 PM
// Design Name: 
// Module Name: traffic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module traffic(north_light,west_light,south_light,east_light,rst,clk);
    output reg [2:0] north_light,west_light,south_light,east_light;
    input clk;
    input rst;

    reg [2:0]state;
    parameter [2:0] north=3'b000, north_yellow=3'b001, west=3'b010, west_yellow=3'b011, south=3'b100, south_yellow=3'b101, east=3'b110, east_yellow=3'b111;
    reg [3:0] count;
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            count<=4'b0000;
            state<=north;
        end
        else begin
            case(state)
            north: begin
                if(count==4'b1111) begin
                    state<=north_yellow;
                    count<=4'b0000;
                end
                else begin
                    count<=count+4'b0001;
                    state<=north;
                end
             end
            north_yellow:
             begin
                if(count==4'b0011) begin
                    state<=west;
                    count<=4'b0000;
                end
                else begin
                    count<=count+4'b0001;
                    state<=north_yellow;
                end
            end
            west:
             begin
                if(count==4'b1111) begin
                    state<=west_yellow;
                    count<=4'b0000;
                end
                else begin
                    count<=count+4'b0001;
                    state<=west;
                end
             end
             west_yellow:
             begin
                if(count==4'b0011) begin
                    state<=south;
                    count<=4'b0000;
                end
                else begin
                    count<=count+4'b0001;
                    state<=west_yellow;
                end
             end
             south:
             begin
                if(count==4'b1111) begin
                    state<=south_yellow;
                    count<=4'b0000;
                end
                else begin
                    count<=count+4'b0001;
                    state<=south;
                end
             end
            south_yellow:
             begin
                if(count==4'b0011) begin
                    state<=east;
                    count<=4'b0000;
                end
                else begin
                    count<=count+4'b0001;
                    state<=south_yellow;
                end
             end
             east:
             begin
                if(count==4'b1111) begin
                    state<=east_yellow;
                    count<=4'b0000;
                end
                else begin
                    count<=count+4'b0001;
                    state<=east;
                end
             end
             east_yellow:
             begin
                if(count==4'b0011) begin
                    state<=north;
                    count<=4'b0000;
                end
                else begin
                    count<=count+4'b0001;
                    state<=east_yellow;
                end
             end
             endcase
           end
           end
           
       always@(state) begin
       case(state)
        north:
            begin
            north_light=3'b001;
            west_light=3'b100;
            south_light=3'b100;
            east_light=3'b100;
            end
         north_yellow:
         begin
          north_light=3'b010;
            west_light=3'b100;
            south_light=3'b100;
            east_light=3'b100;
            end
          south:
          begin
          north_light=3'b100;
            west_light=3'b100;
            south_light=3'b001;
            east_light=3'b100;
            end
          south_yellow:
         begin
          north_light=3'b100;
            west_light=3'b100;
            south_light=3'b010;
            east_light=3'b100;
            end
            west:
         begin
          north_light=3'b100;
            west_light=3'b001;
            south_light=3'b100;
            east_light=3'b100;
            end
            west_yellow:
         begin
          north_light=3'b100;
            west_light=3'b010;
            south_light=3'b100;
            east_light=3'b100;
            end
            east:
         begin
          north_light=3'b100;
            west_light=3'b100;
            south_light=3'b100;
            east_light=3'b001;
            end
            east_yellow:
         begin
          north_light=3'b100;
            west_light=3'b100;
            south_light=3'b100;
            east_light=3'b010;
            end
            
          endcase
          end
         
endmodule
