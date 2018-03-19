library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity BasicALU is
	Port(	A	: in STD_LOGIC_VECTOR (7 downto 0);
			B	: in STD_LOGIC_VECTOR (7 downto 0);
			SW	: in STD_LOGIC_VECTOR (3 downto 0);
			CLK	: in STD_LOGIC;
			COM	: out STD_LOGIC_VECTOR (1 downto 0);
			C	: out STD_LOGIC_VECTOR (6 downto 0)
			 );
end BasicALU;

architecture Behavioral of BasicALU is
	signal notA	: STD_LOGIC_VECTOR (7 downto 0);
	signal add	: STD_LOGIC_VECTOR (7 downto 0);
	signal sub	: STD_LOGIC_VECTOR (7 downto 0);
	signal xoor	: STD_LOGIC_VECTOR (7 downto 0);
	signal shl	: STD_LOGIC_VECTOR (7 downto 0);
 
	signal X	: STD_LOGIC_VECTOR (3 downto 0);
	signal ANS	: STD_LOGIC_VECTOR (7 downto 0);
	signal fre_count	: integer range (0) to (100000) := 0;

begin

	notA	<= (not A);
	add		<= (not A) + (not B);
	sub		<= (not A) - (not B);
	xoor	<= (not A) xor (not B);
	shl		<= notA(6 downto 0) & '0';

	ANS		<=	add when SW(0) = '1' else 
				sub when SW(1) = '1' else
				xoor when SW(2) = '1' else
				shl when SW(3) = '1';

	process(clk) is
		begin

		if (rising_edge(clk)) then
			fre_count <= fre_count  + 1;
			if(fre_count  < 50000) then
				X <= ANS(3 downto 0);
				COM <= "10";
			else
				X <= ANS(7 downto 4);
				COM <= "01";
			end if;
		end if;

	end process;

	C <="1110001" when X = "1111" else -- F
		"1111001" when X = "1110" else -- E
		"1011110" when X = "1101" else -- D
		"0111001" when X = "1100" else -- C
		"1111100" when X = "1011" else -- B
		"1110111" when X = "1010" else -- A
		"1101111" when X = "1001" else -- 9
		"1111111" when X = "1000" else -- 8
		"0000111" when X = "0111" else -- 7
		"1111101" when X = "0110" else -- 6
		"1101101" when X = "0101" else -- 5
		"1100110" when X = "0100" else -- 4
		"1001111" when X = "0011" else -- 3
		"1011011" when X = "0010" else -- 2
		"0000110" when X = "0001" else -- 1
		"0111111";

end Behavioral;