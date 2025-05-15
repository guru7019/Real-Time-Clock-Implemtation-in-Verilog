`timescale 1s/10ms
`include "rtc_one.v"
module real_time_clock_test;
    reg rst, clk;
    wire [5:0] sec;
    wire [5:0] min;
    wire [3:0] hours;

    real_time_clock_dut dut (clk, rst, sec, min, hours);

    
    always begin
        #0.5 clk = ~clk;
    end

    initial begin
        clk = 0;
        rst = 1;
        #2 rst = 0; 
        #43200 $finish;
    end
endmodule
