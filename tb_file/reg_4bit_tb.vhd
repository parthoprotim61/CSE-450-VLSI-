-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity reg_4bit_tb is end reg_4bit_tb;
architecture Behavioral of reg_4bit_tb is
 signal clk,rst,ld: std_logic := '0'; signal d,q: std_logic_vector(3 downto 0);
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.reg_4bit port map(clk,rst,ld,d,q);
 process
 begin
 d<=(others=>'1'); rst<='1'; ld<='1'; wait for 1 ns;
 clk<='1'; wait for 1 ns; assert q=std_logic_vector(to_unsigned(0,4)) severity failure;
 clk<='0'; rst<='0'; wait for 1 ns; clk<='1'; wait for 1 ns; assert q=std_logic_vector(to_unsigned(15,4)) severity failure;
 clk<='0'; ld<='0'; d<=(others=>'0'); wait for 1 ns; clk<='1'; wait for 1 ns; assert q=std_logic_vector(to_unsigned(15,4)) severity failure;
 clk<='0'; rst<='1'; wait for 1 ns; assert q=std_logic_vector(to_unsigned(15,4)) severity failure;
 clk<='1'; wait for 1 ns; assert q=std_logic_vector(to_unsigned(0,4)) severity failure;
 clk<='0'; rst<='0'; ld<='1'; wait for 1 ns; clk<='1'; wait for 1 ns; assert q=std_logic_vector(to_unsigned(0,4)) severity failure;
 report "PASS: reg_4bit" severity note;
 wait;
 end process;
end Behavioral;
