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
use IEEE.NUMERIC_STD.ALL;

entity adder is
    Port ( NUM1 : in  STD_LOGIC_VECTOR (31 downto 0);
           NUM2 : in  STD_LOGIC_VECTOR (31 downto 0);
           SUM : out  STD_LOGIC_VECTOR (31 downto 0));
end adder;

architecture Behavioral of adder is
begin
	sumar: process(NUM1,NUM2)
	begin
    SUM <= STD_LOGIC_VECTOR(unsigned(NUM1) + unsigned(NUM2));
	end process sumar;
end Behavioral;