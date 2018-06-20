----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:10:00 05/01/2018 
-- Design Name: 
-- Module Name:    decoder - Behavioral 
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
use ieee.std_logic_misc.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder is
    Port ( entrada : in  STD_LOGIC_VECTOR(39 downto 0);
           saida : out  STD_LOGIC_VECTOR(15 downto 0)
			  );
end decoder;

architecture Behavioral of decoder is

COMPONENT encoder
	port( 
		entrada : in  STD_LOGIC_VECTOR(15 downto 0);
      saida : inout  STD_LOGIC_VECTOR(39 downto 0)
			  );
END COMPONENT;


for all: encoder use entity work.encoder(Behavioral);

signal comp, saida_enc  : std_logic_vector(39 downto 0);
signal HM, PC : std_logic_vector(3 downto 0);
signal SCB : std_logic_vector(11 downto 0);
signal D : std_logic_vector(15 downto 0);
signal SPa : std_logic_vector(3 downto 0);
signal SP : std_logic_vector(7 downto 0);
signal NE : std_logic;
begin

encDec : encoder 
	port map(
			entrada(15 downto 0),		--Entrada Encoder
			saida_enc						--Saida Decoder
	);
	
comp <= entrada xor saida_enc;

SCB <= comp(27 downto 16);
SPa <= comp(31 downto 28);
SP <= comp(39 downto 32);

NE <= not or_reduce(comp(39 downto 16));


rows: for I in 0 to 3 generate
	D(I*4+3 downto I*4) <= SPa(I) & SCB(I*3+2 downto I*3);
	PC(I) <= or_reduce(SP) and (SPa(I) xor or_reduce(SCB(I*3+2 downto I*3)));
	HM(I) <= SPa(I) and or_reduce(SCB(I*3+2 downto I*3)); 
	columns: for J in 0 to 3 generate
		saida(4*I+J) <= (entrada(4*I+J) xor ((not NE) and HM(I) and (not D(I*4+J)))) xor ((not NE) and PC(I) and SP(J));
	end generate columns;
end generate rows;
	

end Behavioral;

