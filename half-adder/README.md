# Half Adder Project

## Description
This folder contains the VHDL implementation of a half adder circuit. A half adder adds two single binary digits and produces two outputs: Sum and Carry.

## Files
- `half_adder.vhd` - Main VHDL source code implementing the half adder logic
- `half_adder_tb.vhd` - Comprehensive testbench for simulation and verification
- `README.md` - This documentation file

## Truth Table
| A | B | Sum | Carry |
|---|---|-----|-------|
| 0 | 0 | 0   | 0     |
| 0 | 1 | 1   | 0     |
| 1 | 0 | 1   | 0     |
| 1 | 1 | 0   | 1     |

## Implementation Details
- **Sum Output**: Implemented using XOR gate (A XOR B)
- **Carry Output**: Implemented using AND gate (A AND B)

## Testbench
The testbench (`half_adder_tb.vhd`) verifies all four possible input combinations:
1. A=0, B=0 → Expected: Sum=0, Carry=0
2. A=0, B=1 → Expected: Sum=1, Carry=0
3. A=1, B=0 → Expected: Sum=1, Carry=0
4. A=1, B=1 → Expected: Sum=0, Carry=1

Each test case includes assertions to validate correct functionality.

## Status
✅ **Complete** - Source and testbench files have been added and are ready for use.
