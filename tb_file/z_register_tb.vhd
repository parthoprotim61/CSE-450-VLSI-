-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity z_register_tb is end z_register_tb;
architecture Behavioral of z_register_tb is
 signal clk,rst,ld: std_logic := '0'; signal d,q: std_logic;
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.z_register port map(clk,rst,ld,d,q);
 process
 begin
 d<='1'; rst<='1'; ld<='1'; wait for 1 ns;
 clk<='1'; wait for 1 ns; assert q='1' severity failure;
 clk<='0'; rst<='0'; wait for 1 ns; clk<='1'; wait for 1 ns; assert q='1' severity failure;
 clk<='0'; ld<='0'; d<='0'; wait for 1 ns; clk<='1'; wait for 1 ns; assert q='1' severity failure;
 clk<='0'; rst<='1'; wait for 1 ns; assert q='1' severity failure;
 clk<='1'; wait for 1 ns; assert q='1' severity failure;
 clk<='0'; rst<='0'; ld<='1'; wait for 1 ns; clk<='1'; wait for 1 ns; assert q='0' severity failure;
 report "PASS: z_register" severity note;
 wait;
 end process;
end Behavioral;
