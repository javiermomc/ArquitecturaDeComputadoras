----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:46:45 08/18/2020 
-- Design Name: 
-- Module Name:    Program_counter - Behavioral 
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

entity Program_counter is
    Port ( D : in  STD_LOGIC_VECTOR (31 downto 0);
           Q : out  STD_LOGIC_VECTOR (31 downto 0);
           RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC);
end Program_counter;

architecture Behavioral of Program_counter is

begin

	Q <= (others => '0') when RESET = '1' else
		D when falling_edge(CLK);

end Behavioral;

