-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity not_gate_tb is end not_gate_tb;
architecture Behavioral of not_gate_tb is
 signal a,b,y : std_logic := '0';
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.not_gate port map (a,y);
 process
 begin
 for i in 0 to 3 loop
 a <= bitval(i/2); b <= bitval(i); wait for 1 ns;
 assert y = (not a) report "Mismatch" severity failure;
 end loop;
 report "PASS: not_gate" severity note;
 wait;
 end process;
end Behavioral;
