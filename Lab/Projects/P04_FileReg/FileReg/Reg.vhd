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

entity Reg is
	Port ( WriteData : in STD_LOGIC_VECTOR (31 DOWNTO 0);
			 Enabler : in STD_LOGIC_VECTOR (31 DOWNTO 0);
			 CLK : in STD_LOGIC;
			 DataOut : out PORT32OF32);
			 
end Reg;

architecture Behavioral of Reg is
	signal DATA : PORT32OF32;
begin
	con: for i in 1 to 31 generate
	begin
		DATA(i) <= WriteData when Enabler(i) = '1' AND rising_edge(CLK);
   end generate;
	DATA(0) <= (others => '0');
	DataOut <= DATA;
end Behavioral;

