----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:08 08/19/2020 
-- Design Name: 
-- Module Name:    ADDER - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder is
    Port ( NUM1 : in  STD_LOGIC_VECTOR (31 downto 0);
           NUM2 : in  STD_LOGIC_VECTOR (31 downto 0);
           SUM : out  STD_LOGIC_VECTOR (31 downto 0));
end adder;

architecture Behavioral of adder is
begin

	SUM <= NUM1 + NUM2;
	
end Behavioral;