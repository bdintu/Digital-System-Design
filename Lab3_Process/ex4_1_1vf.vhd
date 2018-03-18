library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex4_1_1vf is
	Port(	S1, R1, S2, R2			: in STD_LOGIC;
			Q1, Q1_Bar, Q2, Q2_Bar	: out STD_LOGIC
	);
end ex4_1_1vf;

architecture Behavioral of ex4_1_1vf is
signal Q1T, Q1T_Bar, Q2T, Q2T_Bar : STD_LOGIC;

begin
----------NAND GATE LATCH----------
	Q1T		<= S1 nand Q1T_Bar;
	Q1T_Bar	<= R1 nand Q1T;
	Q1		<= Q1T;
	Q1_Bar	<= Q1T_Bar;
----------NOR GATE LATCH----------
	Q2T		<= R2 nor Q2T_Bar;
	Q2T_Bar	<= S2 nor Q2T;
	Q2		<= Q2T;
	Q2_Bar	<= Q2T_Bar;

end Behavioral;