----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Quentin Mouret
-- 
-- Create Date:    18:32:17 04/21/2020 
-- Design Name: 
-- Module Name:    RegisterFile - Behavioral 
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

entity RegisterFile is
    Port ( at_A : in  STD_LOGIC_VECTOR (3 downto 0);
           at_B : in  STD_LOGIC_VECTOR (3 downto 0);
           at_W : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is
type registerFile is array(0 to 15) of std_logic_vector(7 downto 0);
signal registers : registerFile;

begin
process (CLK)
variable i : integer range 0 to 15 ;
begin
	IF CLK'event and CLK='1' THEN
		IF(RST = '0') THEN
			for i in 0 to 15 loop
			registers (i) <= X"00";
			end loop;
		else	
			IF (W='1') THEN
				registers(conv_integer(unsigned(at_W))) <= DATA;
			END IF;
		END IF ;		
	END IF;
END process;

QA <= DATA when (at_W = at_A and W='1') else 
		registers(conv_integer(unsigned(at_A)));

QB <= DATA when (at_W = at_B and W='1') else
		registers(conv_integer(unsigned(at_B)));		

end Behavioral;

