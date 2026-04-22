# 4-bit ALU (Arithmetic Logic Unit)

A simple 4-bit ALU implementation in Verilog for Xilinx FPGAs.

## Features

- **8 Operations**: Add, Subtract, AND, OR, XOR, NOT, Shift Left, Shift Right
- **4-bit operands** with carry/overflow detection
- **Status flags**: Negative (N), Zero (Z), Overflow (V)
- **Behavioral modeling** for synthesis

## Operations

| Select (S) | Operation | Description |
|------------|-----------|-------------|
| 000 | A + B | Addition |
| 001 | A - B | Subtraction |
| 010 | A & B | Bitwise AND |
| 011 | A \| B | Bitwise OR |
| 100 | A ^ B | Bitwise XOR |
| 101 | ~A | Bitwise NOT |
| 110 | A << 1 | Shift Left |
| 111 | A >> 1 | Shift Right |

## Interface

### Inputs
- `A[3:0]` - 4-bit operand A
- `B[3:0]` - 4-bit operand B  
- `S[2:0]` - Operation select

### Outputs
- `Y[3:0]` - 4-bit result
- `N` - Negative flag (result[3])
- `Z` - Zero flag (Y == 0)
- `V` - Overflow flag

## Target Board

Xilinx Spartan-7 SP701 (xc7s100fgga484-2)

## Project Structure

```
4bitalu/
├── alu.v           # ALU module
├── alu_tb.v        # Testbench
├── alu_constraints.xdc  # Pin constraints
├── SPEC.md         # Specification
└── README.md       # This file
```

## Simulation

1. Open in Vivado
2. Run: **Run Simulation** → **Behavioral Simulation**
3. Check waveform output

## Synthesis

1. Open in Vivado
2. Run: **Run Synthesis**
3. Run: **Generate Bitstream**

## License

MIT