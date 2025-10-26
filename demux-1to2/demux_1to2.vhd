library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_1to2 is
    Port ( i : in STD_LOGIC;
           s : in STD_LOGIC;
           y0 : out STD_LOGIC;
           y1 : out STD_LOGIC);
end demux_1to2;

architecture Behavioral of demux_1to2 is
begin
    y0 <= i when s = '0' else '0';
    y1 <= i when s = '1' else '0';
end Behavioral;
