library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1_tb is
end mux_2to1_tb;

architecture Behavioral of mux_2to1_tb is
    component mux_2to1
        Port ( i0 : in STD_LOGIC;
               i1 : in STD_LOGIC;
               s : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;
    
    signal i0, i1, s, y : STD_LOGIC;
begin
    uut: mux_2to1 port map (i0 => i0, i1 => i1, s => s, y => y);
    
    stim: process
    begin
        i0 <= '1'; i1 <= '0';
        s <= '0'; wait for 10 ns;
        s <= '1'; wait for 10 ns;
        wait;
    end process;
end Behavioral;
