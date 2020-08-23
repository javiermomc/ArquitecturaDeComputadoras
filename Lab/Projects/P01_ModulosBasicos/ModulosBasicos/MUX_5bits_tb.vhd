--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:53:35 08/18/2020
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P01_ModulosBasicos/ModulosBasicos/MUX_5bits_tb.vhd
-- Project Name:  ModulosBasicos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_5bits
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
 
ENTITY MUX_5bits_tb IS
END MUX_5bits_tb;
 
ARCHITECTURE behavior OF MUX_5bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_5bits
    PORT(
         D1 : IN  std_logic_vector(4 downto 0);
         D2 : IN  std_logic_vector(4 downto 0);
         S : IN  std_logic;
         Q : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D1 : std_logic_vector(4 downto 0) := (others => '0');
   signal D2 : std_logic_vector(4 downto 0) := (others => '0');
   signal S : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_5bits PORT MAP (
          D1 => D1,
          D2 => D2,
          S => S,
          Q => Q
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		D1 <= "11101";
		D2 <= "10001";
		S <= '0';
      wait for 100 ns;	
		D1 <= "11101";
		D2 <= "10001";
		S <= '1';
		wait for 100 ns;	
		D1 <= "11101";
		D2 <= "10001";
		S <= '0';
   end process;

END;
