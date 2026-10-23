-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
  port (A, B, CIN : in std_logic; SUM, COUT : out std_logic);
end full_adder;

architecture Structural of full_adder is
  signal s0, c0, c1 : std_logic;
begin
  U1: entity work.half_adder port map (A, B, s0, c0);
  U2: entity work.half_adder port map (s0, CIN, SUM, c1);
  U3: entity work.or_gate port map (c0, c1, COUT);
end Structural;
