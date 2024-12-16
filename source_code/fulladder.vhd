LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;

ENTITY fulladder IS
	PORT (
		A	: 	IN STD_LOGIC;
		B	:	IN STD_LOGIC;
		CIN:	IN STD_LOGIC;
		S	:	OUT STD_LOGIC;
		Cout	:	OUT STD_LOGIC
		);
END fulladder;

ARCHITECTURE rtl of fulladder IS 

	SIGNAL AxorB : STD_LOGIC; 
	
	BEGIN
	AxorB <= A XOR B;
	S <= AxorB XOR Cin;
	Cout <= (A AND Cin) OR (B AND Cin) OR (A AND B);
END rtl;