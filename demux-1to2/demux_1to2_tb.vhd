library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_1to2_tb is
end demux_1to2_tb;

architecture Behavioral of demux_1to2_tb is
    component demux_1to2
        Port ( i : in STD_LOGIC;
               s : in STD_LOGIC;
               y0 : out STD_LOGIC;
               y1 : out STD_LOGIC);
    end component;
    
    signal i, s, y0, y1 : STD_LOGIC;
begin
    uut: demux_1to2 port map (i => i, s => s, y0 => y0, y1 => y1);
    
    stim: process
    begin
        i <= '1';
        s <= '0'; wait for 10 ns;
        s <= '1'; wait for 10 ns;
        wait;
    end process;
end Behavioral;
