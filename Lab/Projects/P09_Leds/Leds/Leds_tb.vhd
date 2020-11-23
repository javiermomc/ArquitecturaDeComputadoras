-- Leds_tb Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY Leds_tb IS
  END Leds_tb;

  ARCHITECTURE behavior OF Leds_tb IS 

	-- Component Declaration
	COMPONENT LEDs
	PORT(
	CLK : in  STD_LOGIC;
	RESET : in STD_LOGIC;
	Buttons : in STD_LOGIC_VECTOR(7 downto 0);
	LED : out  STD_LOGIC_VECTOR (7 downto 0)
			);
	END COMPONENT;
	
	--Inputs
	SIGNAL CLK :  STD_LOGIC := '0';
	SIGNAL RESET : STD_LOGIC := '0';
	SIGNAL Buttons : STD_LOGIC_VECTOR(7 downto 0);
	--Outputs
	SIGNAL LED :  STD_LOGIC_VECTOR (7 downto 0);

	-- Clock period definitions
   constant CLK_period : time := 10 ns;

  BEGIN

		-- Component Instantiation
		uut: LEDs PORT MAP(
				CLK => CLK,
				RESET => RESET,
				Buttons => Buttons,
				LED => LED
		);
		
		-- Clock process definitions
		CLK_process :process
		begin
			CLK <= '0';
			wait for CLK_period/2;
			CLK <= '1';
			wait for CLK_period/2;
		end process;

	  --  Test Bench Statements
     stim_proc : PROCESS
     BEGIN
	  
		  Reset <= '1';
		  Buttons <= "00001000";
        wait for 5 ns; -- wait until global set/reset completes
		  Reset <= '0';
		  
		  

        -- Add user defined stimulus here

        wait; -- will wait forever
     END PROCESS stim_proc;
  --  End Test Bench 

  END;
