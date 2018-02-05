library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_LATCH is
	Port(	G, D	: in STD_LOGIC;
			Q		: out STD_LOGIC
	);
end D_LATCH;

architecture Behavioral of D_LATCH is
begin

	process(G, D)
	begin
	
		if G = '1' then Q <= D;
		end if;
	end process;

end Behavioral;

