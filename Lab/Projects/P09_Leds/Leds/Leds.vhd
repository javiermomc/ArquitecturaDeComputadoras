----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:43:37 11/17/2020 
-- Design Name: 
-- Module Name:    Leds - Behavioral 
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

entity Leds is
    Port ( CLK : in  STD_LOGIC;
			  RESET : in STD_LOGIC;
			  Buttons : in STD_LOGIC_VECTOR(7 downto 0);
           LED : out  STD_LOGIC_VECTOR (31 downto 0));
end Leds;

architecture Behavioral of Leds is

component TOP
	Port (  CLK 	: in  STD_LOGIC;
           RESET 	: in  STD_LOGIC;
			  IPORT	 			: in	 STD_LOGIC_VECTOR (31 downto 0);
			  OPORT	 			: out	 STD_LOGIC_VECTOR (31 downto 0);
			  Instruction_Out : out  STD_LOGIC_VECTOR (31 downto 0);
			  PC_Out 			: out  STD_LOGIC_VECTOR (31 downto 0);
			  Write_Data_Out 	: out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

component Div1Hz
	Port (
		Clk_100MHz : in STD_LOGIC;
		Clk_1Hz : out STD_LOGIC);
end component;

signal Clk_1Hz : STD_LOGIC;

begin

MIPS: TOP
	port map(	
			CLK => CLK_1Hz,
         Reset => Reset,
         IPORT => x"000000" & Buttons,
         OPORT => Led,
         Instruction_out => open,
			PC_Out => open,
			Write_Data_Out => open
	);

Freq_Divisor : Div1Hz
	port map(
		CLK_100MHz => CLK,
		CLK_1Hz => Clk_1Hz
	);

end Behavioral;

