library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ASM_ROM is
port(Start, Bellow, RST, CLK: in std_logic;
S, EDD, EDS, R, CE, CLR, RDY: out std_logic);
end ASM_ROM;

architecture arc_rom of ASM_ROM is
component FFD
port(	CLK : in std_logic;
		RESET : in STD_LOGIC;
		SET : in std_logic;
		D : in STD_LOGIC;
		EN : in STD_LOGIC;
		Q : out std_logic
		);
end component;

type ROM_type is array(0 to 15) of std_logic_vector(8 downto 0);

constant ROM: ROM_type := (
0 => "000011101",
1 => "000011101",
2 => "010011101",
3 => "010011101",
4 => "110000100",
5 => "100000100",
6 => "110000100",
7 => "100000100",
8 => "001000000",
9 => "001000000",
10 => "101000000",
11 => "101000000",
12 => "010110010",
13 => "010110010",
14 => "010110010",
15 => "010110010");

signal addr: std_logic_vector(3 downto 0);
signal data: std_logic_vector(8 downto 0);
signal ps: std_logic_vector(1 downto 0);

begin

ff1: FFD port map(
CLK => CLK,
RESET => RST,
SET =>'0',
D => data(8),
EN => '1',
Q => ps(1));

ff0: FFD port map(
CLK => CLK,
RESET => RST,
SET =>'0',
D => data(7),
EN => '1',
Q => ps(0));

addr <= ps(1 downto 0) & Start & Bellow;
data <= ROM( to_integer(unsigned(addr)));
RDY <= data(6);
S <= data(5);
EDD <= data(4);
EDS <= data(3);
CLR <= data(2);
CE <= data(1);
R <= data(0);

end arc_rom;

