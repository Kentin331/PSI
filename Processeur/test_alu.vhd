--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:38:44 04/21/2020
-- Design Name:   
-- Module Name:   /home/qmouret/Documents/4A/PSI_ARCHIMAT/Projet/test_alu.vhd
-- Project Name:  Projet
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_alu IS
END test_alu;
 
ARCHITECTURE behavior OF test_alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         Ctrl_Alu : IN  std_logic_vector(2 downto 0);
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         N : OUT  std_logic;
         O : OUT  std_logic;
         C : OUT  std_logic;
         Z : OUT  std_logic;
         S : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ctrl_Alu : std_logic_vector(2 downto 0) := (others => '0');
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal N : std_logic;
   signal O : std_logic;
   signal C : std_logic;
   signal Z : std_logic;
   signal S : std_logic_vector(7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Ctrl_Alu => Ctrl_Alu,
          A => A,
          B => B,
          N => N,
          O => O,
          C => C,
          Z => Z,
          S => S
        );

   

   -- Stimulus process
   Ctrl_Alu <= "000", "001" after 50 ns, "010" after 100 ns, "000" after 150 ns, "001" after 200 ns, "010" after 250 ns;
	A<= "00001010", "11111100" after 150 ns;
	B<= "00000100", "11111110" after 150 ns;

--	Ctrl_Alu <= "000";
--	A <= "11111111";
--	B <= "11111111";

END;
