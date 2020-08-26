----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:49:32 08/18/2020 
-- Design Name: 
-- Module Name:    MUX_32bits - Behavioral 
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_32bits is
    Port ( D1 : in  STD_LOGIC_VECTOR (31 downto 0);
           D2 : in  STD_LOGIC_VECTOR (31 downto 0);
           S : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_32bits;

architecture Behavioral of MUX_32bits is

begin

	Q <= D1 when S = '1' else D2;

end Behavioral;

