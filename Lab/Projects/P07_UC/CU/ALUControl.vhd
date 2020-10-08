----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:03:58 10/06/2020 
-- Design Name: 
-- Module Name:    ALUControl - Behavioral 
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

entity ALUControl is
    Port ( Instruc : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (2 downto 0);
           ALUCtrl : out  STD_LOGIC_VECTOR (2 downto 0);
			  Jr : out STD_LOGIC);
end ALUControl;

architecture Behavioral of ALUControl is
signal ALUCtrlBus : STD_LOGIC_VECTOR (2 downto 0);
begin
	Jr <= '1' when Instruc = "001000" else '0';
	with Instruc select
		ALUCtrlBus <= "000" when "100100",
						  "001" when "100101",
						  "010" when "100000",
						  "110" when "100010",
						  "111" when "101010",
						  "101" when others;
	
	ALUCtrl <= ALUCtrlBus when ALUOp = "000" else "101";
end Behavioral;

