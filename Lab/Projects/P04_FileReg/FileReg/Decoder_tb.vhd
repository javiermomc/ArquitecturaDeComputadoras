--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:59:56 09/12/2020
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P04_FileReg/FileReg/Decoder_tb.vhd
-- Project Name:  FileReg
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder
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
 
ENTITY Decoder_tb IS
END Decoder_tb;
 
ARCHITECTURE behavior OF Decoder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder
    PORT(
         WriteReg : IN  std_logic_vector(4 downto 0);
         RegWrite : IN  std_logic;
         Enabler : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal WriteReg : std_logic_vector(4 downto 0) := (others => '0');
   signal RegWrite : std_logic := '0';

 	--Outputs
   signal Enabler : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder PORT MAP (
          WriteReg => WriteReg,
          RegWrite => RegWrite,
          Enabler => Enabler
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.	

      WriteReg <= "00000";
		RegWrite <= '0';
		
		wait for 100 ns;	

      WriteReg <= "00001";
		RegWrite <= '0';
		
		wait for 100 ns;	

      WriteReg <= "00000";
		RegWrite <= '1';
		
		wait for 100 ns;	

      WriteReg <= "00001";
		RegWrite <= '1';
		
		wait for 100 ns;	

      WriteReg <= "11111";
		RegWrite <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
