-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_rom is
  port (PC : in std_logic_vector(3 downto 0); INSTR : out std_logic_vector(11 downto 0));
end program_rom;

architecture Behavioral of program_rom is
  type rom_type is array (0 to 15) of std_logic_vector(11 downto 0);
  constant ROM : rom_type := (
    0 => x"13C", -- LDI 3C
    1 => x"20F", -- ADD 0F
    2 => x"30B", -- SUB 0B
    3 => x"4F0", -- AND F0
    4 => x"50A", -- OR  0A
    5 => x"34A", -- SUB 4A
    6 => x"301", -- SUB 01
    others => x"000");
begin
  process(PC)
  begin
    -- Safe simulation startup before the first synchronous reset edge.
    INSTR <= x"000";
    if not is_x(PC) then INSTR <= ROM(to_integer(unsigned(PC))); end if;
  end process;
end Behavioral;
