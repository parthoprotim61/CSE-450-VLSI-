-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_1bit is
  port (CLK, RESET, LOAD, D : in std_logic; Q : out std_logic);
end reg_1bit;

architecture Structural of reg_1bit is
  signal q_int, selected, next_d : std_logic;
begin
  U_LOAD: entity work.mux2 port map (q_int, D, LOAD, selected);
  U_RESET: entity work.mux2 port map (selected, '0', RESET, next_d);
  U_FF: entity work.d_ff port map (CLK, next_d, q_int);
  Q <= q_int;
end Structural;
