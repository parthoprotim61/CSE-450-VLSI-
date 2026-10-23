-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_detect_8bit is
  port (A : in std_logic_vector(7 downto 0); Z : out std_logic);
end zero_detect_8bit;

architecture Structural of zero_detect_8bit is
  signal t : std_logic_vector(5 downto 0);
begin
  U1: entity work.or_gate port map (A(0), A(1), t(0));
  U2: entity work.or_gate port map (A(2), A(3), t(1));
  U3: entity work.or_gate port map (A(4), A(5), t(2));
  U4: entity work.or_gate port map (A(6), A(7), t(3));
  U5: entity work.or_gate port map (t(0), t(1), t(4));
  U6: entity work.or_gate port map (t(2), t(3), t(5));
  U7: entity work.nor_gate port map (t(4), t(5), Z);
end Structural;
