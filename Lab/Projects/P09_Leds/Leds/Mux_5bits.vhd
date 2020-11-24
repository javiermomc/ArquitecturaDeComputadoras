----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:42:49 08/18/2020 
-- Design Name: 
-- Module Name:    MUX_5bits - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_5bits is
    Port ( D1 : in  STD_LOGIC_VECTOR (4 downto 0);
           D2 : in  STD_LOGIC_VECTOR (4 downto 0);
           S : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (4 downto 0));
end MUX_5bits;

architecture Behavioral of MUX_5bits is

begin

	Q <= D2 when S = '1' else D1;
	
end Behavioral;

