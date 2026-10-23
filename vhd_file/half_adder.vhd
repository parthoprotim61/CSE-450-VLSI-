-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
  port (A, B : in std_logic; SUM, CARRY : out std_logic);
end half_adder;

architecture Structural of half_adder is

begin
  U1: entity work.xor_gate port map (A, B, SUM);
  U2: entity work.and_gate port map (A, B, CARRY);
end Structural;
