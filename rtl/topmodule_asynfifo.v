module async_fifo(
    input wclk,
    input rclk,
    input wrst_n,
    input rrst_n,
    input winc,
    input rinc,
    input [7:0] wdata,

    output [7:0] rdata,
    output wfull,
    output rempty
);

wire [4:0] wbin;
wire [4:0] rbin;

wire [4:0] wptr;
wire [4:0] rptr;

wire [4:0] wq2_rptr;
wire [4:0] rq2_wptr;

wire [3:0] waddr;
wire [3:0] raddr;


/*-------------------------
  Write Pointer
--------------------------*/
write_pointer wp(
    .wclk(wclk),
    .wrst_n(wrst_n),
    .winc(winc),
    .wfull(wfull),
    .wbin(wbin)
);


/*-------------------------
  Read Pointer
--------------------------*/
read_pointer rp(
    .rclk(rclk),
    .rrst_n(rrst_n),
    .rinc(rinc),
    .rempty(rempty),
    .rbin(rbin)
);


/*-------------------------
  Binary -> Gray
--------------------------*/
write_gray wg(
    .wbin(wbin),
    .wptr(wptr)
);

read_gray rg(
    .rbin(rbin),
    .rptr(rptr)
);


/*-------------------------
  Synchronizers
--------------------------*/
sync_r2w sr2w(
    .wclk(wclk),
    .wrst_n(wrst_n),
    .rptr(rptr),
    .wq2_rptr(wq2_rptr)
);

sync_w2r sw2r(
    .rclk(rclk),
    .rrst_n(rrst_n),
    .wptr(wptr),
    .rq2_wptr(rq2_wptr)
);


/*-------------------------
  Empty Logic
--------------------------*/
empty_logic emp(
    .rptr(rptr),
    .rq2_wptr(rq2_wptr),
    .rempty(rempty)
);


/*-------------------------
  Full Logic
--------------------------*/
full_logic ful(
    .wptr(wptr),
    .wq2_rptr(wq2_rptr),
    .wfull(wfull)
);


/*-------------------------
  Address Generation
--------------------------*/
assign waddr = wbin[3:0];
assign raddr = rbin[3:0];


/*-------------------------
  FIFO Memory
--------------------------*/
fifomem mem(
    .wclk(wclk),
    .wclken(winc && !wfull),
    .waddr(waddr),
    .raddr(raddr),
    .wdata(wdata),
    .rdata(rdata)
);

endmodule