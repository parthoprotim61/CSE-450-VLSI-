-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4 is
  port (A, B, C, D : in std_logic; S : in std_logic_vector(1 downto 0); Y : out std_logic);
end mux4;

architecture Structural of mux4 is
  signal t0, t1 : std_logic;
begin
  U1: entity work.mux2 port map (A, B, S(0), t0);
  U2: entity work.mux2 port map (C, D, S(0), t1);
  U3: entity work.mux2 port map (t0, t1, S(1), Y);
end Structural;
