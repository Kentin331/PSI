----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Processor is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  procQA, procQB : out STD_LOGIC_VECTOR(7 downto 0);
			  procFlag : out STD_LOGIC -- flag pour OP inconnu
			 );
end Processor;

architecture struct of Processor is

	COMPONENT ALU
    PORT(
         Ctrl_Alu : IN  std_logic_vector(2 downto 0);
         A,B : IN  std_logic_vector(7 downto 0);
         N,O,C,Z : OUT  std_logic;
         S : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	
	COMPONENT RegisterFile
    PORT(
         at_A, at_B, at_W : IN  std_logic_vector(3 downto 0);
         W : IN  std_logic;
         DATA : IN  std_logic_vector(7 downto 0);
         RST, CLK : IN  std_logic;          
         QA, QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
		
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
	
	COMPONENT Instruct_Memory port (
		ADDRESS : in  STD_LOGIC_VECTOR (7 downto 0);
      CLK : in  STD_LOGIC;
      DATA_OUT : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
	-- 4 pipelines de 4 octets
	type pipeline is array(0 to 3) of std_logic_vector(7 downto 0); -- type pipeline
	signal LIDI, DIEX, EXMEM, MEMRE : pipeline ;
	constant A : integer := 0; --registre de destination
	constant OP : integer := 1; --code operation
	constant B : integer := 2; --registre entree 1
	constant C : integer := 3; -- registre entree 2
	
	signal zero8 : std_logic_vector(7 downto 0);
	signal zero4 : std_logic_vector(3 downto 0);
	signal zero3 : std_logic_vector(2 downto 0);
	
	signal dflag : std_logic;
	
	--signaux RegisterFiles
	signal sig_RF_atA, sig_RF_atB, sig_RF_atW : std_logic_vector(3 downto 0);
	signal sig_RF_W : std_logic;
	signal sig_RF_DATA, sig_RF_QA, sig_RF_QB: std_logic_vector(7 downto 0);
	
	--signaux ALU
	signal sig_ALU_A, sig_ALU_B, sig_ALU_S : std_logic_vector(7 downto 0);
	signal sig_ALU_CTRL : std_logic_vector(2 downto 0);
	
	--signaux DATAMEM
	signal sig_DM_AT, sig_DM_IN, sig_DM_OUT : std_logic_vector(7 downto 0);
	signal sig_DM_RW : std_logic;
	
	--signaux IM
	signal sig_IM_instruction : std_logic_vector(31 downto 0);	
	signal IP : std_logic_vector(7 downto 0):= "00000000";
	
	
	begin		
		--Connection RegisterFile
		U_RF: RegisterFile PORT MAP (
          at_A => sig_RF_atA,
          at_B => sig_RF_atB,
          at_W => sig_RF_atW,
          W => sig_RF_W,
          DATA => sig_RF_DATA,
          RST => RST,
          CLK => CLK,
          QA => sig_RF_QA,
          QB => sig_RF_QB
        );
		  
		 --Connection ALU		 
		 U_ALU : ALU PORT MAP (
          Ctrl_Alu => sig_ALU_CTRL,
          A => sig_ALU_A,
          B => sig_ALU_B,
          N => open,
          O => open,
          C => open,
          Z => open,
          S => sig_ALU_S
        );
		  
		  --Connection DATA MEMORY		
		  U_DM: Data_Memory PORT MAP (
          ADDRESS => sig_DM_AT,
          DATA_IN => sig_DM_IN,
          RW => sig_DM_RW,
          RST => RST,
          CLK => CLK,
          DATA_OUT => sig_DM_OUT
        );
		
		--Connection INSTRUCT MEMORY
		U_IM: Instruct_Memory PORT MAP (
			ADDRESS => IP,
			CLK => CLK,
			DATA_OUT => sig_IM_instruction
		 );
		 
		procQA <= sig_RF_QA;
		procQB <= sig_RF_QB;
		procFlag <= dflag;
		
		--RF
		sig_RF_atW <= MEMRE(A)(3 downto 0);
		sig_RF_DATA <= MEMRE(B);
		sig_RF_atA <= LIDI(B)(3 downto 0);
		sig_RF_atB <= LIDI(C)(3 downto 0);
		with(MEMRE(OP)) select
			sig_RF_W <= '0' when X"08",
							'1' when others;
		
		--ALU
		with(DIEX(OP)) select
			sig_ALU_CTRL <= "000" when X"01",
								 "010" when X"02",
								 "001" when others;
		sig_ALU_A <= DIEX(B);
		sig_ALU_B <= DIEX(C);	

		--DM
		with(EXMEM(OP)) select
			sig_DM_RW <= '1' when X"07",
							 '0' when X"08",
							 'U' when others;
							 
		with(EXMEM(OP)) select
			sig_DM_AT <= EXMEM(B) when X"07",
							 EXMEM(A) when others;
							 
			sig_DM_IN <= EXMEM(B);
		 
		process(CLK)
			begin
			
			IF rising_edge(CLK) THEN
				LIDI(OP) <= sig_IM_instruction(31 downto 24);
				LIDI(A) <= sig_IM_instruction(23 downto 16);				
				LIDI(B) <= sig_IM_instruction(15 downto 8);
				LIDI(C) <= sig_IM_instruction(7 downto 0);
				IP <= IP + X"01";
				
				
			--- ETAGE REGISTER FILE---------------------			
				IF (LIDI(OP)= X"06" or LIDI(OP)= X"07") THEN -- AFC LOAD STORE
					dflag <= '0';
					DIEX(A) <= LIDI(A);
					DIEX(OP) <= LIDI(OP);
					DIEX(B) <= LIDI(B);
					ELSE IF (LIDI(OP)= X"05" or LIDI(OP)= X"08") THEN -- COPY
						dflag <= '0';
						--sig_RF_atA <= LIDI(B)(3 downto 0);
						DIEX(A) <= LIDI(A);
						DIEX(OP) <= LIDI(OP);
						DIEX(B) <= sig_RF_QA;
						ELSE IF (LIDI(OP)= X"01" or LIDI(OP)= X"02" or LIDI(OP)= X"03") THEN --ADD/SOUS/MUL
							dflag <= '0';
							--sig_RF_atA <= LIDI(B)(3 downto 0);
							--sig_RF_atB <= LIDI(C)(3 downto 0);
							DIEX(A) <= LIDI(A);
							DIEX(OP) <= LIDI(OP);
							DIEX(B) <= sig_RF_QA;
							DIEX(C) <= sig_RF_QB;
							ELSE
								dflag <= '1';
						END IF;
					END IF;
				END IF;		

		--- ETAGE ALU----------------------
				 
				IF (DIEX(OP)= X"06" or DIEX(OP)= X"05" or DIEX(OP)= X"07" or DIEX(OP)= X"08") THEN -- AFC ou COPY ou LD
					EXMEM(A) <= DIEX(A);
					EXMEM(OP) <= DIEX(OP);
					EXMEM(B) <= DIEX(B);
					ELSE IF (DIEX(OP)= X"01" or DIEX(OP)= X"02" or DIEX(OP)= X"03") THEN	--ADD/MUL/SOUS
						EXMEM(A) <= DIEX(A);
						EXMEM(OP) <= DIEX(OP);
						EXMEM(B) <= sig_ALU_S;							
					END IF;				
				END IF;			
			
				
		--- ETAGE DATAMEM----------------------
					 
				IF (EXMEM(OP)= X"06" or EXMEM(OP)= X"05" or EXMEM(OP)= X"01" or EXMEM(OP)= X"02" or EXMEM(OP)= X"03") THEN --AFC
					MEMRE(A) <= EXMEM(A);
					MEMRE(OP) <= EXMEM(OP); 
					MEMRE(B) <= EXMEM(B);
					ELSE IF(EXMEM(OP)= X"07") THEN --LOAD						
						MEMRE(A) <= EXMEM(A);
						MEMRE(OP) <= EXMEM(OP);
						MEMRE(B) <= sig_DM_OUT;	
						
						ELSE IF(EXMEM(OP)= X"08") THEN -- STORE
							MEMRE(A) <= EXMEM(A);
							MEMRE(OP) <= EXMEM(OP);
							MEMRE(B) <= sig_DM_OUT;
						END IF;
					END IF;
				END IF;
			END IF;
		 
		 END process;
end struct;
