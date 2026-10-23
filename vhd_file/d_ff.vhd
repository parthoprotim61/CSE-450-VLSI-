-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_ff is
  port (CLK, D : in std_logic; Q : out std_logic);
end d_ff;

architecture Behavioral of d_ff is

begin
  -- Edge-triggered storage primitive. Infer FPGA flip-flop (not a gate loop).
  process(CLK)
  begin
    if rising_edge(CLK) then Q <= D; end if;
  end process;
end Behavioral;
