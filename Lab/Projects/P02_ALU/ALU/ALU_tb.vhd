--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:02:42 08/30/2020
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P02_ALU/ALU/ALU_tb.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Cntrl : IN  std_logic_vector(2 downto 0);
         Zero : OUT  std_logic;
         Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Cntrl : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Zero : std_logic;
   signal Result : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          Cntrl => Cntrl,
          Zero => Zero,
          Result => Result
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      A <= x"11000101";
		B <= x"01001001";
		Cntrl <= "000";
      wait for 100 ns;	
		A <= x"11000101";
		B <= x"01001001";
		Cntrl <= "001";
      wait for 100 ns;
		A <= x"11000101";
		B <= x"01001001";
		Cntrl <= "010";
      wait for 100 ns;
		A <= x"11000101";
		B <= x"01001001";
		Cntrl <= "011";
      wait for 100 ns;
		A <= x"11000101";
		B <= x"01001001";
		Cntrl <= "100";
      wait for 100 ns;
		A <= x"11000101";
		B <= x"01001001";
		Cntrl <= "101";
      wait for 100 ns;
		A <= x"11000101";
		B <= x"01001001";
		Cntrl <= "110";
      wait for 100 ns;
		A <= x"11000101";
		B <= x"01001001";
		Cntrl <= "111";
		wait for 100 ns;
		B <= x"11000101";
		A <= x"01001001";
		Cntrl <= "111";
		wait for 100 ns;
   end process;

END;
