----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:17:39 09/11/2020 
-- Design Name: 
-- Module Name:    FileReg - Behavioral 
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
use work.array_port.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FileReg is
    Port ( WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           RegWrite : in  STD_LOGIC;
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadOut1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadOut2 : out  STD_LOGIC_VECTOR (31 downto 0));
end FileReg;

architecture Behavioral of FileReg is

	signal MUXIN : PORT32OF32;
	signal ENBus : STD_LOGIC_VECTOR(31 downto 0);
	
	component MUX32to1
	port ( DataIn : in  PORT32OF32;
           ReadReg : in  STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component Reg
	port ( WriteData : in STD_LOGIC_VECTOR (31 DOWNTO 0);
			 Enabler : in STD_LOGIC_VECTOR (31 DOWNTO 0);
			 CLK : in STD_LOGIC;
			 DataOut : out PORT32OF32);
	end component;
	
	component Decoder
	port ( WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
			 RegWrite : in STD_LOGIC;
			 Enabler : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;

begin

	M1: MUX32to1
	port map(
		DataOut => ReadOut1,
		ReadReg => ReadReg1,
		DataIn => MUXIN
	);
	
	M2: MUX32to1
	port map(
		DataOut => ReadOut2,
		ReadReg => ReadReg2,
		DataIn => MUXIN
	);
	
	R: Reg
	port map(
		WriteData => WriteData,
		Enabler => EnBus,
		CLK => CLK,
		DataOut => MUXIN
	);
	
	D: Decoder
	port map( 
		WriteReg => WriteReg,
		RegWrite => RegWrite,
		Enabler => EnBus
	);


end Behavioral;

