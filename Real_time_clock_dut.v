`timescale 1s/10ms
module real_time_clock_dut(clk,rst,sec,min,hours);
input clk,rst;
output reg[5:0] sec;
reg[5:0]t1;
output reg[5:0]min;
reg[5:0]t2;
output reg[3:0]hours;
reg[3:0]t3;
always@(posedge clk) begin
	if (rst)
		t1<=0;
	else if (t1==59)
		t1<=0;
	else
		t1<=t1+1;
	sec<=t1;
end

always@(posedge clk) begin
	if(rst)
		t2<=0;
	else if (t1==59) begin
		if (t2==59)
			t2<=0;
		else
			t2<=t2+1;
		end
	min<=t2;
end

always@(posedge clk) begin
	if(rst)
		t3<=1;
	else if(t1==59 && t2==59)begin
		if(t3==12)
			t3<=1;
		else 
			t3<=t3+1;
		end
	hours<=t3;
end
endmodule
