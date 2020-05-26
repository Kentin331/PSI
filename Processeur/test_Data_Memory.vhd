--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:33:53 04/22/2020
-- Design Name:   
-- Module Name:   /home/qmouret/Documents/4A/PSI_ARCHIMAT/Projet/test_Data_Memory.vhd
-- Project Name:  Projet
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Data_Memory
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
 

ENTITY test_Data_Memory IS
END test_Data_Memory;
 
ARCHITECTURE behavior OF test_Data_Memory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Data_Memory
    PORT(
         ADDRESS : IN  std_logic_vector(7 downto 0);
         DATA_IN : IN  std_logic_vector(7 downto 0);
         RW : IN  std_logic;
         RST : IN  std_logic;
         CLK : IN  std_logic;
         DATA_OUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ADDRESS : std_logic_vector(7 downto 0) := (others => '0');
   signal DATA_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal RW : std_logic := '0';
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal DATA_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Data_Memory PORT MAP (
          ADDRESS => ADDRESS,
          DATA_IN => DATA_IN,
          RW => RW,
          RST => RST,
          CLK => CLK,
          DATA_OUT => DATA_OUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   

  -- insert stimulus here 
  RST <= '0', '1' after 20 ns ;-- RESET INITIAL
  ADDRESS <= "00000001", "00000010" after 50 ns, "00000001" after 150ns;
  DATA_IN <= "00001111", "11100010" after 50 ns;
  RW <= '0', '1' after 100 ns;
  


END;
