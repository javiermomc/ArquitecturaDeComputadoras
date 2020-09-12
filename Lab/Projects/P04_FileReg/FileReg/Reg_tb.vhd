--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:28:26 09/12/2020
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P04_FileReg/FileReg/Reg_tb.vhd
-- Project Name:  FileReg
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Reg
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
 
ENTITY Reg_tb IS
END Reg_tb;
 
ARCHITECTURE behavior OF Reg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Reg
    PORT(
         WriteData : IN  std_logic_vector(31 downto 0);
         Enabler : IN  std_logic_vector(31 downto 0);
         CLK : IN  std_logic;
         DataOut : OUT PORT32OF32
        );
    END COMPONENT;
    

   --Inputs
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');
   signal Enabler : std_logic_vector(31 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal DataOut : PORT32OF32;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Reg PORT MAP (
          WriteData => WriteData,
          Enabler => Enabler,
          CLK => CLK,
          DataOut => DataOut
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Enabler <= (0 => '1', others => '0');
		WriteData <= x"FFFFFFFF";
      wait for 100 ns;
		Enabler <= (1 => '1', others => '0');
		WriteData <= x"11111111";
		wait for 100 ns;
		Enabler <= (2 => '1', others => '0');
		WriteData <= x"22222222";
		wait for 100 ns;
		Enabler <= (31 => '1', others => '0');
		WriteData <= x"00000000";
		wait for 100 ns;
		Enabler <= (2 => '1', others => '0');
		WriteData <= x"FFFFFFFF";
		wait for 100 ns;
		Enabler <= (others => '0');
		WriteData <= x"FFFFFFFF";
		wait for 100 ns;
		WriteData <= x"FFFFFFFF";
		wait for 100 ns;
		
		

      -- insert stimulus here 

      wait;
   end process;

END;
