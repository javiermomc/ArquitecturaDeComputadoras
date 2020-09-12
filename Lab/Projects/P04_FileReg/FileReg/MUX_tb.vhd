--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:08:12 09/12/2020
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P04_FileReg/FileReg/MUX_tb.vhd
-- Project Name:  FileReg
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX32to1
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
use work.array_port.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MUX_tb IS
END MUX_tb;
 
ARCHITECTURE behavior OF MUX_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX32to1
    PORT(
         DataIn : IN  PORT32OF32;
         ReadReg : IN  std_logic_vector(4 downto 0);
         DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DataIn : PORT32OF32;
   signal ReadReg : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal DataOut : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX32to1 PORT MAP (
          DataIn => DataIn,
          ReadReg => ReadReg,
          DataOut => DataOut
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      
		DataIn <= (0 => x"11111111", 1 => x"22222222", 2 => x"33333333", 17 => x"17171717",  31 => x"FFFFFFFF", others => x"00000000");
		
		ReadReg <= "00000";
		
      wait for 100 ns;
		
		ReadReg <= "00001";
		
      wait for 100 ns;
		
		ReadReg <= "00010";
		
		wait for 100 ns;
		
		ReadReg <= "00011";
		
      wait for 100 ns;
		
		ReadReg <= "10001";
		
      wait for 100 ns;
		
		ReadReg <= "11111";
		
      wait for 100 ns;
		
      -- insert stimulus here 

      wait;
   end process;

END;
