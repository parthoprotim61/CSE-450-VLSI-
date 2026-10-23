-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity zero_detect_8bit_tb is end zero_detect_8bit_tb;
architecture Behavioral of zero_detect_8bit_tb is
 signal a: std_logic_vector(7 downto 0); signal z: std_logic;
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.zero_detect_8bit port map(a,z);
 process
 begin
 for i in 0 to 255 loop
 a<=std_logic_vector(to_unsigned(i,8)); wait for 1 ns;
 if i=0 then assert z='1' severity failure; else assert z='0' severity failure; end if;
 end loop;
 report "PASS: zero_detect_8bit" severity note;
 wait;
 end process;
end Behavioral;
