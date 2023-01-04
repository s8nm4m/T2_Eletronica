library ieee;
use ieee.std_logic_1164.all;

entity Registry is
port(
D:in std_logic_vector(3 downto 0);
CLK, E: in std_logic;
Q: out std_logic_vector(3 downto 0));
end Registry;

architecture arc_reg of Registry is
component FFD
port(	CLK : in std_logic;
		RESET : in std_logic;
		SET : in std_logic;
		D : in std_logic;
		EN : in std_logic;
		Q : out std_logic
		);
end component;

begin

ff0: FFD port map(
SET => '0',
RESET => '0',
CLK => CLK,
D => D(0),
EN => E,
Q => Q(0));

ff1: FFD port map(
SET => '0',
RESET => '0',
CLK => CLK,
D => D(1),
EN => E,
Q => Q(1));

ff2: FFD port map(
SET => '0',
RESET => '0',
CLK => CLK,
D => D(2),
EN => E,
Q => Q(2));

ff3: FFD port map(
SET => '0',
RESET => '0',
CLK => CLK,
D => D(3),
EN => E,
Q => Q(3));

end arc_reg;