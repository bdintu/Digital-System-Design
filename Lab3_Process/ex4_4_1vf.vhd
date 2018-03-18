library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex4_4_1 is
	Port(	CLK	: in  STD_LOGIC;
			Y	: out  STD_LOGIC_VECTOR (6 downto 0);
			COM	: out  STD_LOGIC
	);
end ex4_4_1;

architecture Behavioral of ex4_4_1 is
	signal BCD			: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal fre_count	: integer range 0 to 1650000 := 0;

begin

	process(CLK) is 
	  begin

			if CLK'event and CLK = '1' then
				fre_count <= fre_count + 1;

				if fre_count = 1 then
					BCD <= BCD + 1;
				end if;
			end if;

			if (BCD = "1010") then
				BCD <= "0000";
			end if;

	end process ;

	Y <=	"1101111" when BCD = "1001" else -- 9
			"1111111" when BCD = "1000" else -- 8
			"0000111" when BCD = "0111" else -- 7
			"1111101" when BCD = "0110" else -- 6
			"1101101" when BCD = "0101" else -- 5
			"1100110" when BCD = "0100" else -- 4
			"1001111" when BCD = "0011" else -- 3
			"1011011" when BCD = "0010" else -- 2
			"0000110" when BCD = "0001" else -- 1
			"0111111";

	COM <= '0';

end Behavioral;