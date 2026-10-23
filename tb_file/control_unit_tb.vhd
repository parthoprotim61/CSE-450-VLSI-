-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity control_unit_tb is end control_unit_tb;
architecture Behavioral of control_unit_tb is
 signal op: std_logic_vector(3 downto 0); signal sel: std_logic_vector(2 downto 0); signal al,zl: std_logic;
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.control_unit port map(op,sel,al,zl);
 process
 begin
 for i in 0 to 15 loop
 op<=std_logic_vector(to_unsigned(i,4)); wait for 1 ns;
 if i>=1 and i<=5 then
 assert al='1' and zl='1' and to_integer(unsigned(sel))=i-1 severity failure;
 else assert al='0' and zl='0' severity failure; end if;
 end loop;
 report "PASS: control_unit" severity note;
 wait;
 end process;
end Behavioral;
