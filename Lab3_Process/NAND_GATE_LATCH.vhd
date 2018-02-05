library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND_GATE_LATCH is
	Port(	R, S 		: in STD_LOGIC;
			Q, Q_Bar : buffer STD_LOGIC
	);
end NAND_GATE_LATCH;

architecture Behavioral of NAND_GATE_LATCH is
begin

	Q		<= S nand Q_Bar;
	Q_Bar	<= R nand Q;

end Behavioral;