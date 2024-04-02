library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity NOAA is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           d : in STD_LOGIC;
           y : out STD_LOGIC);
           attribute dont_touch : string;
           attribute dont_touch of NOAA:entity is "yes";
end NOAA;
architecture rtl of NOAA is
begin
     y <= not ((a and b) or (d and c)) after 5ns;
end rtl;
