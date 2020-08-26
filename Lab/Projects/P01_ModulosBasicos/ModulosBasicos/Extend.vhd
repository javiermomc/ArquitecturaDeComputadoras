----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:03:42 08/23/2020 
-- Design Name: 
-- Module Name:    Extend - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity extender is
    Port ( A : in std_logic_vector (15 downto 0) := "1111000000001111";
           B : out std_logic_vector (31 downto 0) := (others => '0'));
end extender;

architecture behavorial of extender is
begin

	B <= std_logic_vector(resize(signed(A), B'length));
	
end architecture;

