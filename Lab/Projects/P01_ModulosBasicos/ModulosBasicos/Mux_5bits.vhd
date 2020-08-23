----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:42:49 08/18/2020 
-- Design Name: 
-- Module Name:    MUX_5bits - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_5bits is
    Port ( D1 : in  STD_LOGIC_VECTOR (4 downto 0);
           D2 : in  STD_LOGIC_VECTOR (4 downto 0);
           S : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (4 downto 0));
end MUX_5bits;

architecture Behavioral of MUX_5bits is

begin

	selector: process(S, D1, D2)
	begin
		if S = '1' then
			Q <= D1;
		else
			Q <= D2;
		end if;
	end process selector;

end Behavioral;

