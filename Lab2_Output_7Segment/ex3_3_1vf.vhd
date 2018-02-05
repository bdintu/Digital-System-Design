library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex3_3_1vcxl is
	Port(	E : in STD_LOGIC;
			A : in STD_LOGIC_VECTOR (1 downto 0);
			D : out STD_LOGIC_VECTOR (3 downto 0)
	);
end ex3_3_1vcxl;

architecture Behavioral of ex3_3_1vcxl is
begin

	process(A, E)
	begin
	
		if E='0' then D <= "0000";
		elsif A="00" then D <= "0001";
		elsif A="01" then D <= "0010";
		elsif A="10" then D <= "0100";
		elsif A="11" then D <= "1000";
		else D <= "0000";
		end if;
	end process;

end Behavioral;