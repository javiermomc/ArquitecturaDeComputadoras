----------------------------------------------------------------------------------
-- Company: ITESM Qro.
-- Engineer: Javier Mondragon Martin del Campo & Alejandro Tamayo Cervantes
-- 
-- Create Date:    23/10/2019
-- Design Name: 	 Segundero
-- Module Name:    Div1Hz - Div1Hz_Arch 
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Div1Hz is
port (
		Clk_100MHz : in STD_LOGIC;
		Clk_1Hz : out STD_LOGIC);
end Div1Hz;

architecture Div1Hz_Arch of Div1Hz is
	constant MaxCountM : integer := 99_999_999;
	signal Count100M : integer range 0 to MaxCountM;
	signal cl : STD_Logic;
begin

	Frequency_Divider: process(Clk_100MHz, Count100M)
	  begin
		 if (rising_edge(Clk_100MHz)) then
			Count100M <= Count100M+1;
			if(Count100M = MaxCountM) then
				Count100M <= 0;
			end if;
		 end if;	  
		 
		 if (Count100M < MaxCountM/2) then
			  Clk_1Hz <= '1';
			else
			  Clk_1Hz <= '0';
			end if;
	  end process Frequency_Divider;
	  
	  -- Comment Frequency_Divider and uncomment code below for
	  --	testbench
--	  cl <= Clk_100MHz;
--	  Clk_1Hz <= cl;

end Div1Hz_Arch;

