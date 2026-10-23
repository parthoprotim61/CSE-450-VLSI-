-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity cpu_tb is end cpu_tb;
architecture Behavioral of cpu_tb is
 signal clk: std_logic := '0'; signal reset: std_logic := '1';
 signal q: std_logic_vector(7 downto 0); signal z: std_logic; signal pc: std_logic_vector(3 downto 0);
 signal done: boolean := false;
 type results is array(0 to 6) of std_logic_vector(7 downto 0);
 constant expected: results := (x"3C",x"4B",x"40",x"40",x"4A",x"00",x"FF");
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 UUT: entity work.cpu port map(clk,reset,q,z,pc);
 clock_gen: process
 begin
 while not done loop
 clk<='0'; wait for 5 ns; clk<='1'; wait for 5 ns;
 end loop;
 clk<='0'; wait;
 end process;
 process
 begin
 wait until rising_edge(clk); wait for 1 ns;
 assert q=x"00" and z='1' and pc="0000" report "Reset mismatch" severity failure;
 reset<='0';
 for i in 0 to 6 loop
 wait until rising_edge(clk); wait for 1 ns;
 assert q=expected(i) report "ACC mismatch at cycle " & integer'image(i+1) severity failure;
 assert to_integer(unsigned(pc))=i+1 report "PC mismatch" severity failure;
 if i=5 then assert z='1' severity failure; else assert z='0' severity failure; end if;
 report "Cycle " & integer'image(i+1) & " ACC(decimal)=" & integer'image(to_integer(unsigned(q))) & " PC=" & integer'image(to_integer(unsigned(pc))) severity note;
 end loop;
 done<=true;
 report "PASS: cpu" severity note;
 wait;
 end process;
end Behavioral;
