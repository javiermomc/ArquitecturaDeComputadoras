----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:13:37 08/30/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A		:	in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           B 	 	:	in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           Cntrl	: 	in  STD_LOGIC_VECTOR (2 DOWNTO 0);
           Zero	: 	out  STD_LOGIC;
           Result : 	out  STD_LOGIC_VECTOR (31 DOWNTO 0));
end ALU;

architecture Behavioral of ALU is
signal RES: STD_LOGIC_VECTOR (31 DOWNTO 0);
signal DL : STD_LOGIC_VECTOR (31 DOWNTO 0);
begin
	with Cntrl select
		RES <= 	A AND B 							when "000",
					A OR B 							when "001",
					A + B								when "010",
					A									when "011",
					B(15 DOWNTO 0) & x"0000"	when "100",
					A - B								when "110",
					DL									when others;
	DL <= x"00000001" when A<B else x"00000000";
	Zero <= '1' WHEN RES = x"00000000";
	Result <= RES;
end Behavioral;
