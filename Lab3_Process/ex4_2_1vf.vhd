library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex4_2_1vf is
	Port(	CLK, CLR, D	: in STD_LOGIC;
			Q, Q_Bar	: out STD_LOGIC
	);
end ex4_2_1vf;

architecture Behavioral of ex4_2_1vf is
begin

	process(CLK, CLR)
	begin

		if CLR = '0' then
			Q		<= '0';
			Q_Bar	<= '1';
		elsif (CLK'event and CLK='0') then
			Q		<= D;
			Q_Bar	<= not D;
		end if;

	end process;

end Behavioral;