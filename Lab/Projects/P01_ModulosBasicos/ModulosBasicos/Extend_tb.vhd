-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY Extend_tb IS
  END Extend_tb;

  ARCHITECTURE behavior OF Extend_tb IS 

  -- Component Declaration
          COMPONENT extender
          PORT(
                  A : IN std_logic_vector(15 downto 0);       
                  B : OUT std_logic_vector(31 downto 0)
                  );
          END COMPONENT;

          signal A : std_logic_vector(15 downto 0) := (others => '0');
			 signal B : std_logic_vector(31 downto 0) := (others => '0');
          

  BEGIN

  -- Component Instantiation
          uut: extender PORT MAP(
                  A => A,
                  B => B
          );


  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes
		  A<= "0000000000001111";
        -- Add user defined stimulus here
		  wait for 100 ns; -- wait until global set/reset completes
		  A<= "1111000000001111";
     END PROCESS tb;
  --  End Test Bench 

  END;
