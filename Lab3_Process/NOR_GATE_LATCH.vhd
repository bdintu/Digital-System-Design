library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOR_GATE_LATCH is
	Port(	R, S		: in STD_LOGIC;
			Q, Q_Bar	: buffer STD_LOGIC
	);
end NOR_GATE_LATCH;

architecture Behavioral of NOR_GATE_LATCH is
begin

	Q 		<= R nor Q_Bar;
	Q_Bar <= S nor Q;

end Behavioral;

