----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:56:52 09/11/2020 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;	-- standard unresolved logic UX01ZWLH-
use ieee.numeric_std.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder is
	Port ( WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
			 RegWrite : in STD_LOGIC;
			 Enabler : out  STD_LOGIC_VECTOR (31 downto 0));
end Decoder;

architecture Behavioral of Decoder is
	signal selregister : integer range 0 to 31;
	begin
		selregister <= to_integer(unsigned(WriteReg));
		Enabler(selRegister) <= '1' when RegWrite = '1';
end Behavioral;

