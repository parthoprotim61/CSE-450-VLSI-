-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity alu_8bit_tb is end alu_8bit_tb;
architecture Behavioral of alu_8bit_tb is
 signal a,b,r: std_logic_vector(7 downto 0); signal sel: std_logic_vector(2 downto 0); signal z: std_logic;
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.alu_8bit port map(a,b,sel,r,z);
 process
 begin
 for i in 0 to 255 loop
 for j in 0 to 255 loop
 a<=std_logic_vector(to_unsigned(i,8)); b<=std_logic_vector(to_unsigned(j,8));
 for k in 0 to 4 loop
 sel<=std_logic_vector(to_unsigned(k,3)); wait for 1 ns;
 case k is
 when 0 => assert r=b severity failure;
 when 1 => assert to_integer(unsigned(r))=(i+j) mod 256 severity failure;
 when 2 => assert to_integer(unsigned(r))=(i-j) mod 256 severity failure;
 when 3 => assert r=(a and b) severity failure;
 when 4 => assert r=(a or b) severity failure;
 when others => null;
 end case;
 if r=x"00" then assert z='1' severity failure; else assert z='0' severity failure; end if;
 end loop; end loop; end loop;
 report "PASS: alu_8bit" severity note;
 wait;
 end process;
end Behavioral;
