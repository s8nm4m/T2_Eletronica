library ieee;
use ieee.std_logic_1164.all;

entity MUX2x1 is
port(A, B: in std_logic_vector(3 downto 0);
S: in std_logic;
Y: out std_logic_vector(3 downto 0));
end MUX2x1;

architecture arc_mux of MUX2x1 is
begin
Y(0)<=(S and A(0)) or (not S and B(0));
Y(1)<=(S and A(1)) or (not S and B(1));
Y(2)<=(S and A(2)) or (not S and B(2));
Y(3)<=(S and A(3)) or (not S and B(3));
end arc_mux;