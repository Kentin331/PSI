----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:48 04/22/2020 
-- Design Name: 
-- Module Name:    Data_Memory - Behavioral 
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

entity Data_Memory is
    Port ( ADDRESS : in  STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DATA_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end Data_Memory;

architecture Behavioral of Data_Memory is
type dataMemory is array(0 to 255) of std_logic_vector(7 downto 0);
signal dataMem : dataMemory;


begin
	process(CLK)
	variable i : integer range 0 to 255;
	begin
		IF CLK'event and CLK='0' THEN
			IF(RST='0') THEN --CAS RESET
				FOR i in 0 to 255 LOOP
					dataMem(i) <= X"00";
				END LOOP;
			ELSE
				IF (RW = '1') THEN -- LECTURE
					DATA_OUT <= dataMem(conv_integer(unsigned(ADDRESS)));
				ELSE IF (RW='0') THEN-- ECRITURE
						dataMem(conv_integer(unsigned(ADDRESS))) <= DATA_IN;
						END IF;
				END IF;
			END IF;
		END IF;
	END process;
end Behavioral;

