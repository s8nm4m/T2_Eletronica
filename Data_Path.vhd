library ieee;
use ieee.std_logic_1164.all;


--DONE!
entity Data_Path is
port(A, B: in std_logic_vector(3 downto 0);
S, EDD, EDS, RST, CE, Clr, CLK: in std_logic;
Hex0, Hex1, Hex4, Hex5: out std_logic_vector(7 downto 0);
Q, R: out std_logic_vector(3 downto 0);
Bellow: out std_logic);
end Data_Path;

architecture arc_data of Data_Path is
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

component CC
port(
PL, CE, CLK: in std_logic;
Data_in: in std_logic_vector(3 downto 0);
TC: out std_logic;
Q: out std_logic_vector(3 downto 0));
end component;

component adder_subtractor
port(A, B: in std_logic_vector(3 downto 0);
Ci, OPau: in std_logic;
Co, B3: out std_logic;
S: out std_logic_vector(3 downto 0));
end component;

component decoderHex
port (Q, R : in std_logic_vector(3 downto 0);
clear : in std_logic;
HEX0, HEX1, HEX4, HEX5 : out std_logic_vector(7 downto 0));		
end component;

signal outsub, outmux, outr1, outr2, outcc: std_logic_vector(3 downto 0);
signal borrow: std_logic;

begin

umux: MUX2x1 port map(
B => A,
A => outsub,
S => S,
Y => outmux);

r1: Registry port map(
D => outmux,
E => EDD,
CLK => CLK,
Q => outr1);

r2: Registry port map(
D => B,
E => EDS,
CLK => CLK,
Q => outr2);

sub: adder_subtractor port map(
A => outr1,
B => outr2,
Ci => '0',
OPau => '1',
Co => borrow,
S => outsub);

counter: CC port map(
CLK => CLK,
CE => CE,
PL => RST,
Data_in => "0000",
Q => outcc);

Q <= outcc;
R <= outr1;

hex: decoderHex port map(
Q => outcc,
R => outr1,
clear => Clr,
HEX0 => Hex0,
HEX1 => Hex1, 
HEX4 => Hex4, 
HEX5 => Hex5);

Bellow <= borrow;
end arc_data;