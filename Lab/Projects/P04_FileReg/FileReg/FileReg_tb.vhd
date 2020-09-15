--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:08:48 09/15/2020
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P04_FileReg/FileReg/FileReg_tb.vhd
-- Project Name:  FileReg
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FileReg
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
 
ENTITY FileReg_tb IS
END FileReg_tb;
 
ARCHITECTURE behavior OF FileReg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FileReg
    PORT(
         WriteReg : IN  std_logic_vector(4 downto 0);
         RegWrite : IN  std_logic;
         WriteData : IN  std_logic_vector(31 downto 0);
         CLK : IN  std_logic;
         ReadReg1 : IN  std_logic_vector(4 downto 0);
         ReadReg2 : IN  std_logic_vector(4 downto 0);
         ReadOut1 : OUT  std_logic_vector(31 downto 0);
         ReadOut2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal WriteReg : std_logic_vector(4 downto 0) := (others => '0');
   signal RegWrite : std_logic := '0';
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal ReadReg1 : std_logic_vector(4 downto 0) := (others => '0');
   signal ReadReg2 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal ReadOut1 : std_logic_vector(31 downto 0);
   signal ReadOut2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FileReg PORT MAP (
          WriteReg => WriteReg,
          RegWrite => RegWrite,
          WriteData => WriteData,
          CLK => CLK,
          ReadReg1 => ReadReg1,
          ReadReg2 => ReadReg2,
          ReadOut1 => ReadOut1,
          ReadOut2 => ReadOut2
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
		WriteReg  <= "00000";
		RegWrite  <= '0';
		WriteData <= x"F0F0F0F0";
		ReadReg1  <= "00000";
		ReadReg2  <= "00000";
		wait for 100 ns;
		WriteReg  <= "00000";
		RegWrite  <= '1';
		WriteData <= x"F0F0F0F0";
		ReadReg1  <= "00000";
		ReadReg2  <= "00000";
		wait for 100 ns;
		WriteReg  <= "00001";
		RegWrite  <= '0';
		WriteData <= x"F0F0F0F0";
		ReadReg1  <= "00000";
		ReadReg2  <= "00001";
		wait for 100 ns;
		WriteReg  <= "00001";
		RegWrite  <= '1';
		WriteData <= x"F0F0F0F0";
		ReadReg1  <= "00000";
		ReadReg2  <= "00001";
		wait for 100 ns;
		WriteReg  <= "00011";
		RegWrite  <= '1';
		WriteData <= x"F0F0F0F0";
		ReadReg1  <= "00011";
		ReadReg2  <= "00011";
		wait for 100 ns;
		WriteReg  <= "00011";
		RegWrite  <= '0';
		WriteData <= x"F0F0F0F0";
		ReadReg1  <= "00011";
		ReadReg2  <= "00011";
		wait for 100 ns;
      wait;
   end process;

END;
