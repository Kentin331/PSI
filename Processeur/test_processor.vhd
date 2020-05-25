library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.numeric_bit;
 
ENTITY test_processor IS
END test_processor;
 
ARCHITECTURE behavior OF test_processor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processor
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         procQA : OUT  std_logic_vector(7 downto 0);
         procQB : OUT  std_logic_vector(7 downto 0);
         procFlag : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal procQA : std_logic_vector(7 downto 0);
   signal procQB : std_logic_vector(7 downto 0);
   signal procFlag : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processor PORT MAP (
          RST => RST,
          CLK => CLK,
          procQA => procQA,
          procQB => procQB,
          procFlag => procFlag
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   --SIMU
	RST <= '0', '1' after 7 ns;

END;
