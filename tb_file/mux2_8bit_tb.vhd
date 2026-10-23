-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity mux2_8bit_tb is end mux2_8bit_tb;
architecture Behavioral of mux2_8bit_tb is
 signal a,b,y: std_logic_vector(7 downto 0); signal s: std_logic;
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.mux2_8bit port map(a,b,s,y);
 process
 begin
 for i in 0 to 255 loop
 a<=std_logic_vector(to_unsigned(i,8)); b<=std_logic_vector(to_unsigned(255-i,8));
 s<='0'; wait for 1 ns; assert y=a severity failure;
 s<='1'; wait for 1 ns; assert y=b severity failure;
 end loop;
 report "PASS: mux2_8bit" severity note;
 wait;
 end process;
end Behavioral;
