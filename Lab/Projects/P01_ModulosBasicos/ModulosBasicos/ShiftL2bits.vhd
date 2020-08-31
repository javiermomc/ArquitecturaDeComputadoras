----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:47:59 08/18/2020 
-- Design Name: 
-- Module Name:    ShiftL2bits - Behavioral 
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

entity ShiftL2bits is
    Port ( D : in STD_LOGIC_VECTOR (25 downto 0);
           Q : out STD_LOGIC_VECTOR (27 downto 0));
end ShiftL2bits;

architecture Behavioral of ShiftL2bits is

begin

	Q <= D & "00";

end Behavioral;

