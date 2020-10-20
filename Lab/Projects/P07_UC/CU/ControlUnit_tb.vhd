--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:25:24 10/19/2020
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P07_UC/CU/ControlUnit_tb.vhd
-- Project Name:  CU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ControlUnit
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
 
ENTITY ControlUnit_tb IS
END ControlUnit_tb;
 
ARCHITECTURE behavior OF ControlUnit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit
    PORT(
         opCode : IN  std_logic_vector(5 downto 0);
         RegDst : OUT  std_logic;
         Jump : OUT  std_logic;
         Branch : OUT  std_logic;
         MemRead : OUT  std_logic;
         MemToReg : OUT  std_logic;
         ALUOp : OUT  std_logic_vector(2 downto 0);
         MemWrite : OUT  std_logic;
         ALUSrc : OUT  std_logic;
         RegWrite : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal opCode : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal RegDst : std_logic;
   signal Jump : std_logic;
   signal Branch : std_logic;
   signal MemRead : std_logic;
   signal MemToReg : std_logic;
   signal ALUOp : std_logic_vector(2 downto 0);
   signal MemWrite : std_logic;
   signal ALUSrc : std_logic;
   signal RegWrite : std_logic;
	
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name
	
BEGIN
	
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          opCode => opCode,
          RegDst => RegDst,
          Jump => Jump,
          Branch => Branch,
          MemRead => MemRead,
          MemToReg => MemToReg,
          ALUOp => ALUOp,
          MemWrite => MemWrite,
          ALUSrc => ALUSrc,
          RegWrite => RegWrite
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		opCode <= "000000"; -- SPECIAL
		wait for 100 ns;	
		opCode <= "100011"; -- LW
		wait for 100 ns;	
		opCode <= "101011"; -- SW
		wait for 100 ns;	
		opCode <= "000100"; -- BEQ
		wait for 100 ns;	
		opCode <= "000010"; -- J
		wait for 100 ns;	
		opCode <= "001000"; -- ADDI
		wait for 100 ns;	
		opCode <= "001101"; -- ORI
		wait for 100 ns;	
		opCode <= "001111"; -- LUI
		wait for 100 ns;	
		opCode <= "111111"; -- X
		wait for 100 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
