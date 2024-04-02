library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity T_trigger_a is
    Port ( R : in STD_LOGIC;
           S : in STD_LOGIC;
           Te : in STD_LOGIC;
           Ti : in STD_LOGIC;
           C : in STD_LOGIC;
           Q : inout STD_LOGIC:='0');
end T_trigger_a;

architecture rtl of T_trigger_a is

 signal Q_next : std_logic;
begin
    process (R, S,Te,Ti,C)
    begin
        if rising_edge(C) then
            if R = '1' then
                Q_next <= '0';
            elsif S = '1' then
                Q_next <= '1';
            else
                if Te = '1' then
                    Q_next <= not Q;
                elsif Ti = '1' then
                    Q_next <= Ti;
                else
                    Q_next <= Q;
                end if;
            end if;
        end if;
    end process;

    Q <= Q_next when rising_edge(C);
end rtl;
