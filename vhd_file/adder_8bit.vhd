-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_8bit is
  port (A, B : in std_logic_vector(7 downto 0); CIN : in std_logic; SUM : out std_logic_vector(7 downto 0); COUT : out std_logic);
end adder_8bit;

architecture Structural of adder_8bit is
  signal c : std_logic;
begin
  LOW4: entity work.adder_4bit port map (A(3 downto 0), B(3 downto 0), CIN, SUM(3 downto 0), c);
  HIGH4: entity work.adder_4bit port map (A(7 downto 4), B(7 downto 4), c, SUM(7 downto 4), COUT);
end Structural;
