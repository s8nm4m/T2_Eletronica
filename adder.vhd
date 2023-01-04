library ieee;
use ieee.std_logic_1164.all;

entity adder is
Port(A, B :in std_logic_vector(3 downto 0);
Ci: in std_logic;
Co: out std_logic;
S: out std_logic_vector(3 downto 0));
end adder;


architecture arc_adder of adder is
component full_adder
Port(A, B, Ci: in std_logic;
Co, S: out std_logic);
end component;

signal c1, c2, c3: std_logic;

begin

fa1: full_adder port map(
A => A(0),
B => B(0),
Ci => Ci,
S => S(0),
Co => c1);

fa2: full_adder port map(
A => A(1),
B => B(1),
Ci => C1,
S => S(1),
Co => c2);

fa3: full_adder port map(
A => A(2),
B => B(2),
Ci => C2,
S => S(2),
Co => c3);

fa4: full_adder port map(
A => A(3),
B => B(3),
Ci => C3,
S => S(3),
Co => Co);

end arc_adder;