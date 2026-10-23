-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_gate is
  port (A, B : in std_logic; Y : out std_logic);
end nor_gate;

architecture Behavioral of nor_gate is

begin
  Y <= A nor B;
end Behavioral;
