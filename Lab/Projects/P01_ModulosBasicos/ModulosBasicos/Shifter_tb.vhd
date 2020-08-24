--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:52:11 08/23/2020
-- Design Name:   
-- Module Name:   C:/PROJECTS/XILINX/Shiftleft/Shifter_tb.vhd
-- Project Name:  Shiftleft
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Shifter
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
 
ENTITY Shifter_tb IS
END Shifter_tb;
 
ARCHITECTURE behavior OF Shifter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Shifter
    PORT(
         VARIN : IN  std_logic_vector(31 downto 0);
         VAROUT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal VARIN : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal VAROUT : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Shifter PORT MAP (
          VARIN => VARIN,
          VAROUT => VAROUT
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		VARIN <= "00000000000000000000000000001111";
   end process;

END;
