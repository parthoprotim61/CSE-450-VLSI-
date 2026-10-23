-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity mux4_tb is end mux4_tb;
architecture Behavioral of mux4_tb is
 signal d: std_logic_vector(3 downto 0); signal s: std_logic_vector(1 downto 0); signal y: std_logic;
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.mux4 port map(d(0),d(1),d(2),d(3),s,y);
 process
 begin
 for i in 0 to 15 loop
 d<=std_logic_vector(to_unsigned(i,4));
 for j in 0 to 3 loop
 s<=std_logic_vector(to_unsigned(j,2)); wait for 1 ns;
 assert y=d(j) severity failure;
 end loop; end loop;
 report "PASS: mux4" severity note;
 wait;
 end process;
end Behavioral;
