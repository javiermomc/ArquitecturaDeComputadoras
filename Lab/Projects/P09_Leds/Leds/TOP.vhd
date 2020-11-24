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
    Port ( CLK 	: in  STD_LOGIC;
           RESET 	: in  STD_LOGIC;
			  IPORT	 			: in	 STD_LOGIC_VECTOR (31 downto 0);
			  OPORT	 			: out	 STD_LOGIC_VECTOR (31 downto 0);
			  Instruction_Out : out  STD_LOGIC_VECTOR (31 downto 0);
			  PC_Out 			: out  STD_LOGIC_VECTOR (31 downto 0);
			  Write_Data_Out 	: out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end TOP;

architecture Behavioral of TOP is

component ALUControl
	Port (  Instruc : in  STD_LOGIC_VECTOR (5 downto 0);
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
           ADDRESS : in  STD_LOGIC_VECTOR (size-1 downto 0);
           CLK : in  STD_LOGIC;
           WRITE_ENABLE : in  STD_LOGIC;
           READ_ENABLE : in  STD_LOGIC;
           WRITE_DATA : in  STD_LOGIC_VECTOR (word-1 downto 0);
			  IPORT	 			: in	 STD_LOGIC_VECTOR (31 downto 0);
			  OPORT	 			: out	 STD_LOGIC_VECTOR (31 downto 0);
           READ_DATA : out  STD_LOGIC_VECTOR (word-1 downto 0));
end component;

component ROM
	Generic ( size : integer := 32;
				 word : integer := 32);
	Port	( READ_ADDRESS : in STD_LOGIC_VECTOR(size-1 downto 0);
			  INSTRUCTION : out STD_LOGIC_VECTOR(word-1 downto 0));
end component;

component Shifter
    Port ( VARIN : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           VAROUT : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
end component;

component ShiftL2bits
    Port ( D : in STD_LOGIC_VECTOR (25 downto 0);
           Q : out STD_LOGIC_VECTOR (27 downto 0));
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

-- Shift Left 2 Address
signal SL_JumpAddress : std_logic_vector(27 downto 0);
signal JumpAddress : std_logic_vector(31 downto 0);

-- Shift Left 2 Instruction
signal SL2_Result : std_logic_vector(31 downto 0);

-- Sign Extend
signal SE_Result : std_logic_vector(31 downto 0);

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
signal Write_Register : std_logic_vector(4 downto 0);

-- ALU Control
signal ALUCtrl : std_logic_vector(2 downto 0);
signal Jr : std_logic;

-- ALU
signal ALU_Result : std_logic_vector(31 downto 0);
signal ALU_B : std_logic_vector(31 downto 0);
signal Zero : std_logic;

-- ADD PC
signal PC_4 : std_logic_vector(31 downto 0);

-- ADD Branch
signal Add_Result : std_logic_vector(31 downto 0);

-- Data Memory
signal Read_Data : std_logic_vector(31 downto 0);

-- MUX Jump
signal MUX_Branch : std_logic_vector(31 downto 0);
signal MUX_Jump : std_logic_vector(31 downto 0);
signal MUX_Jr : std_logic_vector(31 downto 0);

attribute keep : string;
attribute KEEP of MUX_Jr : signal is "true";
attribute KEEP of Read_Data : signal is "true";
attribute KEEP of IPORT : signal is "true";

begin

	M1: ALU
	port map(	
			A => Read_Data_1,
         B => ALU_B,
         Cntrl => ALUCtrl,
         Zero => Zero,
         Result => ALU_Result
	);
	
	M2: ALUControl
	port map(
		  Instruc => Instruction(5 downto 0),
		  ALUOp => ALUop,
		  ALUCtrl => ALUCtrl,
		  Jr => Jr
	);
	
	M3: ControlUnit
	port map(
		  opCode => Instruction(31 downto 26),
		  RegDst => RegDst,
		  Jump => Jump,
		  Branch => Branch,
		  MemRead => MemRead,
		  MemToReg => MemToReg,
		  ALUOp => ALUOp,
		  MemWrite => MemWrite,
		  ALUSrc => ALUSrc,
		  RegWrite => RegWrite
	);
	
	M4: FileReg
	port map(
		  WriteReg => Write_Register,
        RegWrite => RegWrite,
        WriteData => Write_Data,
		  CLK => CLK,
        ReadReg1 => Instruction(25 downto 21),
        ReadReg2 => Instruction(20 downto 16),
        ReadOut1 => Read_Data_1,
        ReadOut2 => Read_Data_2
	);
	
	M5: MUX_5bits
	port map(
		  D1 => Instruction(20 downto 16),
        D2 => Instruction(15 downto 11),
        S => RegDst,
        Q => Write_Register
	);
	
	M6: Program_counter
	port map(
		  D => MUX_Jr,
        Q => PC,
        RESET => RESET,
        CLK => CLK
	);
	
	M7: RAM
	port map(
		  ENABLE => '1',
		  ADDRESS => ALU_Result,
		  CLK => CLK,
		  WRITE_ENABLE => MemWrite,
		  READ_ENABLE => MemRead,
		  WRITE_DATA => Read_Data_2,
		  READ_DATA => Read_Data,
		  IPORT => IPort,
		  OPORT => OPort
	);
	
	M8: ROM
	port map(
		  READ_ADDRESS => PC,
		  INSTRUCTION => Instruction
	);
	
	-- Shifter Address
	M9: ShiftL2bits
	port map(
		  D => Instruction(25 downto 0),
        Q => SL_JumpAddress
	);
	
	JumpAddress <= Instruction(31 downto 28)&SL_JumpAddress;
	
	-- Shifter Add
	M10: Shifter
	port map(
		  VARIN => SE_Result,
        VAROUT => SL2_Result
	);
	
	-- Adder PC
	M11: Adder
	port map(
		  NUM1 => x"00000004",
        NUM2 => PC,
        SUM => PC_4
	);
	
	-- Adder Instruction
	M12: Adder
	port map(
		  NUM1 => PC_4,
        NUM2 => SL2_Result,
        SUM => Add_Result
	);
	
	M13: Extender
	port map(
		  A => Instruction(15 downto 0),
        B => SE_Result
	);
	
	-- MUX ALU
	M14: MUX_32bits
	port map(
		  D1 => Read_Data_2,
        D2 => SE_Result,
        S => ALUSrc,
        Q => ALU_B
	);
	
	-- MUX Branch
	M15: MUX_32bits
	port map(
		  D1 => PC_4,
        D2 => Add_Result,
        S => Branch AND Zero,
        Q => MUX_Branch
	);
	
	-- MUX Jump
	M16: MUX_32bits
	port map(
		  D1 => MUX_Branch,
        D2 => JumpAddress,
        S => Jump,
        Q => MUX_Jump
	);
	
	-- MUX Jr
	M17: MUX_32bits
	port map(
		  D1 => MUX_Jump,
        D2 => Read_Data_2,
        S => Jr,
        Q => MUX_Jr
	);
	
	-- MUX MemToReg
	M18: MUX_32bits
	port map(
		  D1 => ALU_Result,
        D2 => Read_Data,
        S => MemToReg,
        Q => Write_Data
	);
	
	PC_Out <= PC;
	Write_Data_Out <= Write_Data;
	Instruction_Out <= Instruction;
	
	
end Behavioral;

