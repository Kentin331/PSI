----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:43:48 04/22/2020 
-- Design Name: 
-- Module Name:    Instruct_Memory - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH;
use IEEE.NUMERIC_STD.all;


entity Instruct_Memory is
    Port ( ADDRESS : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           DATA_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
end Instruct_Memory;

architecture Behavioral of Instruct_Memory is
constant pause : std_logic_vector(31 downto 0) := x"00000000";
type instructionMemory is array(0 to 255) of std_logic_vector(31 downto 0);
--signal instructMem : 
--instructionMemory := (X"06000300"      -- AFC @0 a=3
--						,pause,pause, 
--						X"05010000", others => X"00000000") ;-- CPY @1 b = 3


signal instructMem : 
instructionMemory := (X"06000300"      -- AFC @0 a=3
							,pause,pause, 
							X"05010000", -- CPY @1 b = 3
							pause,pause,
							X"01020001", -- ADD @2 c=a+b = 6
							pause,pause,
							X"02030200", -- MUL @3 d=c*a = 18
							--X"02030100", -- MUL @3 d=c*a = 18
							pause,pause,
							X"03040302", -- SOUS e = d-c = 12
							X"08000200" ,
							pause, pause,
							X"07060000",
							others=> X"00000000");
							
							


begin
	process(CLK)	
	begin
		IF CLK'event and CLK='1' THEN					
			DATA_OUT <= instructMem(to_integer(unsigned(ADDRESS)));				
		END IF;
	END process;
end Behavioral;

