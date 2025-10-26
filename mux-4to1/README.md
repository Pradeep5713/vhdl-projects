# 4-to-1 Multiplexer Project

## Description
This folder contains the VHDL implementation of a 4-to-1 multiplexer.

## Files
- `mux_4to1.vhd` - Main VHDL source code (to be uploaded)
- `mux_4to1_tb.vhd` - Testbench for simulation (to be uploaded)
- `README.md` - This documentation file

## Truth Table
| I0 | I1 | I2 | I3 | S1 | S0 | Y |
|----|----|----|----|----|----|---|
| 0  | X  | X  | X  | 0  | 0  | 0 |
| 1  | X  | X  | X  | 0  | 0  | 1 |
| X  | 0  | X  | X  | 0  | 1  | 0 |
| X  | 1  | X  | X  | 0  | 1  | 1 |
| X  | X  | 0  | X  | 1  | 0  | 0 |
| X  | X  | 1  | X  | 1  | 0  | 1 |
| X  | X  | X  | 0  | 1  | 1  | 0 |
| X  | X  | X  | 1  | 1  | 1  | 1 |

## Status
Placeholder created. Source and testbench files pending upload.
