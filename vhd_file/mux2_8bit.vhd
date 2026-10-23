-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_8bit is
  port (A, B : in std_logic_vector(7 downto 0); S : in std_logic; Y : out std_logic_vector(7 downto 0));
end mux2_8bit;

architecture Structural of mux2_8bit is

begin
  bits: for i in 0 to 7 generate
    U: entity work.mux2 port map (A(i), B(i), S, Y(i));
  end generate;
end Structural;
