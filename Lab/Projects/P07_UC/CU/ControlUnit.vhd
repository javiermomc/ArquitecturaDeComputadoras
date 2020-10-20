----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:49:20 10/06/2020 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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

entity ControlUnit is
    Port ( opCode : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           Jump : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemToReg : out  STD_LOGIC;
           ALUOp : out  STD_LOGIC_VECTOR (2 downto 0);
           MemWrite : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC);
end ControlUnit;

architecture Behavioral of ControlUnit is

signal outBus : STD_LOGIC_VECTOR (7 downto 0);

begin	

	with opCode select
		outBus <= "10000001" when "000000", -- SPECIAL 
					 "00011011" when "100011", -- LW
					 "00000110" when "101011", -- SW
					 "00100000" when "000100", -- BEQ
					 "01000000" when "000010", -- J
					 "00000011" when "001000", -- ADDI
					 "00000011" when "001101", -- ORI
					 "00000011" when "001111", -- LUI
					 "00000000" when others;
	
	RegDst	<= outBus(0);
	Jump		<= outBus(1);
	Branch	<= outBus(2);
	MemRead	<= outBus(3);
	MemToReg <= outBus(4);
	MemWrite <= outBus(5);
	ALUSrc	<= outBus(6);
	RegWrite <= outBus(7);
	
	
	-- Used 0 for R type, 1 for I type and 2 for J type
	with opCode select
		ALUOp <= "000" when "000000", -- SPECIAL 
					"100" when "100011", -- LW
					"100" when "101011", -- SW
					"101" when "000100", -- BEQ
					"010" when "000010", -- J
					"100" when "001000", -- ADDI
					"110" when "001101", -- ORI
					"111" when "001111", -- LUI
					"010" when others;
			
end Behavioral;

