library ieee;
use ieee.std_logic_1164.all;

-- CC -> contador crescente!
entity CC is port(
PL, CE, CLK: in std_logic;
Data_in: in std_logic_vector(3 downto 0);
TC: out std_logic;
Q: out std_logic_vector(3 downto 0));
end CC;

architecture arc_cc of CC is
component adder
Port(A, B :in std_logic_vector(3 downto 0);
Ci: in std_logic;
Co: out std_logic;
S: out std_logic_vector(3 downto 0));
end component;

component MUX2x1
port(A, B: in std_logic_vector(3 downto 0);
S: in std_logic;
Y: out std_logic_vector(3 downto 0));
end component;

component Registry
port(
D:in std_logic_vector(3 downto 0);
CLK, E: in std_logic;
Q: out std_logic_vector(3 downto 0));
end component;

component Terminal_Count
port(
Q : in std_logic_vector(3 downto 0);
TC: out std_logic);
end component;

signal outadder, outmux, outreg: std_logic_vector(3 downto 0);

begin

ad: adder port map(
A => outreg,
B => "0000",
Ci => CE,
S => outadder);

mux: MUX2x1 port map(
A => Data_in,
B => outadder,
S => PL,
Y => outmux);

reg: Registry port map(
E => '1',
D => outmux,
CLK => CLK,
Q => outreg);

Q <= outreg;

utc: Terminal_Count port map(
Q => outreg,
TC => TC);

end arc_cc;