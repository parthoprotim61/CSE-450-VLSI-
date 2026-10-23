-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity adder_8bit_tb is end adder_8bit_tb;
architecture Behavioral of adder_8bit_tb is
 signal a,b,s: std_logic_vector(7 downto 0); signal ci,co: std_logic;
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.adder_8bit port map(a,b,ci,s,co);
 process
 begin
 for i in 0 to 255 loop
 for j in 0 to 255 loop
 for k in 0 to 1 loop
 a<=std_logic_vector(to_unsigned(i,8)); b<=std_logic_vector(to_unsigned(j,8)); ci<=bitval(k);
 wait for 1 ns;
 assert to_integer(unsigned(std_logic_vector'(co & s)))=i+j+k severity failure;
 end loop; end loop; end loop;
 report "PASS: adder_8bit" severity note;
 wait;
 end process;
end Behavioral;
