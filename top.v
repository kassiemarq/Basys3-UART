//-------------top module--------------------
`timescale 1ns / 1ps

module top(
    input clk,
    input RsRx,
    output RsTx
    );
    
    wire [7:0] data;
    wire dv;
    
    parameter CLKS_PER_BIT = 10416;
    
    uart_rx #(.CLKS_PER_BIT(CLKS_PER_BIT)) uut0 (.i_Clock(clk), .i_Rx_Serial(RsRx), .o_Rx_Byte(data), .o_Rx_DV(dv));
    
    uart_tx #(.CLKS_PER_BIT(CLKS_PER_BIT)) uut1 (.i_Clock(clk), .i_Tx_Byte(data), .o_Tx_Serial(RsTx), .i_Tx_DV(dv));
    
endmodule
//----------------------------------------

