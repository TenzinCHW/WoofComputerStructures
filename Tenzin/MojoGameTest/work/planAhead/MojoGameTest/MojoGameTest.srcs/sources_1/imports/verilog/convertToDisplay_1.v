/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module convertToDisplay_1 (
    input [399:0] map,
    input [399:0] position,
    output reg [255:0] out
  );
  
  
  
  reg [255:0] placehold;
  
  integer loop;
  
  always @* begin
    for (loop = 2'h2; loop < 5'h12; loop = loop + 1'h1) begin
      placehold[(loop - 2'h2)*16+15-:16] = map[(loop)*20+2+15-:16] + position[(loop)*20+2+15-:16];
    end
    out = ~placehold;
  end
endmodule
