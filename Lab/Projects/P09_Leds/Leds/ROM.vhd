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
use IEEE.numeric_std.all;

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
	READ_ADDRESS : in STD_LOGIC_VECTOR(size-1 downto 0);
	INSTRUCTION : out STD_LOGIC_VECTOR(word-1 downto 0)
	);
end ROM;

architecture Behavioral of ROM is

	type ROM_type is array (0 to size-1) of STD_LOGIC_VECTOR(word-1 downto 0);
	constant ROM : ROM_type := (
								-- Display sequence
								"00100000000000010000000000000001", -- addi	r1, r0, 1
								"10101100000000010000000000000000", -- sw		r1, 0(r0)
								"00100000001000010000000000000001", -- addi	r1, r1, 1
								"10101100000000010000000000000000", -- sw		r1, 0(r0)
								"00100000001000010000000000000010", -- addi	r1, r1, 2
								"10101100000000010000000000000000", -- sw		r1, 0(r0)
								"00100000001000010000000000000100", -- addi	r1, r1, 4
								"10101100000000010000000000000000", -- sw		r1, 0(r0)
								"00100000001000010000000000001000", -- addi	r1, r1, 8
								"10101100000000010000000000000000", -- sw		r1, 0(r0)
								"00100000001000010000000000010000", -- addi	r1, r1, 16
								"10101100000000010000000000000000", -- sw		r1, 0(r0)
								"00100000001000010000000000100000", -- addi	r1, r1, 32
								"10101100000000010000000000000000", -- sw		r1, 0(r0)
								"00100000001000010000000001000000", -- addi	r1, r1, 64
								"10101100000000010000000000000000", -- sw		r1, 0(r0)
								
								-- Display buttons
								"10001100000000010000000000000001", -- lw		r1, 1(r0)
								"10101100000000010000000000000000", -- sw		r1, 0(r0)
								"11111100000000000000000000001000", -- jr r0
								
								-- Fill memory
								"00000000000000000000000000000000",
								"00000000000000000000000000000000",
								"00000000000000000000000000000000",
								"00000000000000000000000000000000",
								"00000000000000000000000000000000",
								"00000000000000000000000000000000",
								"00000000000000000000000000000000",
								"00000000000000000000000000000000",
								"00000000000000000000000000000000",
								"00000000000000000000000000000000",
								"00000000000000000000000000000000",
								"00000000000000000000000000000000",
								"00000000000000000000000000000000"
										);

begin

	INSTRUCTION <= ROM(to_integer(unsigned(READ_ADDRESS(6 downto 2))));

end Behavioral;

