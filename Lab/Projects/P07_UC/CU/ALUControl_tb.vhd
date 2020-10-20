--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:36:32 10/19/2020
-- Design Name:   
-- Module Name:   E:/ArquitecturaDeComputadoras/Lab/Projects/P07_UC/CU/ALUControl_tb.vhd
-- Project Name:  CU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALUControl
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
 
ENTITY ALUControl_tb IS
END ALUControl_tb;
 
ARCHITECTURE behavior OF ALUControl_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALUControl
    PORT(
         Instruc : IN  std_logic_vector(5 downto 0);
         ALUOp : IN  std_logic_vector(2 downto 0);
         ALUCtrl : OUT  std_logic_vector(2 downto 0);
         Jr : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Instruc : std_logic_vector(5 downto 0) := (others => '0');
   signal ALUOp : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal ALUCtrl : std_logic_vector(2 downto 0);
   signal Jr : std_logic;
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALUControl PORT MAP (
          Instruc => Instruc,
          ALUOp => ALUOp,
          ALUCtrl => ALUCtrl,
          Jr => Jr
        );


   -- Stimulus process
   stim_proc: process
   begin		
  
      -- insert stimulus here 
		Instruc <= "100100"; --AND
		ALUOp <= "000"; --TIPO R
		wait for 100 ns;	
		Instruc <= "100101"; --OR
		ALUOp <= "000"; --TIPO R
		wait for 100 ns;	
		Instruc <= "100000"; --ADD
		ALUOp <= "000"; --TIPO R
		wait for 100 ns;	
		Instruc <= "100010"; --SUB
		ALUOp <= "000"; --TIPO R
		wait for 100 ns;	
		Instruc <= "101010"; -- SLT
		ALUOp <= "000"; --TIPO R
		wait for 100 ns;	
		Instruc <= "000000"; --JR
		ALUOp <= "000"; --TIPO R
		wait for 100 ns;	

		ALUOp <= "100"; --ADD / LW,SW,ADDI
		wait for 100 ns;	
		ALUOp <=  "101"; --SUB / BEQ
		wait for 100 ns;	
		ALUOp <= "110"; --OR /ORI
		wait for 100 ns;	
		ALUOp <= "111"; --B UPPER / LUI
		wait for 100 ns;	
		ALUOp <= "010"; --NOP
		wait for 100 ns;	
		ALUOp <= "000"; --TIPO R
		wait for 100 ns;	
		ALUOp  <= "001"; --NOTHING
      wait for 100 ns;	
   end process;

END;
