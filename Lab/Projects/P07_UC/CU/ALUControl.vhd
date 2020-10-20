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
signal Special : STD_LOGIC_VECTOR (2 downto 0);
begin
	with Instruc select
		Special <= "000" when "100100", --AND
						  "001" when "100101", --OR
						  "010" when "100000", --ADD
						  "110" when "100010", --SUB
						  "111" when "101010", -- SLT
						  "101" when others;

	with ALUOp select
		ALUCtrl <= "010" when "100", --ADD / LW,SW,ADDI
						"110" when "101", --SUB / BEQ
						"001" when "110", --OR /ORI
						"100" when "111", --B UPPER / LUI
						"101" when "010", --NOP
						Special when "000", --TIPO R
						"101" when others; --NOTHING
						
	Jr <= '1' when ALUOp = "001" and Instruc = "000000";
end Behavioral;

