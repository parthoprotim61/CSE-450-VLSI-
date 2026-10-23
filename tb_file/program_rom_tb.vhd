-- Self-checking testbench | ID 22201061
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity program_rom_tb is end program_rom_tb;
architecture Behavioral of program_rom_tb is
 signal pc: std_logic_vector(3 downto 0); signal instr: std_logic_vector(11 downto 0);
 type arr is array(0 to 6) of std_logic_vector(11 downto 0);
 constant expected: arr := (x"13C",x"20F",x"30B",x"4F0",x"50A",x"34A",x"301");
 function bitval(n: integer) return std_logic is
 begin if n mod 2 = 0 then return '0'; else return '1'; end if; end;
begin
 U: entity work.program_rom port map(pc,instr);
 process
 begin
 for i in 0 to 15 loop
 pc<=std_logic_vector(to_unsigned(i,4)); wait for 1 ns;
 if i<7 then assert instr=expected(i) severity failure; else assert instr=x"000" severity failure; end if;
 end loop;
 report "PASS: program_rom" severity note;
 wait;
 end process;
end Behavioral;
