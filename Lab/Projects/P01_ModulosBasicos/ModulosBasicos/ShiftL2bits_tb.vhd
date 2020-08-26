--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:23:47 08/18/2020
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P01_ModulosBasicos/ModulosBasicos/ShiftL2bits_tb.vhd
-- Project Name:  ModulosBasicos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ShiftL2bits
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
 
ENTITY ShiftL2bits_tb IS
END ShiftL2bits_tb;
 
ARCHITECTURE behavior OF ShiftL2bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ShiftL2bits
    PORT(
         D : IN  std_logic_vector(25 downto 0);
         Q : OUT  std_logic_vector(27 downto 0)
        );
    END COMPONENT;
    

   --Ds
   signal D : std_logic_vector(25 downto 0) := (others => '0');

 	--Qs
   signal Q : std_logic_vector(27 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ShiftL2bits PORT MAP (
          D => D,
          Q => Q
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		D <= "11111111111111111111111111";
      wait for 100 ns;	
      D <= "10000000000000000000000001";

   end process;

END;
