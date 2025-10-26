-- ============================================================================
-- File: half_adder_tb.vhd
-- Description: Testbench for Half Adder
-- Author: Pradeep5713
-- Date: October 26, 2025
-- ============================================================================
-- This testbench verifies the functionality of the half adder by testing
-- all possible input combinations (00, 01, 10, 11) and checking that the
-- Sum and Carry outputs match the expected values.
-- ============================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration (Testbench has no ports)
entity half_adder_tb is
end half_adder_tb;

-- Architecture Definition
architecture Behavioral of half_adder_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component half_adder
        Port (
            A     : in  STD_LOGIC;
            B     : in  STD_LOGIC;
            Sum   : out STD_LOGIC;
            Carry : out STD_LOGIC
        );
    end component;
    
    -- Signals to connect to UUT
    signal A_tb     : STD_LOGIC := '0';
    signal B_tb     : STD_LOGIC := '0';
    signal Sum_tb   : STD_LOGIC;
    signal Carry_tb : STD_LOGIC;
    
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: half_adder
        Port map (
            A     => A_tb,
            B     => B_tb,
            Sum   => Sum_tb,
            Carry => Carry_tb
        );
    
    -- Stimulus Process
    stim_proc: process
    begin
        -- Test Case 1: A=0, B=0
        -- Expected: Sum=0, Carry=0
        A_tb <= '0';
        B_tb <= '0';
        wait for 10 ns;
        assert (Sum_tb = '0' and Carry_tb = '0')
            report "Test Case 1 Failed: A=0, B=0" severity error;
        
        -- Test Case 2: A=0, B=1
        -- Expected: Sum=1, Carry=0
        A_tb <= '0';
        B_tb <= '1';
        wait for 10 ns;
        assert (Sum_tb = '1' and Carry_tb = '0')
            report "Test Case 2 Failed: A=0, B=1" severity error;
        
        -- Test Case 3: A=1, B=0
        -- Expected: Sum=1, Carry=0
        A_tb <= '1';
        B_tb <= '0';
        wait for 10 ns;
        assert (Sum_tb = '1' and Carry_tb = '0')
            report "Test Case 3 Failed: A=1, B=0" severity error;
        
        -- Test Case 4: A=1, B=1
        -- Expected: Sum=0, Carry=1
        A_tb <= '1';
        B_tb <= '1';
        wait for 10 ns;
        assert (Sum_tb = '0' and Carry_tb = '1')
            report "Test Case 4 Failed: A=1, B=1" severity error;
        
        -- Display success message
        report "All test cases passed successfully!" severity note;
        
        -- End simulation
        wait;
    end process;
    
end Behavioral;
