-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity full_adder_tb is end full_adder_tb;
architecture Behavioral of full_adder_tb is
 signal a,b,ci,s,co: std_logic := '0';
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.full_adder port map(a,b,ci,s,co);
 process
 begin
 for i in 0 to 7 loop
 a<=bitval(i/2); b<=bitval(i); ci<=bitval(i/4); wait for 1 ns;
 assert to_integer(unsigned(std_logic_vector'(co & s))) = ((i/2) mod 2)+(i mod 2)+(i/4) severity failure;
 end loop;
 report "PASS: full_adder" severity note;
 wait;
 end process;
end Behavioral;
