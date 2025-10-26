library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1 is
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           s : in STD_LOGIC;
           y : out STD_LOGIC);
end mux_2to1;

architecture Behavioral of mux_2to1 is
begin
    y <= i0 when s = '0' else i1;
end Behavioral;
