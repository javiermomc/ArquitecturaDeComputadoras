----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:44:13 10/27/2020 
-- Design Name: 
-- Module Name:    TOP - Behavioral 
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

entity TOP is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC);
end TOP;

architecture Behavioral of TOP is

component ALUControl
	Port ( Instruc : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (2 downto 0);
           ALUCtrl : out  STD_LOGIC_VECTOR (2 downto 0);
			  Jr : out STD_LOGIC);
end component;

component ALU
    Port ( A		:	in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           B 	 	:	in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           Cntrl	: 	in  STD_LOGIC_VECTOR (2 DOWNTO 0);
           Zero	: 	out  STD_LOGIC;
           Result : 	out  STD_LOGIC_VECTOR (31 DOWNTO 0));
end component;

component ControlUnit
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
end component;

component FileReg
	Port ( WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           RegWrite : in  STD_LOGIC;
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadOut1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadOut2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX_32bits
    Port ( D1 : in  STD_LOGIC_VECTOR (31 downto 0);
           D2 : in  STD_LOGIC_VECTOR (31 downto 0);
           S : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX_5bits
    Port ( D1 : in  STD_LOGIC_VECTOR (4 downto 0);
           D2 : in  STD_LOGIC_VECTOR (4 downto 0);
           S : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component Program_counter
    Port ( D : in  STD_LOGIC_VECTOR (31 downto 0);
           Q : out  STD_LOGIC_VECTOR (31 downto 0);
           RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC);
end component;

component RAM
	Generic ( size : integer := 32;
				 word : integer := 32);
    Port ( ENABLE : in  STD_LOGIC;
           ADDRESS : in  STD_LOGIC_VECTOR (size downto 0);
           CLK : in  STD_LOGIC;
           WRITE_ENABLE : in  STD_LOGIC;
           READ_ENABLE : in  STD_LOGIC;
           WRITE_DATA : in  STD_LOGIC_VECTOR (word-1 downto 0);
           READ_DATA : out  STD_LOGIC_VECTOR (word-1 downto 0));
end component;

component ROM
	Generic ( size : integer := 32;
				 word : integer := 32);
	Port	( READ_ADDRESS : in STD_LOGIC_VECTOR(size/8-1 downto 0);
			  INSTRUCTION : out STD_LOGIC_VECTOR(word-1 downto 0));
end component;

component ShiftL2bits
    Port ( D : in STD_LOGIC_VECTOR (25 downto 0);
           Q : out STD_LOGIC_VECTOR (27 downto 0));
end component;

component Shifter
    Port ( VARIN : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           VAROUT : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
end component;

component Adder
    Port ( NUM1 : in  STD_LOGIC_VECTOR (31 downto 0);
           NUM2 : in  STD_LOGIC_VECTOR (31 downto 0);
           SUM : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Extender
    Port ( A : in std_logic_vector (15 downto 0) := "1111000000001111";
           B : out std_logic_vector (31 downto 0) := (others => '0'));
end component;

-- PC
signal PC : std_logic_vector(31 downto 0);
signal PC_4 : std_logic_vector(31 downto 0);

-- Shift Left 2
signal JumpAddress : std_logic_vector(31 downto 0);

-- Instruction Memory
signal Instruction : std_logic_vector(31 downto 0);

-- Control Unit
signal RegDst : std_logic;
signal Jump : std_logic;
signal Branch : std_logic;
signal MemRead : std_logic;
signal MemToReg : std_logic;
signal MemWrite : std_logic;
signal ALUSrc : std_logic;
signal RegWrite : std_logic;
signal ALUop : std_logic_vector(2 downto 0);

-- Register File
signal Read_Data_1 : std_logic_vector(31 downto 0);
signal Read_Data_2 : std_logic_vector(31 downto 0);
signal Write_Data : std_logic_vector(31 downto 0);

-- ALU Control
signal ALUCtrl : std_logic;
signal Jr : std_logic;

-- ALU
signal ALU_Result : std_logic_vector(31 downto 0);
signal ALU_B : std_logic_vector(31 downto 0);


begin


end Behavioral;

