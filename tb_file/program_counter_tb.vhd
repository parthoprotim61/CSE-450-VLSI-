-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity program_counter_tb is end program_counter_tb;
architecture Behavioral of program_counter_tb is
 signal clk,rst: std_logic := '0'; signal pc: std_logic_vector(3 downto 0);
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.program_counter port map(clk,rst,pc);
 process
 begin
 rst<='1'; wait for 1 ns; clk<='1'; wait for 1 ns; assert pc="0000" severity failure;
 rst<='0';
 for i in 1 to 32 loop
 clk<='0'; wait for 1 ns; clk<='1'; wait for 1 ns;
 assert to_integer(unsigned(pc))=i mod 16 severity failure;
 end loop;
 report "PASS: program_counter" severity note;
 wait;
 end process;
end Behavioral;
