library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AlarmClock is
	generic (	sec_cycle : integer := 20000000;
					digit_cycle : integer := 200000;
					pb_cycle : integer := 4000000
	);
	port(	CLK	: in STD_LOGIC;
			SW_A	: in STD_LOGIC;
			PB_H	: in STD_LOGIC;
			PB_M	: in STD_LOGIC;
			PB_S	: in STD_LOGIC;
			PB_SHOW_SEC : in STD_LOGIC;

			BUZZ		: out STD_LOGIC;			
			DOT		: out STD_LOGIC;
			SEG		: out STD_LOGIC_VECTOR (6 downto 0);
			SEG_COM	: out STD_LOGIC_VECTOR (3 downto 0)
	);
end AlarmClock;

architecture Behavioral of AlarmClock is
	signal sec_count	: integer range 0 to sec_cycle := 0;
	signal digit_count: integer range 0 to digit_cycle := 0;
	signal pb_s_count	: integer range 0 to pb_cycle := 0;

	signal S0			: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal S1			: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal M0			: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal M1			: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal H0			: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal H1			: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	
	signal AS0			: STD_LOGIC_VECTOR (3 downto 0) := "1001";
	signal AS1			: STD_LOGIC_VECTOR (3 downto 0) := "0101";
	signal AM0			: STD_LOGIC_VECTOR (3 downto 0) := "1001";
	signal AM1			: STD_LOGIC_VECTOR (3 downto 0) := "0101";
	signal AH0			: STD_LOGIC_VECTOR (3 downto 0) := "0011";
	signal AH1			: STD_LOGIC_VECTOR (3 downto 0) := "0010";

	signal BCD			: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal S_DOT		: STD_LOGIC := '0';
	signal is_alarm	: STD_LOGIC := '0';

begin

	process(CLK) is
	  begin

			if CLK'event and CLK = '1' then

				sec_count <= sec_count + 1;
				digit_count <= digit_count + 1;

				if sec_count = sec_cycle then
					S0 <= S0 + 1;
				end if;
				
				if sec_count < sec_cycle/2 or SW_A = '0' or PB_S = '1' or PB_M = '1' or PB_H = '1' then
					S_DOT <= '1';
				else
					S_DOT <= '0';
				end if;

				if PB_S = '1' then
					pb_s_count <= pb_s_count + 1;
				end if;

				if SW_A = '1' then
					if PB_H = '1' and digit_count = digit_cycle then
						H0 <= H0 + 1;
					end if;
					if PB_M = '1' and digit_count = digit_cycle then
						M0 <= M0 + 1;
					end if;

					if pb_s_count = pb_cycle then
						S0 <= S0 + 1;
					end if;

				else
					if PB_H = '1' and digit_count = digit_cycle then
						AH0 <= AH0 + 1;
					end if;
					if PB_M = '1' and digit_count = digit_cycle then
						AM0 <= AM0 + 1;
					end if;

					if pb_s_count = pb_cycle then
						AS0 <= AS0 + 1;
					end if;
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
				elsif H1 = "0010" and H0 = "0100" then
					H0 <= "0000";
					H1 <= "0000";
				end if;
				
				if AS0 = "1010" then
					AS0 <= "0000";
					AS1 <= AS1 + 1;
				elsif AS1 = "0110" then
					AS1 <= "0000";
					AM0 <= AM0 + 1;
				elsif AM0 = "1010" then
					AM0 <= "0000";
					AM1 <= AM1 + 1;
				elsif AM1 = "0110" then
					AM1 <= "0000";
					AH0 <= AH0 + 1;
				elsif AH0 = "1010" then
					AH0 <= "0000";
					AH1 <= AH1 + 1;
				elsif AH1 = "0010" and AH0 = "0100" then
					AH0 <= "0000";
					AH1 <= "0000";
				end if;
				
				if S0 = AS0 and S1 = AS1 and
					M0 = AM0 and M1 = AM1 and
					H0 = AH0 and H1 = AH1 then
					is_alarm <= '1';
				end if;
				
				if is_alarm = '1' and PB_S = '1' then
					is_alarm <= '0';
				end if;

				digit_count <= digit_count + 1;
				if SW_A = '1' then
					if digit_count < digit_cycle/4 then
						if PB_SHOW_SEC = '1' then
							BCD <= S0;
						else
							BCD <= M0;
						end if;					
						DOT <= '0';
						SEG_COM <= "1110";
					elsif digit_count < digit_cycle/2 then
						if PB_SHOW_SEC = '1' then
							BCD <= S1;
						else
							BCD <= M1;
						end if;
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

				else
					if digit_count < digit_cycle/4 then
						if PB_SHOW_SEC = '1' then
							BCD <= AS0;
						else
							BCD <= AM0;
						end if;					
						DOT <= '0';
						SEG_COM <= "1110";
					elsif digit_count < digit_cycle/2 then
						if PB_SHOW_SEC = '1' then
							BCD <= AS1;
						else
							BCD <= AM1;
						end if;
						DOT <= S_DOT;
						SEG_COM <= "1101";
					elsif digit_count < digit_cycle*3/4 then
						BCD <= AH0;
						DOT <= S_DOT;
						SEG_COM <= "1011";
					elsif digit_count < digit_cycle then
						BCD <= AH1;
						DOT <= '0';
						SEG_COM <= "0111";
					end if;
				end if;
			
			end if;
	end process ;
	
	BUZZ <= is_alarm;

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