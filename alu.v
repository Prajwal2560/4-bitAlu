`timescale 1ns / 1ps

module alu (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] S,
    output [3:0] Y,
    output      N,
    output      Z,
    output      V
);

    reg [3:0] result;
    reg       overflow;

    wire [4:0] sum;
    wire [3:0] diff;
    
    assign sum = {1'b0, A} + {1'b0, B};
    assign diff = A - B;

    always @(*) begin
        overflow = 0;
        case (S)
            3'b000: begin
                result = sum[3:0];
                overflow = sum[4];
            end
            3'b001: begin
                result = diff;
                overflow = (~A[3] & B[3] & diff[3]) | (A[3] & ~B[3] & ~diff[3]);
            end
            3'b010: begin
                result = A & B;
            end
            3'b011: begin
                result = A | B;
            end
            3'b100: begin
                result = A ^ B;
            end
            3'b101: begin
                result = ~A;
            end
            3'b110: begin
                result = A << 1;
            end
            3'b111: begin
                result = A >> 1;
            end
            default: result = 4'b0000;
        endcase
    end

    assign Y = result;
    assign N = result[3];
    assign Z = (result == 4'b0000);
    assign V = overflow;

endmodule