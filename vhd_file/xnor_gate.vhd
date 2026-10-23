-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xnor_gate is
  port (A, B : in std_logic; Y : out std_logic);
end xnor_gate;

architecture Structural of xnor_gate is
  signal n0, n1, n2 : std_logic;
begin
  U1: entity work.nor_gate port map (A, B, n0);
  U2: entity work.nor_gate port map (A, n0, n1);
  U3: entity work.nor_gate port map (B, n0, n2);
  U4: entity work.nor_gate port map (n1, n2, Y);
end Structural;
