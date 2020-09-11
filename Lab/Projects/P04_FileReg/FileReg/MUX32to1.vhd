----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:23:07 09/11/2020 
-- Design Name: 
-- Module Name:    MUX32to1 - Behavioral 
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
use ieee.std_logic_unsigned.all;
use work.array_port.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX32to1 is
    Port ( DataIn : in  PORT32OF32;
           ReadReg : in  STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX32to1;

architecture Behavioral of MUX32to1 is

begin

	DataOut <= DataIn(conv_integer(ReadReg));

end Behavioral;



