-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_counter is
  port (CLK, RESET : in std_logic; PC : out std_logic_vector(3 downto 0));
end program_counter;

architecture Structural of program_counter is
  signal current_pc, next_pc : std_logic_vector(3 downto 0);
  signal unused_carry : std_logic;
begin
  -- Set 1 has no JZ: increment modulo 16 every non-reset rising edge.
  U_INC: entity work.adder_4bit port map (current_pc, "0001", '0', next_pc, unused_carry);
  U_REG: entity work.reg_4bit port map (CLK, RESET, '1', next_pc, current_pc);
  PC <= current_pc;
end Structural;
