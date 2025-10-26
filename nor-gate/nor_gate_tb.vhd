library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_gate_tb is
end nor_gate_tb;

architecture Behavioral of nor_gate_tb is
    component nor_gate
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;
    
    signal a, b, y : STD_LOGIC;
begin
    uut: nor_gate port map (a => a, b => b, y => y);
    
    stim: process
    begin
        a <= '0'; b <= '0'; wait for 10 ns;
        a <= '0'; b <= '1'; wait for 10 ns;
        a <= '1'; b <= '0'; wait for 10 ns;
        a <= '1'; b <= '1'; wait for 10 ns;
        wait;
    end process;
end Behavioral;
