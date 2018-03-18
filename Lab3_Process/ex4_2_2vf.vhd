library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex4_2_2vf is
	Port(	CLK, R, D	: in STD_LOGIC;
			Q, Q_Bar	: out STD_LOGIC
	);
end ex4_2_2vf;

architecture Behavioral of ex4_2_2vf is
begin

	process(CLK)
	begin

		if (CLK'event and CLK='0') then
			if R = '0' then
				Q		<= '0';
				Q_Bar	<= '1';
			else
				Q		<= D;
				Q_Bar	<= not D;
			end if;
		end if;

	end process;

end Behavioral;