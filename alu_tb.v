`timescale 1ns / 1ps

module alu_tb;

    reg  [3:0] A, B;
    reg  [2:0] S;
    wire [3:0] Y;
    wire      N, Z, V;

    alu uut (.A(A), .B(B), .S(S), .Y(Y), .N(N), .Z(Z), .V(V));

    initial begin
        $display("Time\tA\tB\tS\tY\tN\tZ\tV");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, A, B, S, Y, N, Z, V);
        
        // Test Addition (000)
        A = 4'b0101; B = 4'b0011; S = 3'b000; #10;
        
        // Test Subtraction (001)
        A = 4'b1000; B = 4'b0010; S = 3'b001; #10;
        
        // Test AND (010)
        A = 4'b1100; B = 4'b1010; S = 3'b010; #10;
        
        // Test OR (011)
        A = 4'b1100; B = 4'b1010; S = 3'b011; #10;
        
        // Test XOR (100)
        A = 4'b1100; B = 4'b1010; S = 3'b100; #10;
        
        // Test NOT (101)
        A = 4'b1010; S = 3'b101; #10;
        
        // Test Shift Left (110)
        A = 4'b0011; S = 3'b110; #10;
        
        // Test Shift Right (111)
        A = 4'b1100; S = 3'b111; #10;
        
        // Test Zero flag
        A = 4'b0001; B = 4'b0001; S = 3'b001; #10;
        
        // Test Negative flag
        A = 4'b1000; B = 4'b0100; S = 3'b001; #10;
        
        $display("All tests completed!");
        $finish;
    end

endmodule