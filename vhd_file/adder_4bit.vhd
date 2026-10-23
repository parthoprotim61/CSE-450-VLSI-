-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_4bit is
  port (A, B : in std_logic_vector(3 downto 0); CIN : in std_logic; SUM : out std_logic_vector(3 downto 0); COUT : out std_logic);
end adder_4bit;

architecture Structural of adder_4bit is
  signal c : std_logic_vector(4 downto 0);
begin
  c(0) <= CIN;
  bits: for i in 0 to 3 generate
    U: entity work.full_adder port map (A(i), B(i), c(i), SUM(i), c(i+1));
  end generate;
  COUT <= c(4);
end Structural;
