-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity add_sub_8bit_tb is end add_sub_8bit_tb;
architecture Behavioral of add_sub_8bit_tb is
 signal a,b,r: std_logic_vector(7 downto 0); signal sub,co: std_logic;
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.add_sub_8bit port map(a,b,sub,r,co);
 process
 begin
 for i in 0 to 255 loop
 for j in 0 to 255 loop
 a<=std_logic_vector(to_unsigned(i,8)); b<=std_logic_vector(to_unsigned(j,8));
 sub<='0'; wait for 1 ns; assert to_integer(unsigned(r))=(i+j) mod 256 severity failure;
 sub<='1'; wait for 1 ns; assert to_integer(unsigned(r))=(i-j) mod 256 severity failure;
 end loop; end loop;
 report "PASS: add_sub_8bit" severity note;
 wait;
 end process;
end Behavioral;
