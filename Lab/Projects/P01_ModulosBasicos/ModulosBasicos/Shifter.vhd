----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:30:06 08/23/2020 
-- Design Name: 
-- Module Name:    Shifter - Behavioral 
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

entity Shifter is
    Port ( VARIN : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           VAROUT : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
end Shifter;

architecture Behavioral of Shifter is
begin

	VAROUT <= VARIN(29 downto 0) & "00";
	
end Behavioral;

