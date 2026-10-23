-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
  port (OPCODE : in std_logic_vector(3 downto 0); ALU_SEL : out std_logic_vector(2 downto 0); ACC_LOAD, Z_LOAD : out std_logic);
end control_unit;

architecture Behavioral of control_unit is

begin
  -- ALU_SEL: 000=LDI, 001=ADD, 010=SUB, 011=AND, 100=OR.
  process(OPCODE)
  begin
    ALU_SEL <= "000"; ACC_LOAD <= '0'; Z_LOAD <= '0';
    case OPCODE is
      when "0001" => ALU_SEL <= "000"; ACC_LOAD <= '1'; Z_LOAD <= '1';
      when "0010" => ALU_SEL <= "001"; ACC_LOAD <= '1'; Z_LOAD <= '1';
      when "0011" => ALU_SEL <= "010"; ACC_LOAD <= '1'; Z_LOAD <= '1';
      when "0100" => ALU_SEL <= "011"; ACC_LOAD <= '1'; Z_LOAD <= '1';
      when "0101" => ALU_SEL <= "100"; ACC_LOAD <= '1'; Z_LOAD <= '1';
      when others => null; -- ALL unsupported opcodes are NOP.
    end case;
  end process;
end Behavioral;
