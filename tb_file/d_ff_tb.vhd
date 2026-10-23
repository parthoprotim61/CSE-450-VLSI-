-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity d_ff_tb is end d_ff_tb;
architecture Behavioral of d_ff_tb is
 signal clk,d,q: std_logic := '0';
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.d_ff port map(clk,d,q);
 process
 begin
 wait for 1 ns; clk<='1'; wait for 1 ns; assert q='0' severity failure;
 d<='1'; wait for 1 ns; assert q='0' severity failure;
 clk<='0'; wait for 1 ns; assert q='0' severity failure;
 clk<='1'; wait for 1 ns; assert q='1' severity failure;
 report "PASS: d_ff" severity note;
 wait;
 end process;
end Behavioral;
