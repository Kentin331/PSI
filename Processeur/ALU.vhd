----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Quentin Mouret
-- 
-- Create Date:    08:57:53 04/21/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity ALU is
    Port ( Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0);
           A,B : in  STD_LOGIC_VECTOR (7 downto 0);
           N : out  STD_LOGIC; --flag negative value
           O : out  STD_LOGIC; --flag overflow (>8bits)
           C : out  STD_LOGIC; --CarryFlag
           Z : out  STD_LOGIC; --flag S = 0
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is
signal alu_result : std_logic_vector(15 downto 0);
signal longA : std_logic_vector(15 downto 0);
signal longB : std_logic_vector(15 downto 0);

begin
process(Ctrl_Alu,longA,longB,A,B)
	begin
	C <= '0';
	N <= '0';
	O <= '0';		
	
	longA <= (X"00" & A);
	longB <=(X"00" & B);
	
	case(Ctrl_Alu) is
		when "000" => --ADD
			alu_result <= longA + longB;
			if (alu_result(15 downto 8) /= "00000000") then C <= '1';
			end if;
			
		when "001" => --SUB
			alu_result <= longA - longB;
			if (alu_result(15 downto 8) /= "00000000") then N <= '1';
			end if;
		
		when others => --MUL
			alu_result(15 downto 0) <= A*B;
			if (alu_result(15 downto 8) /= "00000000") then O <= '1';
			end if;
	end case;
	
end process;

S <= alu_result(7 downto 0);

end Behavioral;

