----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:41:48 05/01/2018 
-- Design Name: 
-- Module Name:    encoder - Behavioral 
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

entity encoder is
    Port ( entrada : in  STD_LOGIC_VECTOR(15 downto 0);
           saida : inout  STD_LOGIC_VECTOR(39 downto 0)
			  );
end encoder;

architecture Behavioral of encoder is

begin
saida(15 downto 0) <= entrada;

saida(16) <= entrada(1) xor entrada(2) xor entrada(3);
saida(17) <= entrada(0) xor entrada(2) xor entrada(3);
saida(18) <= entrada(0) xor entrada(1) xor entrada(3);

saida(19) <= entrada(5) xor entrada(6) xor entrada(7);
saida(20) <= entrada(4) xor entrada(6) xor entrada(7);
saida(21) <= entrada(4) xor entrada(5) xor entrada(7);

saida(22) <= entrada(9) xor entrada(10) xor entrada(11);
saida(23) <= entrada(8) xor entrada(10) xor entrada(11);
saida(24) <= entrada(8) xor entrada(9) xor entrada(11);

saida(25) <= entrada(13) xor entrada(14) xor entrada(15);
saida(26) <= entrada(12) xor entrada(14) xor entrada(15);
saida(27) <= entrada(12) xor entrada(13) xor entrada(15);

saida(28) <= entrada(0) xor entrada(1) xor entrada(2) xor entrada(3) xor saida(16) xor saida(17) xor saida(18);
saida(29) <= entrada(4) xor entrada(5) xor entrada(6) xor entrada(7) xor saida(19) xor saida(20) xor saida(21);
saida(30) <= entrada(8) xor entrada(9) xor entrada(10) xor entrada(11) xor saida(22) xor saida(23) xor saida(24);
saida(31) <= entrada(12) xor entrada(13) xor entrada(14) xor entrada(15) xor saida(25) xor saida(26) xor saida(27);

saida(32) <= entrada(0) xor entrada(4) xor entrada(8) xor entrada(12);
saida(33) <= entrada(1) xor entrada(5) xor entrada(9) xor entrada(13);
saida(34) <= entrada(2) xor entrada(6) xor entrada(10) xor entrada(14);
saida(35) <= entrada(3) xor entrada(7) xor entrada(11) xor entrada(15);

saida(36) <= saida(16) xor saida(19) xor saida(22) xor saida(25);
saida(37) <= saida(17) xor saida(20) xor saida(23) xor saida(26);
saida(38) <= saida(18) xor saida(21) xor saida(24) xor saida(27);
saida(39) <= saida(28) xor saida(29) xor saida(30) xor saida(31);

end Behavioral;

