-- ============================================================================
-- File: half_adder.vhd
-- Description: Half Adder implementation in VHDL
-- Author: Pradeep5713
-- Date: October 26, 2025
-- ============================================================================
-- A half adder adds two single binary digits (A and B) and produces two
-- outputs: Sum and Carry.
-- Truth Table:
--   A | B | Sum | Carry
--  ---|---|-----|------
--   0 | 0 |  0  |  0
--   0 | 1 |  1  |  0
--   1 | 0 |  1  |  0
--   1 | 1 |  0  |  1
-- ============================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration
entity half_adder is
    Port (
        A     : in  STD_LOGIC;  -- First input bit
        B     : in  STD_LOGIC;  -- Second input bit
        Sum   : out STD_LOGIC;  -- Sum output
        Carry : out STD_LOGIC   -- Carry output
    );
end half_adder;

-- Architecture Definition
architecture Behavioral of half_adder is
begin
    -- Sum is A XOR B
    Sum <= A xor B;
    
    -- Carry is A AND B
    Carry <= A and B;
    
end Behavioral;
