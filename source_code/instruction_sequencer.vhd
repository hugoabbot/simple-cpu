LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;

ENTITY instruction_sequencer IS
	PORT (
		opcode  :  IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		reset	  :  IN STD_LOGIC;
		clock	  :  IN STD_LOGIC;
		t0	     :  OUT STD_LOGIC;
		t1	     :  OUT STD_LOGIC;
		t2	     :  OUT STD_LOGIC;
		t3	     :  OUT STD_LOGIC;
		t4	     :  OUT STD_LOGIC;
		t5      :  OUT STD_LOGIC;
		t6      :  OUT STD_LOGIC;
		t7      :  OUT STD_LOGIC;
		execute :  OUT STD_LOGIC
		);
END instruction_sequencer;

ARCHITECTURE instruction_sequencer_0 of instruction_sequencer IS 
	COMPONENT d_ff
		PORT (
			reset	: 	IN STD_LOGIC;
			clock	: 	IN STD_LOGIC;
			d		: 	IN STD_LOGIC;
			q		: 	OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL s0 : STD_LOGIC; 
	SIGNAL s1 : STD_LOGIC;
	SIGNAL s2 : STD_LOGIC;
	SIGNAL s0_next : STD_LOGIC; 
	SIGNAL s1_next : STD_LOGIC;
	SIGNAL s2_next : STD_LOGIC;
	
	BEGIN
	
	d_ff_0 : d_ff
		PORT MAP (
			reset => reset,
			clock => clock,
			d => s0_next,
			q => s0
		);
		
	d_ff_1 : d_ff
		PORT MAP (
			reset => reset,
			clock => clock,
			d => s1_next,
			q => s1
		);
		
	d_ff_2 : d_ff
		PORT MAP (
			reset => reset,
			clock => clock,
			d => s2_next,
			q => s2
		);
		
	s0_next <= (NOT(s2) AND NOT(s0)) OR (s1 AND NOT(s0)) OR (NOT(opcode(2)) AND NOT(s0)) OR (NOT(opcode(1)) AND NOT(s0));
	s1_next <= (s1 AND NOT(s0)) OR (opcode(2) AND NOT(s1) AND s0) OR (opcode(1) AND NOT(s1) AND s0) OR (NOT(s2) AND NOT(s1) AND s0);
	s2_next <= (NOT(s2) AND s1 AND s0) OR (NOT(opcode(1)) AND s2 AND NOT(s0)) OR (s2 AND s1 AND NOT(s0)) OR (NOT(opcode(2)) AND opcode(1) AND s2 AND NOT(s1)) OR (opcode(2) AND NOT(opcode(1)) AND s2 AND NOT(s1));
	
	execute <= s2;
	
	t0 <= NOT(s2) AND NOT(s1) AND NOT(s0);
	t1 <= NOT(s2) AND NOT(s1) AND s0;
	t2 <= NOT(s2) AND s1 AND NOT(s0);
	t3 <= NOT(s2) AND s1 AND s0;
	t4 <= s2 AND NOT (s1) AND NOT(s0);
	t5 <= s2 AND NOT(s1) AND s0;
	t6 <= s2 AND s1 AND NOT(s0);
	t7 <= s2 AND s1 AND s0;
	
END instruction_sequencer_0;