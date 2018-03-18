library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex4_2_3vf is
	Port(	CLK, D, CLR	: in STD_LOGIC;
			Q			: out STD_LOGIC
	);
end ex4_2_3vf;

architecture Behavioral of ex4_2_3vf is
	signal QT, CLK_DB : STD_LOGIC;

begin

	CLK_DB <= not QT and CLK;

	process(CLK, CLR)
	begin

		if CLR = '0' then
			QT <= '0';
		elsif CLK_DB'event and CLK_DB = '1' then

			if D = '0' then
				QT <= '1';
			end if;
		end if;

	end process;
	
	Q <= QT;

end Behavioral;