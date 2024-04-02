library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity N is
    Port ( a : in STD_LOGIC;
           y : out STD_LOGIC);
           attribute dont_touch : string;
           attribute dont_touch of N:entity is "yes";
end N;
architecture rtl of N is
begin
y <= not a after 5ns;
end rtl;
