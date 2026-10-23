-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
  port (A, B : in std_logic; Y : out std_logic);
end and_gate;

architecture Structural of and_gate is
  signal na, nb : std_logic;
begin
  U1: entity work.not_gate port map (A, na);
  U2: entity work.not_gate port map (B, nb);
  U3: entity work.nor_gate port map (na, nb, Y);
end Structural;
