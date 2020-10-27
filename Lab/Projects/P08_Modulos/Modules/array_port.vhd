--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package array_port is

	type port32of32 is array(31 downto 0) of STD_LOGIC_VECTOR (31 downto 0);

end array_port;

