library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity NAO is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           y : out STD_LOGIC);
           
           attribute dont_touch : string;
           attribute dont_touch of NAO:entity is "yes";

end NAO;
architecture rtl of NAO is
begin
    y <= not ((a or b) and c) after 5ns;
end rtl;
