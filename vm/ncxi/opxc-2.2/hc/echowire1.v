module  echowire1 ( input  wire dtr,
                  input  wire rts,
                  input  wire rx,
                  output  wire tx,
                  output  wire D1,
                  output  wire D2);

// - Get dtr and rts signal through the leds 
assign D1 = dtr;
assign D2 = rts;

// - Connect rx to tx to echo "hardwired" 
assign tx = rx;

endmodule

