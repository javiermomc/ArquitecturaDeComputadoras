----------------------------------------------------------------------------------
--Laboratorio de Arquitectura de computadoras
--Práctica #0
--HOLA
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Hola is
	port( clk: in std_logic; 
			display: out std_logic_vector(3 downto  0) := "1111";
			segmentos: out std_logic_vector(7 downto 0) := "11111111");	
end Hola;

architecture Behavioral of Hola is
begin
	process(clk)
	variable cont : natural range 0 to 500000 := 0;
	begin
		if(rising_edge(clk)) then
			cont := cont + 1;
			case cont is 
				when 0 to 124999      => display <= "0111";
										       segmentos <= "10001001";
				when 125000 to 249999 => display <= "1011";
												 segmentos <= "11000000"; 
				when 250000 to 374999 => display <= "1101";
												 segmentos <= "11000111";
				when 375000 to 499999 => display <= "1110";
												 segmentos <= "10001000";
				when 500000           => cont := 0;
				when others           => display <= "1111";
												 segmentos <= "01111111";
												 cont := 0;
			end case;
		end if;
	end process;		
end Behavioral;

