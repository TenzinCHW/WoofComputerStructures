/*
   This file was generated automatically by the Mojo IDE version B1.3.4.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_3 (
    output reg [7:0] out,
    output reg [0:0] z,
    output reg [0:0] v,
    output reg [0:0] n,
    input [7:0] a,
    input [7:0] b,
    input [5:0] aLUFN
  );
  
  
  
  reg [7:0] p;
  
  always @* begin
    p = 8'h00;
    
    case (aLUFN[0+0-:1])
      1'h0: begin
        p = a + b;
      end
      1'h1: begin
        p = a - b;
      end
      default: begin
        p = 1'h0;
      end
    endcase
    
    case (p)
      1'h0: begin
        z = 1'h1;
      end
      default: begin
        z = 1'h0;
      end
    endcase
    out = p;
    v = (a[7+0-:1] & (b[7+0-:1] ^ aLUFN[0+0-:1]) & !p[7+0-:1]) | (!a[7+0-:1] & !(b[7+0-:1] ^ aLUFN[0+0-:1]) & p[7+0-:1]);
    n = p[7+0-:1];
  end
endmodule