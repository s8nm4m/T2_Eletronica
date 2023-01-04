library ieee;
use ieee.std_logic_1164.all;

entity adder_subtractor is
port(A, B: in std_logic_vector(3 downto 0);
Ci, OPau: in std_logic;
Co, B3: out std_logic;
S: out std_logic_vector(3 downto 0));
end adder_subtractor;

architecture arc_as of adder_subtractor is
component adder
Port(A, B: in std_logic_vector(3 downto 0);
Ci: in std_logic;
Co: out std_logic;
S: out std_logic_vector(3 downto 0));
end component;

signal xb: std_logic_vector(3 downto 0);
signal c, xci: std_logic;

begin
xb(0) <= B(0) xor OPau; 
xb(1) <= B(1) xor OPau;
xb(2) <= B(2) xor OPau;
xb(3) <= B(3) xor OPau;
xci <= Ci xor OPau;
add: adder port map(
A => A,
B(0) => xb(0),
B(1) => xb(1),
B(2) => xb(2),
B(3) => xb(3),
Ci => xci,
Co => c,
S => S);

B3 <= xb(3);
Co <= c xor OPau;

end arc_as;