library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4to1_tb is
end mux_4to1_tb;

architecture Behavioral of mux_4to1_tb is
    component mux_4to1
        Port ( i0 : in STD_LOGIC;
               i1 : in STD_LOGIC;
               i2 : in STD_LOGIC;
               i3 : in STD_LOGIC;
               s : in STD_LOGIC_VECTOR(1 downto 0);
               y : out STD_LOGIC);
    end component;
    
    signal i0, i1, i2, i3, y : STD_LOGIC;
    signal s : STD_LOGIC_VECTOR(1 downto 0);
begin
    uut: mux_4to1 port map (i0 => i0, i1 => i1, i2 => i2, i3 => i3, s => s, y => y);
    
    stim: process
    begin
        i0 <= '1'; i1 <= '0'; i2 <= '1'; i3 <= '0';
        s <= "00"; wait for 10 ns;
        s <= "01"; wait for 10 ns;
        s <= "10"; wait for 10 ns;
        s <= "11"; wait for 10 ns;
        wait;
    end process;
end Behavioral;
