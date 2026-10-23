-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_8bit is
  port (A, B : in std_logic_vector(7 downto 0); SEL : in std_logic_vector(2 downto 0); RESULT : out std_logic_vector(7 downto 0); ZERO : out std_logic);
end alu_8bit;

architecture Structural of alu_8bit is
  signal sub_mode, unused_carry : std_logic;
  signal arithmetic_r, and_r, or_r, low_r, result_int : std_logic_vector(7 downto 0);
begin
  -- 010 is SUB; 001 is ADD. Higher-level controls are combinational.
  sub_mode <= '1' when SEL = "010" else '0';
  U_ARITH: entity work.add_sub_8bit port map (A, B, sub_mode, arithmetic_r, unused_carry);
  bits: for i in 0 to 7 generate
    U_AND: entity work.and_gate port map (A(i), B(i), and_r(i));
    U_OR: entity work.or_gate port map (A(i), B(i), or_r(i));
    U_SELECT: entity work.mux4 port map (B(i), arithmetic_r(i), arithmetic_r(i), and_r(i), SEL(1 downto 0), low_r(i));
  end generate;
  U_FINAL: entity work.mux2_8bit port map (low_r, or_r, SEL(2), result_int);
  U_ZERO: entity work.zero_detect_8bit port map (result_int, ZERO);
  RESULT <= result_int;
end Structural;
