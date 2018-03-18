library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex6_2_1vf is
	Port(	A, B	: in  STD_LOGIC_VECTOR (3 downto 0);
			C		: out  STD_LOGIC_VECTOR (4 downto 0)
	);
end ex6_2_1vf;

architecture Behavioral of ex6_2_1vf is
begin

	C <= ('0'&A) + ('0'&B);

end Behavioral;