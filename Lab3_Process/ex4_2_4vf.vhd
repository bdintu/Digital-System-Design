library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex4_2_4vf is
	Port(	CLK, D, CLR_DB, J, K, CLR	: in STD_LOGIC;
			Q, Q_Bar					: out STD_LOGIC
	);
end ex4_2_4vf;


architecture Behavioral of ex4_2_4vf is
	component ex4_2_3vf
		Port(	CLK, D, CLR	: in STD_LOGIC;
				Q			: out STD_LOGIC
		);
	end component;

	signal CLK_DB, C, QT	: STD_LOGIC;
	signal JK				: STD_LOGIC_VECtOR(1 downto 0);

begin
	DEBOUNCER_JKFF : ex4_2_3vf port map(	CLK => CLK,
											D => D,
											CLR => CLR_DB,
											Q => C
	);

	JK <= j&K;
	
	process(C, CLR)
	begin

		if CLR = '1' then
			QT <= '0';
		elsif (C'event and C = '1') then
			
			if JK = "00" then QT <= QT;
			elsif JK = "01" then QT <= '0';
			elsif JK = "10" then QT <= '1';
			else QT <= not QT;
			end if;
		end if;

	end process;
	
	Q <= QT;
	Q_Bar <= not QT;

end Behavioral;