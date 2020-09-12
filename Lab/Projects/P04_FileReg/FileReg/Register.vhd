----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:20:56 09/11/2020 
-- Design Name: 
-- Module Name:    Register - Behavioral 
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
use work.array_port.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register is
	Port ( WriteData : in STD_LOGIC_VECTOR (31 DOWNTO 0);
			 Enabler : in STD_LOGIC_VECTOR (31 DOWNTO 0);
			 CLK : in STD_LOGIC);
			 
end Register;

architecture Behavioral of Register is
	signal DATA : PORT32OF32;
	begin
		for i in '0' to '31' generate
      begin
         DATA(i) <= WriteData when Enabler(i) = '1' AND i > '0' AND rising_edge(CLK);
   end generate;
end Behavioral;

