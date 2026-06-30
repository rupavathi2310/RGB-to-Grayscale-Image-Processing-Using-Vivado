module rgb2gray( input [23:0] rgb, output [7:0] gray);
wire [7:0] R;
wire [7:0] G;
wire [7:0] B;
assign R = rgb[23:16];
assign G = rgb[15:8];
assign B = rgb[7:0];
assign gray = ((77*R) + (150*G) + (29*B)) >> 8;
endmodule
