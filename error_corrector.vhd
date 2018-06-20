----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:30:23 05/01/2018 
-- Design Name: 
-- Module Name:    error_corrector - Behavioral 
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

entity error_corrector is
    Port ( 	bit_in : in  STD_LOGIC;
				flip : in STD_LOGIC;
				bit_out : out  STD_LOGIC);
end error_corrector;

architecture Behavioral of error_corrector is

begin

bit_out <= bit_in xor flip;

end Behavioral;

