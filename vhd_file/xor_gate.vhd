-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate is
  port (A, B : in std_logic; Y : out std_logic);
end xor_gate;

architecture Structural of xor_gate is
  signal t : std_logic;
begin
  U1: entity work.xnor_gate port map (A, B, t);
  U2: entity work.not_gate port map (t, Y);
end Structural;
