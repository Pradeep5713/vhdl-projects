library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_gate is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           y : out STD_LOGIC);
end nand_gate;

architecture Behavioral of nand_gate is
begin
    y <= a nand b;
end Behavioral;
