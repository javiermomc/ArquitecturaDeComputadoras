--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:55:49 08/18/2020
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P01_ModulosBasicos/ModulosBasicos/ModulosBasicos_ShiftL2bits.vhd
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
 
ENTITY ModulosBasicos_ShiftL2bits IS
END ModulosBasicos_ShiftL2bits;
 
ARCHITECTURE behavior OF ModulosBasicos_ShiftL2bits IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ShiftL2bits
    PORT(
         Input : IN  std_logic_vector(25 downto 0);
         Output : OUT  std_logic_vector(27 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT Program_counter
    PORT(
			D : in  STD_LOGIC_VECTOR (31 downto 0);
			Q : out  STD_LOGIC_VECTOR (31 downto 0);
			RESET : in  STD_LOGIC;
			CLK : in  STD_LOGIC
        );
    END COMPONENT;    

   --Inputs
   signal Input : std_logic_vector(25 downto 0) := (others => '0');

 	--Outputs
   signal Output : std_logic_vector(27 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ShiftL2bits PORT MAP (
          Input => Input,
          Output => Output
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      Input <= "10000000000000000000000001";

      -- insert stimulus here 

      wait;
   end process;

END;
