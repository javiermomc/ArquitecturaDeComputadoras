--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:09:24 08/18/2020
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P01_ModulosBasicos/ModulosBasicos/Program_counter_tb.vhd
-- Project Name:  ModulosBasicos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Program_counter
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Program_counter_tb IS
END Program_counter_tb;
 
ARCHITECTURE behavior OF Program_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Program_counter
    PORT(
         D : IN  std_logic_vector(31 downto 0);
         Q : OUT  std_logic_vector(31 downto 0);
         RESET : IN  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(31 downto 0) := (others => '0');
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Program_counter PORT MAP (
          D => D,
          Q => Q,
          RESET => RESET,
          CLK => CLK
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		RESET <= '1';
		wait for 100 ns;			
		CLK <= '1';
		RESET <= '0';
		D <= "01001010010100101001010010100101";
      wait for 100 ns;	
		CLK <= '0';
		RESET <= '0';
		D <= "01001010010100101001010010100101";
      wait for 100 ns;	
		CLK <= '1';
		RESET <= '0';
		D <= "01001010010100101001010010100101";
      wait for 100 ns;
		CLK <= '1';
		RESET <= '1';
		D <= "01001010010100101001010010100101";
      wait for 100 ns;			
   end process;

END;
