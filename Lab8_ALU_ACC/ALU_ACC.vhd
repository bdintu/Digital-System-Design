library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity ALU_ACC is
	Generic ( CYCLE : integer := 250000
	);

	Port(	A		: in STD_LOGIC_VECTOR (7 downto 0);
			DIP	: in STD_LOGIC_VECTOR (4 downto 0);
			ACT	: in STD_LOGIC;
			CLK	: in STD_LOGIC;
			COM	: out STD_LOGIC_VECTOR (1 downto 0);
			SEG	: out STD_LOGIC_VECTOR (6 downto 0);
			LED	: out STD_LOGIC_VECTOR (7 downto 0);
			BUZ	: out STD_LOGIC
	);
end ALU_ACC;

architecture Behavioral of ALU_ACC is
	signal ACC	: STD_LOGIC_VECTOR (7 downto 0) := (others=>'0');
	signal BCD	: STD_LOGIC_VECTOR (3 downto 0);
	signal SEL	: STD_LOGIC := '0';
	signal fre_count	: integer range (0) to (CYCLE) := 0;

begin

	alu : process(act) is
		begin

		if (rising_edge(act)) then
			if (DIP(0) = '0') then  -- Adder
				ACC <= ACC + (not A);
			elsif (DIP(1) = '0') then -- Subt
				ACC <= ACC + (not A);
			elsif (DIP(2) = '0') then -- XOR
				ACC <= ACC xor (not A);
			elsif (DIP(3) = '0') then -- SHL
				ACC <= ACC(6 downto 0) & '0';
			elsif (DIP(4) = '0') then -- SHL
				ACC <= (not A);
			end if;
		end if;

	end process alu;

	BUZ	<= ACT;
	LED	<= (not A);

	u_count : process(clk) is
		begin

		if (rising_edge(clk)) then
			fre_count <= fre_count  + 1;
			if (fre_count  = CYCLE) then
				SEL <= not SEL;
			end if;
		end if;

	end process u_count;

	BCD <=	ACC(3 downto 0) when SEL = '0' else
				ACC(7 downto 4);

	SEG <=	"1110001" when BCD = "1111" else -- F
				"1111001" when BCD = "1110" else -- E
				"1011110" when BCD = "1101" else -- D
				"0111001" when BCD = "1100" else -- C
				"1111100" when BCD = "1011" else -- B
				"1110111" when BCD = "1010" else -- A
				"1101111" when BCD = "1001" else -- 9
				"1111111" when BCD = "1000" else -- 8
				"0000111" when BCD = "0111" else -- 7
				"1111101" when BCD = "0110" else -- 6
				"1101101" when BCD = "0101" else -- 5
				"1100110" when BCD = "0100" else -- 4
				"1001111" when BCD = "0011" else -- 3
				"1011011" when BCD = "0010" else -- 2
				"0000110" when BCD = "0001" else -- 1
				"0111111";

	COM(1) <= not SEL;
	COM(0) <= SEL;

end Behavioral;