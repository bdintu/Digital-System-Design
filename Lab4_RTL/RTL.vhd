library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RTL is
	generic (	sec_cycle : integer := 5000000;
					digit_cycle : integer := 100000
	);
	Port(	CLK	: in  STD_LOGIC;
			PB_H	: in STD_LOGIC;
			PB_M	: in STD_LOGIC;
			SEG	: out STD_LOGIC_VECTOR (6 downto 0);
			DOT	: out STD_LOGIC;
			SEG_COM	: out STD_LOGIC_VECTOR (3 downto 0)
	);
end RTL;

architecture Behavioral of RTL is
	signal sec_count	: integer range 0 to sec_cycle := 0;
	signal digit_count: integer range 0 to digit_cycle := 0;

	signal S0	: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal S1	: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal M0	: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal M1	: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal H0	: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal H1	: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal BCD	: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal S_DOT: STD_LOGIC := '0';

begin

	process(CLK) is
	  begin

			if CLK'event and CLK = '1' then
				sec_count <= sec_count + 1;
				digit_count <= digit_count + 1;
				
				if sec_count = 1 then
					S0 <= S0 + 1;
					S_DOT <= '1';
				elsif sec_count > sec_cycle/2 then
					S_DOT <= '0';
				end if;

				if S0 = "1010" then
					S0 <= "0000";
					S1 <= S1 + 1;
				elsif S1 = "0110" then
					S1 <= "0000";
					M0 <= M0 + 1;
				elsif M0 = "1010" then
					M0 <= "0000";
					M1 <= M1 + 1;
				elsif M1 = "0110" then
					M1 <= "0000";
					H0 <= H0 + 1;
				elsif H0 = "1010" then
					H0 <= "0000";
					H1 <= H1 + 1;
				elsif H1 = "0111" then
					H1 <= "0000";
				end if;
				
				if digit_count < digit_cycle/4 then
					BCD <= M0;
					DOT <= '0';
					SEG_COM <= "1110";
				elsif digit_count < digit_cycle/2 then
					BCD <= M1;
					DOT <= S_DOT;
					SEG_COM <= "1101";
				elsif digit_count < digit_cycle*3/4 then
					BCD <= H0;
					DOT <= S_DOT;
					SEG_COM <= "1011";
				elsif digit_count < digit_cycle then
					BCD <= H1;
					DOT <= '0';
					SEG_COM <= "0111";
				end if;
			
			end if;
	end process ;

	SEG <=	"1101111" when BCD = "1001" else -- 9
			"1111111" when BCD = "1000" else -- 8
			"0000111" when BCD = "0111" else -- 7
			"1111101" when BCD = "0110" else -- 6
			"1101101" when BCD = "0101" else -- 5
			"1100110" when BCD = "0100" else -- 4
			"1001111" when BCD = "0011" else -- 3
			"1011011" when BCD = "0010" else -- 2
			"0000110" when BCD = "0001" else -- 1
			"0111111";

end Behavioral;