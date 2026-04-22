# 4-bit ALU Specification

## Overview
A 4-bit Arithmetic Logic Unit (ALU) supporting 8 basic operations.

## Interface

### Inputs
- `A[3:0]`: 4-bit operand A
- `B[3:0]`: 4-bit operand B
- `S[2:0]`: 3-bit operation select

### Outputs
- `Y[3:0]`: 4-bit result
- `N`: Negative flag (result bit 3)
- `Z`: Zero flag (result is 0)
- `V`: Overflow flag

## Operations

| S[2:0] | Operation | Description |
|--------|------------|-------------|
| 000    | A + B      | Addition    |
| 001    | A - B      | Subtraction |
| 010    | A & B      | AND         |
| 011    | A \| B     | OR          |
| 100    | A ^ B      | XOR         |
| 101    | ~A         | NOT         |
| 110    | A << 1     | Shift left  |
| 111    | A >> 1     | Shift right |

## Implementation
- Use behavioral modeling for synthesis
- Generate flags combinatorially
- Handle overflow detection for 2's complement operations