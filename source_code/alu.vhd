LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY alu IS 
    PORT
    (
        f0 :  IN  STD_LOGIC;
        f1 :  IN  STD_LOGIC;
        p :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        q :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        Z :  OUT  STD_LOGIC;
        alu_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END alu;

ARCHITECTURE alu_type OF alu IS 

	COMPONENT adder_subtractor 
		PORT
			(
				sel :  IN  STD_LOGIC;
				cin :  IN  STD_LOGIC;
				a :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
				b :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
				cout :  OUT  STD_LOGIC;
				sum :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
			);
	END COMPONENT;
	
	SIGNAL a_input : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL b_input : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL as_sum : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL cout_line : STD_LOGIC;

BEGIN
	
	adder_subtractor_inst: adder_subtractor
		PORT MAP(
			sel => f0,
			cin => f0,
			a => a_input,
			b => b_input,
			cout => cout_line,
			sum => as_sum
		);
		
	a_input(0) <= (NOT(f1) AND p(0)) OR (f1 AND q(0));
	a_input(1) <= (NOT(f1) AND p(1)) OR (f1 AND q(1));
	a_input(2) <= (NOT(f1) AND p(2)) OR (f1 AND q(2));
	a_input(3) <= (NOT(f1) AND p(3)) OR (f1 AND q(3));
	a_input(4) <= (NOT(f1) AND p(4)) OR (f1 AND q(4));
	a_input(5) <= (NOT(f1) AND p(5)) OR (f1 AND q(5));
	a_input(6) <= (NOT(f1) AND p(6)) OR (f1 AND q(6));
	a_input(7) <= (NOT(f1) AND p(7)) OR (f1 AND q(7));
	
	b_input(0) <= (NOT(f1) AND q(0)) OR (f1 AND '1');
	b_input(1) <= (NOT(f1) AND q(1)) OR (f1 AND '0');
	b_input(2) <= (NOT(f1) AND q(2)) OR (f1 AND '0');
	b_input(3) <= (NOT(f1) AND q(3)) OR (f1 AND '0');
	b_input(4) <= (NOT(f1) AND q(4)) OR (f1 AND '0');
	b_input(5) <= (NOT(f1) AND q(5)) OR (f1 AND '0');
	b_input(6) <= (NOT(f1) AND q(6)) OR (f1 AND '0');
	b_input(7) <= (NOT(f1) AND q(7)) OR (f1 AND '0');
	
	alu_out <= as_sum;
	Z <= NOT(as_sum(0) OR as_sum(1) OR as_sum(2) OR as_sum(3) OR as_sum(4) OR as_sum(5) OR as_sum(6) OR as_sum(7));

END alu_type;