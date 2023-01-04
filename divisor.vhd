library ieee;
use ieee.std_logic_1164.all;

entity divisor is
port(DD, DS: in std_logic_vector(3 downto 0);
Start, Rst, Mclk: in std_logic;
Hex0, Hex1, Hex4, Hex5: out std_logic_vector(7 downto 0);
Q, R: out std_logic_vector(3 downto 0);
Rdy: out std_logic);
end divisor;

architecture arc_div of divisor is
component Data_Path
port(A, B: in std_logic_vector(3 downto 0);
S, EDD, EDS, RST, CE, Clr, CLK: in std_logic;
Hex0, Hex1, Hex4, Hex5: out std_logic_vector(7 downto 0);
Q, R: out std_logic_vector(3 downto 0);
Bellow: out std_logic);
end component;

component ASM_ROM
port(Start, Bellow, RST, CLK: in std_logic;
S, EDD, EDS, R, CE, CLR, RDY: out std_logic);
end component;

signal b, muxS, e1, e2, rCC, eCC, clear: std_logic;

begin

asm: ASM_ROM port map(
Start => Start,
Bellow => b,
RST =>Rst,
CLK => Mclk,
S => muxS,
EDD => e1,
EDS => e2,
R => rCC,
CE => eCC,
CLR => clear,
RDY => Rdy);

data: Data_Path port map(
A => DD,
B => DS,
S => muxS,
EDD => e1,
EDS => e2,
RST => rCC,
CE => eCC,
Clr => clear,
CLK => Mclk,
Hex0 => Hex0,
Hex1 => Hex1,
Hex4 => Hex4,
Hex5 => Hex5,
Q => Q,
R => R,
Bellow => b);

end arc_div;