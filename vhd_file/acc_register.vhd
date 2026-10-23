-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity acc_register is
  port (CLK, RESET, LOAD : in std_logic; D : in std_logic_vector(7 downto 0); Q : out std_logic_vector(7 downto 0));
end acc_register;

architecture Structural of acc_register is

begin
  U_REG: entity work.reg_8bit port map (CLK, RESET, LOAD, D, Q);
end Structural;
