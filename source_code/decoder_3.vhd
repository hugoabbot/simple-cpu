LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder_3 IS
	PORT
		(
			execute : IN STD_LOGIC;
			opcode : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			load : OUT STD_LOGIC;
			store : OUT STD_LOGIC;
			add : OUT STD_LOGIC;
			sub : OUT STD_LOGIC;
			inc : OUT STD_LOGIC;
			dec : OUT STD_LOGIC;
			bra : OUT STD_LOGIC;
			beq : OUT STD_LOGIC
			);
END decoder_3;

ARCHITECTURE decoder_type OF decoder_3 IS

BEGIN

	load <= execute AND (NOT(opcode(2)) AND NOT(opcode(1)) AND NOT(opcode(0)));
	store <= execute AND (NOT(opcode(2)) AND NOT(opcode(1)) AND opcode(0));
	add <= execute AND (NOT(opcode(2)) AND opcode(1) AND NOT(opcode(0)));
	sub <= execute AND (NOT(opcode(2)) AND opcode(1) AND opcode(0));
	inc <= execute AND (opcode(2) AND NOT(opcode(1)) AND NOT(opcode(0)));
	dec <= execute AND (opcode(2) AND NOT(opcode(1)) AND opcode(0));
	bra <= execute AND (opcode(2) AND opcode(1) AND NOT(opcode(0)));
	beq <= execute AND (opcode(2) AND opcode(1) AND opcode(0));
	
	
END decoder_type;