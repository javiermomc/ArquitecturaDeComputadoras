--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:05:38 09/08/2020
-- Design Name:   
-- Module Name:   D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P03_Memory/Memory/RAM_tb.vhd
-- Project Name:  Memory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY RAM_tb IS
END RAM_tb;
 
ARCHITECTURE behavior OF RAM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM
    PORT(
         ENABLE : IN  std_logic;
         ADDRESS : IN  std_logic_vector(4 downto 0);
         CLK : IN  std_logic;
         WRITE_ENABLE : IN  std_logic;
         READ_ENABLE : IN  std_logic;
         WRITE_DATA : IN  std_logic_vector(31 downto 0);
         READ_DATA : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ENABLE : std_logic := '0';
   signal ADDRESS : std_logic_vector(4 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal WRITE_ENABLE : std_logic := '0';
   signal READ_ENABLE : std_logic := '0';
   signal WRITE_DATA : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal READ_DATA : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          ENABLE => ENABLE,
          ADDRESS => ADDRESS,
          CLK => CLK,
          WRITE_ENABLE => WRITE_ENABLE,
          READ_ENABLE => READ_ENABLE,
          WRITE_DATA => WRITE_DATA,
          READ_DATA => READ_DATA
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		ENABLE <= '1';
		ADDRESS <= "00000";
		WRITE_ENABLE <= '1';
		READ_ENABLE <= '0';
		WRITE_DATA <= x"0F01A0F0";
		
      wait for CLK_period*10;

      ENABLE <= '1';
		ADDRESS <= "00001";
		WRITE_ENABLE <= '1';
		READ_ENABLE <= '0';
		WRITE_DATA <= x"000A0000";
		
		wait for CLK_period*10;

      ENABLE <= '1';
		ADDRESS <= "00010";
		WRITE_ENABLE <= '1';
		READ_ENABLE <= '0';
		WRITE_DATA <= x"FFFFFFFF";
		
		wait for CLK_period*10;

      ENABLE <= '1';
		ADDRESS <= "00000";
		WRITE_ENABLE <= '0';
		READ_ENABLE <= '1';
		WRITE_DATA <= x"FFFFFFFF";
		
		wait for CLK_period*10;

      ENABLE <= '1';
		ADDRESS <= "00001";
		WRITE_ENABLE <= '0';
		READ_ENABLE <= '1';
		WRITE_DATA <= x"FFFFFFFF";
		
		wait for CLK_period*10;

      ENABLE <= '1';
		ADDRESS <= "00010";
		WRITE_ENABLE <= '0';
		READ_ENABLE <= '1';
		WRITE_DATA <= x"FFFFFFFF";
		
		wait for CLK_period*10;

      ENABLE <= '1';
		ADDRESS <= "00011";
		WRITE_ENABLE <= '1';
		READ_ENABLE <= '1';
		WRITE_DATA <= x"FFFFFFFF";
		
		wait for CLK_period*10;

      ENABLE <= '1';
		ADDRESS <= "00011";
		WRITE_ENABLE <= '0';
		READ_ENABLE <= '1';
		WRITE_DATA <= x"FFFFFFFF";
		
		wait for CLK_period*10;

      ENABLE <= '1';
		ADDRESS <= "00100";
		WRITE_ENABLE <= '0';
		READ_ENABLE <= '1';
		WRITE_DATA <= x"FFFFFFFF";
		
		wait for CLK_period*10;

      ENABLE <= '0';
		ADDRESS <= "00100";
		WRITE_ENABLE <= '1';
		READ_ENABLE <= '0';
		WRITE_DATA <= x"000aa000";
		
		wait for CLK_period*10;

      ENABLE <= '0';
		ADDRESS <= "00100";
		WRITE_ENABLE <= '0';
		READ_ENABLE <= '1';
		WRITE_DATA <= x"FFFFFFFF";
		
		wait for CLK_period*10;

      ENABLE <= '1';
		ADDRESS <= "00100";
		WRITE_ENABLE <= '0';
		READ_ENABLE <= '1';
		WRITE_DATA <= x"FFFFFFFF";

      wait;
   end process;

END;
