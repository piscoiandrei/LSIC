`timescale 1ms / 1ns

module counter (
    input clk,
    input rst,
    output [9:0] seconds,
    output tick
);

  reg [31:0] cnt_nxt, cnt_ff;
  reg tick_nxt, tick_ff;
  reg [9:0] sec_cnt_nxt, sec_cnt_ff;

  always @(*) begin
    sec_cnt_nxt = sec_cnt_ff;
    cnt_nxt = cnt_ff + 1;
    tick_nxt = 0;

    if (cnt_ff + 1 == 2_500_000) begin
      cnt_nxt = 0;
      sec_cnt_nxt = sec_cnt_ff + 1;
      tick_nxt = 1;
    end
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      cnt_ff <= 0;
      sec_cnt_ff <= 0;
      tick_ff <= 0;
    end else begin
      cnt_ff <= cnt_nxt;
      sec_cnt_ff <= sec_cnt_nxt;
      tick_ff <= tick_nxt;
    end
  end
  
  assign seconds = sec_cnt_ff;
  assign tick = tick_ff;
endmodule
