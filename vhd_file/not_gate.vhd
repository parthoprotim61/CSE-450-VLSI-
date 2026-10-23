-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate is
  port (A : in std_logic; Y : out std_logic);
end not_gate;

architecture Structural of not_gate is

begin
  U1: entity work.nor_gate port map (A, A, Y);
end Structural;
