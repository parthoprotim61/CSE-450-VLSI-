-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
  port (A, B, S : in std_logic; Y : out std_logic);
end mux2;

architecture Structural of mux2 is
  signal ns, t0, t1 : std_logic;
begin
  U1: entity work.not_gate port map (S, ns);
  U2: entity work.and_gate port map (A, ns, t0);
  U3: entity work.and_gate port map (B, S, t1);
  U4: entity work.or_gate port map (t0, t1, Y);
end Structural;
