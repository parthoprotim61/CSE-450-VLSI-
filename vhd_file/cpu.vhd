-- Student ID: 22201061 | Set 1 | NOR-based modular CPU
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu is
  port (CLK, RESET : in std_logic; Q : out std_logic_vector(7 downto 0); Z : out std_logic; PC : out std_logic_vector(3 downto 0));
end cpu;

architecture Structural of cpu is
  signal pc_int : std_logic_vector(3 downto 0);
  signal instr : std_logic_vector(11 downto 0);
  signal acc, alu_result : std_logic_vector(7 downto 0);
  signal alu_sel : std_logic_vector(2 downto 0);
  signal acc_load, z_load, alu_zero, z_int : std_logic;
begin
  U_PC: entity work.program_counter port map (CLK, RESET, pc_int);
  U_ROM: entity work.program_rom port map (pc_int, instr);
  U_CONTROL: entity work.control_unit port map (instr(11 downto 8), alu_sel, acc_load, z_load);
  U_ALU: entity work.alu_8bit port map (acc, instr(7 downto 0), alu_sel, alu_result, alu_zero);
  U_ACC: entity work.acc_register port map (CLK, RESET, acc_load, alu_result, acc);
  U_Z: entity work.z_register port map (CLK, RESET, z_load, alu_zero, z_int);
  Q <= acc; Z <= z_int; PC <= pc_int;
end Structural;
