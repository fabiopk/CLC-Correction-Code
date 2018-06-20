--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:35:48 05/01/2018
-- Design Name:   
-- Module Name:   C:/Users/Fabio/Downloads/HaaFuncionandoJaneiro-20180501T153158Z-001/TrabalhoCLC/test_dec.vhd
-- Project Name:  TrabalhoCLC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decoder
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
 
ENTITY test_dec IS
END test_dec;
 
ARCHITECTURE behavior OF test_dec IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder
    PORT(
         entrada : IN  std_logic_vector(39 downto 0);
         saida : INOUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(39 downto 0) := (others => '0');

	--BiDirs
   signal saida : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder PORT MAP (
          entrada => entrada,
          saida => saida
        );
		  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		entrada <= x"FFDEA6FAB1";
		
      wait for 400 ns;

		entrada <= x"FFDEA6FAF1";
		
      wait for period;

      -- insert stimulus here 

      wait;
   end process;

END;
