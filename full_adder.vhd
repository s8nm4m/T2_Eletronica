library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
Port(A, B, Ci: in std_logic;
Co, S: out std_logic);
end full_adder;

architecture arc_fa of full_adder is
begin
S <= A xor B xor Ci;
Co <= (A and B) or (A and Ci) or (B and Ci);
end arc_fa;