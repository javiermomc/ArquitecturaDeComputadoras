----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:06:07 09/04/2020 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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

entity RAM is
	Generic (
		size : integer := 32;
		word : integer := 32
	);

    Port ( ENABLE : in  STD_LOGIC;
           ADDRESS : in  STD_LOGIC_VECTOR (size-1 downto 0);
           CLK : in  STD_LOGIC;
           WRITE_ENABLE : in  STD_LOGIC;
           READ_ENABLE : in  STD_LOGIC;
           WRITE_DATA : in  STD_LOGIC_VECTOR (word-1 downto 0);
           READ_DATA : out  STD_LOGIC_VECTOR (word-1 downto 0);
			  IPORT	 			: in	 STD_LOGIC_VECTOR (31 downto 0);
			  OPORT	 			: out	 STD_LOGIC_VECTOR (31 downto 0));
end RAM;

architecture Behavioral of RAM is

type ram_type is array(size-1 downto 0) of STD_LOGIC_VECTOR(word-1 downto 0);
signal RAM: ram_type;

attribute keep : string;
attribute KEEP of IPORT : signal is "true";

begin

	process (ENABLE, CLK)
	begin
		if (ENABLE = '1' and falling_edge(CLK)) then
			if (WRITE_ENABLE = '1') then 
					RAM(to_integer(unsigned(ADDRESS(6 downto 2)))) <= WRITE_DATA;
					READ_DATA <= (others => '0');
			end if;
		elsif (ENABLE = '1' AND READ_ENABLE = '1') then
				READ_DATA <= RAM(to_integer(unsigned(ADDRESS(6 downto 2))));
		end if;
	end process;
	
	RAM(0) <= IPORT;
	OPORT <= RAM(1);


end Behavioral;

