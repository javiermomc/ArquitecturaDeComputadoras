----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:38:50 11/20/2019 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is

	Generic (
		size : integer := 32;
		word : integer := 32
	);
	Port	(
	READ_ADDRESS : in STD_LOGIC_VECTOR(size-1 downto 0);
	INSTRUCTION : out STD_LOGIC_VECTOR(word-1 downto 0)
	);
end ROM;

architecture Behavioral of ROM is

	type ROM_type is array (size-1 downto 0) of STD_LOGIC_VECTOR(word-1 downto 0);
	constant ROM : ROM_type := (
										-- Javi
--										x"00000000",x"00000000",x"00000000",
--										x"00000000",x"00000000",x"00000000",
--										x"00000000",x"00000000",x"00000000",
--										x"00000000",x"00000000",x"00000000",
--										x"00000000",x"00000000",x"00000000",
--										x"00000000",x"00000000",x"00000000",
--										x"00000000",x"00000000",x"00000000",
--										x"00000000",x"00000000",x"00000000",
--										x"00000000",x"00000000",
--										x"00000000",  -- NOP
--										x"00000000",  -- NOP
--										x"01098020", -- add $s0, $t0, $t1
--										x"20090001", -- addi $t1, $zero, 0x1
--										x"20080001", -- addi $t0, $zero, 0x1
--										x"00000000"  -- NOP
										-- Practice
										"00000000000000000000000000001000", -- jr r0				pc = 0
										"00000000000000000000000000000000", -- nop					NOP
										"10001101001010100000000000000000", -- lw r10 0x0(r9)		r10 = MEM[r9]
										"00000000000000000000000000000000", -- nop					NOP
										"10101101001010000000000000000000", -- sw r8 0x0(r9)		MEM[r9] = r8
										"00110101001010010000000000010100", -- ori r9 r9 0x14		r9 = r9 or 0x14
										"00100000000010010000000000100000", -- addi r9, r0, 0x20	r9 = r0 + 0x20		
										"00010000111010000000000001011100", -- beq r7 r8 L2			if (r7 == r8) pc += i << 2
										"00000000000010000011100000101010", -- L1 slt r7 r0 r8		r7 = r0 < r8
										"00100001000010000000000000000001", -- L2 addi r8 r8 1 		r8 = r8 + 1
										"00001000000000000000000001100000", -- J L1					pc = pc(31 downto 28) & i << 2				
										"00100001000010000000000000000001", -- addi r8 r8 1       	r8 = r8 + 1
										"00000000010000010011000000100100", -- and r6 r2 r1       	r6 = r2 and r1
										"00000000010000010010100000100010", -- sub r5 r2 r1       	r5 = r2 - r1
										"00000000010000010010000000100101", -- or r4 r2 r1        	r4 = r2 or r1
										"00000000010000010001100000100000", -- add r3 r2 r1       	r3 = r2 + r1
										"00000000000000000000000000000000", -- nop					NOP
										"10001100000000110000000000001000", -- lw r3 0x8(r0)      	r3 = MEM[2]
										"00000000000000000000000000000000", -- nop					NOP
										"10001100000000100000000000000100", -- lw r2 0x4(r0)     	r2 = MEM[1]
										"00000000000000000000000000000000", -- nop					NOP
										"10001100000000010000000000000000", -- lw r1 0x0(r0)      	r1 = MEM[0]
										"00000000000000000100000000100000", -- add r8 r0 r0       	r8 = 0  
										"00000000000000000000000000000000", -- nop					NOP
										"10101100000010000000000000001000", -- sw $t0, 0x8($zero)	MEM[3]=r8=3
										"00100000000010000000000000000011", -- addi $t0, $zero, 0x3	r8=3
										"00000000000000000000000000000000", -- nop					NOP
										"10101100000010000000000000000100", -- sw $t0, 0x4($zero)	MEM[1]=r8=2
										"00100000000010000000000000000010", -- addi $t0, $zero, 0x2	r8=2
										"00000000000000000000000000000000", -- nop					NOP
										"10101100000010000000000000000000", -- sw $t0, 0x0($zero)	MEM[0]=r8=1
										"00100000000010000000000000000001"  -- addi $t0, $zero, 0x1	r8=1
										);

begin

	INSTRUCTION <= ROM(to_integer(unsigned(READ_ADDRESS(6 downto 2))));

end Behavioral;

