/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module move_1 (
    input [3:0] movement,
    input [399:0] position,
    output reg [399:0] out
  );
  
  
  
  reg [399:0] placehold;
  
  integer loop;
  
  always @* begin
    placehold = 400'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    for (loop = 2'h2; loop < 5'h12; loop = loop + 1'h1) begin
      if ((|position[(loop)*20+19-:20])) begin
        
        case (movement)
          1'h0: begin
            placehold = position;
          end
          1'h1: begin
            placehold[(loop + 1'h1)*20+19-:20] = position[(loop)*20+19-:20];
          end
          2'h2: begin
            placehold[(loop - 1'h1)*20+19-:20] = position[(loop)*20+19-:20];
          end
          3'h4: begin
            placehold[(loop)*20+19-:20] = position[(loop)*20+19-:20] << 1'h1;
          end
          4'h8: begin
            placehold[(loop)*20+19-:20] = position[(loop)*20+19-:20] >> 1'h1;
          end
        endcase
      end
    end
    out = placehold;
  end
endmodule
