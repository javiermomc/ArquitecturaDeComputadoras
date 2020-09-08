--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:13:05 09/08/2020
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P03_Memory/Memory/ROM_tb.vhd
-- Project Name:  Memory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM
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
 
ENTITY ROM_tb IS
END ROM_tb;
 
ARCHITECTURE behavior OF ROM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM
    PORT(
         READ_ADDRESS : IN  std_logic_vector(3 downto 0);
         INSTRUCTION : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal READ_ADDRESS : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal INSTRUCTION : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
          READ_ADDRESS => READ_ADDRESS,
          INSTRUCTION => INSTRUCTION
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.	

      READ_ADDRESS <= x"0";
		
		wait for 100 ns;	
		
		READ_ADDRESS <= x"1";
		
		wait for 100 ns;	
		READ_ADDRESS <= x"2";
		
		wait for 100 ns;	
		
		READ_ADDRESS <= x"E";
		
		wait for 100 ns;
		
		READ_ADDRESS <= x"F";
		
		wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
