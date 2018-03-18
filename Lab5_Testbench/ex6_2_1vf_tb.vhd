library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use STD.TEXTIO.ALL;

entity ex6_2_1vf_tb is
end ex6_2_1vf_tb;
 
architecture behavior OF ex6_2_1vf_tb is

	component ex6_2_1vf
		Port(	A : IN  STD_LOGIC_VECTOR(3 downto 0);
				B : IN  STD_LOGIC_VECTOR(3 downto 0);
				C : OUT  STD_LOGIC_VECTOR(4 downto 0)
		);
	end component;

	signal A : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal B : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal C : STD_LOGIC_VECTOR(4 downto 0);

begin

	uut: ex6_2_1vf Port map(	A => A,
								B => B,
								C => C
	);

   process
		file file_in	: TEXT open read_MODE is "Input_4_Bit_Adder.txt";
		file file_out	: TEXT open WRITE_MODE is "Output_4_Bit_Adder.txt";
		variable line_ABCin	: LINE;
		variable line_Cout	: LINE;
		variable Ain, Bin, Cin, Cout	: integer;
		variable sum		: STD_LOGIC_VECTOR(4 downto 0);

	begin
		while not ENDFILE(file_in) loop
			readline(file_in, line_ABCin);
			read(line_ABCin, Ain);
			read(line_ABCin, Bin);
			read(line_ABCin, Cin);

			A <= conv_std_logic_vector(Ain, 4);
			B <= conv_std_logic_vector(Bin, 4);
			sum := conv_std_logic_vector(Cin, 5);

			wait for 10 ns;
			Cout := conv_integer(C);

			if(Cout = 0) then
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 1) then
				WRITE(line_Cout, string'("****     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****     *"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 2) then
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 3) then
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 4) then
				WRITE(line_Cout, string'("****  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****     *"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 5) then
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 6) then
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 7) then
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****     *"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 8) then
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 9) then
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 10) then
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****  *  *"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 11) then
				WRITE(line_Cout, string'("****  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 12) then
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 13) then
				WRITE(line_Cout, string'("****     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 14) then
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 15) then
				WRITE(line_Cout, string'("****  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("*  *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("****  *   "));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 16) then
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 17) then
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 18) then
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 19) then
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 20) then
				WRITE(line_Cout, string'("   *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 21) then
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 22) then
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 23) then
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 24) then
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 25) then
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 26) then
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *  *"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 27) then
				WRITE(line_Cout, string'("   *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 28) then
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 29) then
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *     *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *  *"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
			elsif(Cout = 30) then
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  *   "));
				WRITELINE(file_out, line_Cout);
				WRITE(line_Cout, string'("   *  ****"));
				WRITELINE(file_out, line_Cout);
			else
				WRITELINE(file_out, line_Cout);
			end if;

			WRITELINE(file_out, line_Cout);
			ASSERT c = SUM REPORT "Test failed!" SEVERITY error;
			wait for 30 ns;
		end loop;
		wait;
	end process;

end;
