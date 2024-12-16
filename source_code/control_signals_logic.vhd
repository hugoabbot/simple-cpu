LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL;

entity control_signals_logic is
  port (
    load : in std_logic;
    store : in std_logic;
    add : in std_logic;
    sub : in std_logic;
    inc : in std_logic;
    dec : in std_logic;
    bra : in std_logic;
    beq : in std_logic;
    t0 : in std_logic;
    t1 : in std_logic;
    t2 : in std_logic;
    t3 : in std_logic;
    t4 : in std_logic;
    t5 : in std_logic;
    t6 : in std_logic;
    t7 : in std_logic;
    Z : in std_logic;
    r : out std_logic; -- read signal
    w : out std_logic; -- write signal
    cmar : out std_logic;
    cmbr : out std_logic;
    embr : out std_logic;
    cir : out std_logic;
    eir : out std_logic;
    cpc : out std_logic;
    epc : out std_logic;
    cd0 : out std_logic;
    ed0 : out std_logic;
    calu : out std_logic;
    ealu : out std_logic;
    F0 : out std_logic;
    F1 : out std_logic
    );
  
end control_signals_logic;

architecture rtl of control_signals_logic is 

begin  -- rtl

  r <= t1 or (t5 and (load or add or sub or inc or dec));
  w <= (store and t5) or (inc and t7) or (dec and t7);
  cmar <= t0 or (t4 and (load or store or add or sub or inc or dec));
  cmbr <= t5 and (add or sub or inc or dec);
  embr <= t6 and (add or sub or inc or dec);
  cir <= t1;
  eir <= t4 and (load or store or add or sub or inc or dec or bra or (beq and Z));
  cpc <= t3 or (bra and t4) or (beq and Z and t4);
  epc <= t0 or t2;
  cd0 <= (load and t5) or (t7 and (add or sub));
  ed0 <= store and t5;
  calu <= t2 or (t6 and (add or sub or inc or dec));
  ealu <= t3 or (t7 and (add or sub or inc or dec));
  F0 <= t6 and (sub or dec);
  F1 <= t2 or (t6 and (inc or dec));
  
end rtl;
