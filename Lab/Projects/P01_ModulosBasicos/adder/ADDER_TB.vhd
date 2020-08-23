--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:25:19 08/23/2020
-- Design Name:   
-- Module Name:   C:/PROJECTS/XILINX/adder/ADDER_TB.vhd
-- Project Name:  adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ADDER
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
 
ENTITY ADDER_TB IS
END ADDER_TB;
 
ARCHITECTURE behavior OF ADDER_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ADDER
    PORT(
         NUM1 : IN  std_logic_vector(31 downto 0);
         NUM2 : IN  std_logic_vector(31 downto 0);
         SUM : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal NUM1 : std_logic_vector(31 downto 0) := (others => '0');
   signal NUM2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal SUM : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ADDER PORT MAP (
          NUM1 => NUM1,
          NUM2 => NUM2,
          SUM => SUM
        );

      -- Stimulus process
   stim_proc: process
   begin
		wait for 1 ns;
		NUM1<= "00000000000000000000000000001111";
		NUM2<= "00000000000000000000000000001111";
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		NUM1<= "00000000000000000000000000000001";
		NUM2<= "00000000000000000000000000000001";
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      -- insert stimulus here 
   end process;

END;
