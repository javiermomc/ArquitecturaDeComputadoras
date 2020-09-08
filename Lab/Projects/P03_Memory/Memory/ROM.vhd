----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:38:50 11/20/2019 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is

	Generic (
		size : integer := 32;
		word : integer := 32
	);
	Port	(
	READ_ADDRESS : in STD_LOGIC_VECTOR(size/8-1 downto 0);
	INSTRUCTION : out STD_LOGIC_VECTOR(word-1 downto 0)
	);
end ROM;

architecture Behavioral of ROM is

	type ROM_type is array (size-1 downto 0) of STD_LOGIC_VECTOR(word-1 downto 0);
	constant ROM : ROM_type := (
										x"00000001", x"00000005", x"00000009", x"0000000d", x"00000011", x"00000015", x"00000019", x"0000001d", 
										x"00000002", x"00000006", x"0000000a", x"0000000e", x"00000012", x"00000016", x"0000001a", x"0000001e", 
										x"00000003", x"00000007", x"0000000b", x"0000000f", x"00000013", x"00000017", x"0000001b", x"0000001f", 
										x"00000004", x"00000008", x"0000000c", x"00000000", x"00000014", x"00000018", x"0000001c", x"00000010");

begin

	INSTRUCTION <= ROM(conv_integer(READ_ADDRESS));

end Behavioral;

