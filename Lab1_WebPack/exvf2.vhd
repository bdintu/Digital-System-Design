library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity exvf2 is
	Port(	A, B	: in  STD_LOGIC_VECTOR (2 downto 0);
			C		: out  STD_LOGIC_VECTOR (3 downto 0)
	);
end exvf2;

architecture Behavioral of exvf2 is
begin

	C <= ('0'&A) + ('0'&B);

end Behavioral;