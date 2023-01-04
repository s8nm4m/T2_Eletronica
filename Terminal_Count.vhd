library ieee;
use ieee.std_logic_1164.all;

entity Terminal_Count is
port(
Q : in std_logic_vector(3 downto 0);
TC: out std_logic);
end Terminal_Count;

architecture arc_tc of Terminal_Count is
begin
TC <= Q(0) and Q(1) and Q(2) and Q(3);
end arc_tc;