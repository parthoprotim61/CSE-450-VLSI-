-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity mux2_tb is end mux2_tb;
architecture Behavioral of mux2_tb is
 signal a,b,s,y : std_logic := '0';
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.mux2 port map(a,b,s,y);
 process
 begin
 for i in 0 to 7 loop
 a<=bitval(i/4); b<=bitval(i/2); s<=bitval(i); wait for 1 ns;
 if s='0' then assert y=a severity failure; else assert y=b severity failure; end if;
 end loop;
 report "PASS: mux2" severity note;
 wait;
 end process;
end Behavioral;
