-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_sub_8bit is
  port (A, B : in std_logic_vector(7 downto 0); SUB : in std_logic; RESULT : out std_logic_vector(7 downto 0); COUT : out std_logic);
end add_sub_8bit;

architecture Structural of add_sub_8bit is
  signal bx : std_logic_vector(7 downto 0);
begin
  -- A - B = A + (B XOR 11111111) + 1; discard final carry in CPU.
  bits: for i in 0 to 7 generate
    U: entity work.xor_gate port map (B(i), SUB, bx(i));
  end generate;
  U_ADD: entity work.adder_8bit port map (A, bx, SUB, RESULT, COUT);
end Structural;
