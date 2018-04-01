library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity ALU_ACC is
	Port(	A		: in STD_LOGIC_VECTOR (7 downto 0);
			DIP		: in STD_LOGIC_VECTOR (4 downto 0);
			HAND_CLK	: in STD_LOGIC;
			CLK	: in STD_LOGIC;
			COM	: out STD_LOGIC_VECTOR (1 downto 0);
			C		: out STD_LOGIC_VECTOR (6 downto 0);
			LED	: out STD_LOGIC_VECTOR (7 downto 0);
			BUZ	: out STD_LOGIC
			 );
end ALU_ACC;

architecture Behavioral of ALU_ACC is
	signal ACC	: STD_LOGIC_VECTOR (7 downto 0);
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
	add	<= ACC + (not A);
	sub	<= ACC - (not A);
	xoor	<= ACC xor (not A);
	shl	<= ACC(6 downto 0) & '0';

	ANS	<=	add when HAND_CLK = '1' and DIP(0) = '1' else 
				sub when HAND_CLK = '1' and DIP(1) = '1' else
				xoor when HAND_CLK = '1' and DIP(2) = '1' else
				shl when HAND_CLK = '1' and DIP(3) = '1' else
				notA when HAND_CLK = '1' and DIP(4) = '1' else
				notA;
				
	ACC	<=	ANS when HAND_CLK = '1';

	BUZ	<= '1' when HAND_CLK = '1';
	LED	<= ANS;

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

	C	<=	"1110001" when X = "1111" else -- F
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