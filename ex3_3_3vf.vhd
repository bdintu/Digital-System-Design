library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex3_3 is
	Port(	A, B	: in  STD_LOGIC_VECTOR (3 downto 0);
			CLK	: in  STD_LOGIC;
			COM	: out  STD_LOGIC_VECTOR (1 downto 0);  
         Y		: out  STD_LOGIC_VECTOR (6 downto 0)
	);
end ex3_3;

architecture Behavioral of ex3_3 is
	signal AB	: STD_LOGIC_VECTOR (4 downto 0);
	signal X		: STD_LOGIC_VECTOR (3 downto 0);
	signal fre_count : integer range 0 to 500000 := 0;

begin
	AB <= not(('0'&A) + ('0'&B));

	process(CLK)
		begin
			
		if (clk'event and clk='1') then
			fre_count <= fre_count+1;
			if fre_count<=250000 then
				X <= AB(3 downto 0);
				COM <= "10";
			else
				X <= "000"&AB(4);
				COM <= "01";
			end if;
		end if;
	end process;

	Y <=	"1110001" when X = "1111" else -- F
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