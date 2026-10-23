-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity z_register is
  port (CLK, RESET, LOAD, D : in std_logic; Q : out std_logic);
end z_register;

architecture Structural of z_register is
  signal nd, nq : std_logic;
begin
  -- Store NOT(Z) so the reusable reset-to-zero register resets Z to one.
  U_INV_IN: entity work.not_gate port map (D, nd);
  U_REG: entity work.reg_1bit port map (CLK, RESET, LOAD, nd, nq);
  U_INV_OUT: entity work.not_gate port map (nq, Q);
end Structural;
