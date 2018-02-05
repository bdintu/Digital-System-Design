library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex3_3_2vf is
	Port(	A		: in STD_LOGIC_VECTOR (1 downto 0);
			COM	: out STD_LOGIC;
			Y		: out STD_LOGIC_VECTOR (6 downto 0)
	);
end ex3_3_2vf;

architecture Behavioral of ex3_3_2vf is
begin

	Y <=	"1110001" when A = "1111" else -- F
			"1111001" when A = "1110" else -- E
			"1011110" when A = "1101" else -- D
			"0111001" when A = "1100" else -- C
			"1111100" when A = "1011" else -- B
			"1110111" when A = "1010" else -- A
			"1101111" when A = "1001" else -- 9
			"1111111" when A = "1000" else -- 8
			"0000111" when A = "0111" else -- 7
			"1111101" when A = "0110" else -- 6
			"1101101" when A = "0101" else -- 5
			"1100110" when A = "0100" else -- 4
			"1001111" when A = "0011" else -- 3
			"1011011" when A = "0010" else -- 2
			"0000110" when A = "0001" else -- 1
			"0111111";

	COM <= '0';

end Behavioral;