-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_8bit is
  port (CLK, RESET, LOAD : in std_logic; D : in std_logic_vector(7 downto 0); Q : out std_logic_vector(7 downto 0));
end reg_8bit;

architecture Structural of reg_8bit is

begin
  bits: for i in 0 to 7 generate
    U: entity work.reg_1bit port map (CLK, RESET, LOAD, D(i), Q(i));
  end generate;
end Structural;
