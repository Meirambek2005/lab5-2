library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity T_trigger is
    Port ( R : in STD_LOGIC;
           S : in STD_LOGIC;
           Te : in STD_LOGIC;
           Ti : in STD_LOGIC;
           C : in STD_LOGIC;
           Q : out STD_LOGIC);
end T_trigger;

architecture rtl of T_trigger is
signal out_N10, out_N5, out_N6, out_N8, out_N9 : std_logic;
    signal out_NOAA7, out_NOAA1, out_NOAA3 : std_logic;
    signal out_NAO2, out_NAO4 : std_logic;
    
begin
    inst_N10:entity work.N(rtl) 
    port map (
        a => R,
        y => out_N10
    );
    
    inst_N5: entity work.N(rtl)
     port map (
        a => C,
        y => out_N5
    );
    
    inst_N6: entity work.N(rtl)
     port map (
        a => out_N5,
        y => out_N6
    );
    
    inst_N8: entity work.N(rtl)
     port map (
        a => Te,
        y => out_N8
    );
    
    inst_NOAA7: entity work.NOAA(rtl) 
    port map (
        a => out_NAO4,
        b => out_N8,
        c => Ti,
        d => Te,
        y => out_NOAA7
    );
    
    inst_NOAA1: entity work.NOAA(rtl)
     port map (
        a => out_NAO2,
        b => out_N6,
        c => out_NOAA7,
        d => out_N5,
        y => out_NOAA1
    );
    
    inst_NOAA3: entity work.NOAA(rtl)
     port map (
        a => out_NAO4,
        b => out_N5,
        c => out_NAO2,
        d => out_N6,
        y => out_NOAA3
    );
    
    inst_NAO2: entity work.NAO(rtl) 
    port map (
        a => S,
        b => out_NOAA1,
        c => out_N10,
        y => out_NAO2
    );
    
    inst_NAO4: entity work.NAO(rtl) 
     port map (
        a => S,
        b => out_NOAA3,
        c => out_N10,
        y => out_NAO4
    );
    
    inst_N9: entity work.N(rtl) 
     port map (
        a => out_NAO4,
        y => Q
    );


end rtl;
