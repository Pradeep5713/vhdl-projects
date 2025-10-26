library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4to1 is
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           i2 : in STD_LOGIC;
           i3 : in STD_LOGIC;
           s : in STD_LOGIC_VECTOR(1 downto 0);
           y : out STD_LOGIC);
end mux_4to1;

architecture Behavioral of mux_4to1 is
begin
    y <= i0 when s = "00" else
         i1 when s = "01" else
         i2 when s = "10" else
         i3;
end Behavioral;
