`timescale 1ns/1ps

module tb_async_fifo;

reg wclk;
reg rclk;
reg wrst_n;
reg rrst_n;
reg winc;
reg rinc;
reg [7:0] wdata;

wire [7:0] rdata;
wire wfull;
wire rempty;

async_fifo dut(
.wclk(wclk),
.rclk(rclk),
.wrst_n(wrst_n),
.rrst_n(rrst_n),
.winc(winc),
.rinc(rinc),
.wdata(wdata),
.rdata(rdata),
.wfull(wfull),
.rempty(rempty)
);

// Write Clock = 10ns
initial begin
wclk = 0;
forever #5 wclk = ~wclk;
end

// Read Clock = 14ns
initial begin
rclk = 0;
forever #7 rclk = ~rclk;
end

initial begin


wrst_n = 0;
rrst_n = 0;
winc   = 0;
rinc   = 0;
wdata  = 0;

#30;

wrst_n = 1;
rrst_n = 1;

// Write 8 values

repeat(8)
begin
    @(posedge wclk);
    winc  = 1;
    wdata = wdata + 8'd10;
end

@(posedge wclk);
winc = 0;

#50;

// Read 8 values

repeat(8)
begin
    @(posedge rclk);
    rinc = 1;
end

@(posedge rclk);
rinc = 0;

#100;

$finish;


end

initial begin


$display("TIME\tWDATA\tRDATA\tWFULL\tREMPTY");

$monitor("%0t\t%d\t%d\t%b\t%b",
          $time,
          wdata,
          rdata,
          wfull,
          rempty);

end

endmodule
