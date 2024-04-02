library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_trigger is
end tb_trigger;

architecture Behavioral of tb_trigger is
    signal cnt : std_logic_vector(4 downto 0) := (others => '0');
    signal Q1, Q2 : std_logic;
begin
    cnt <= not cnt after 10ns;

    dut1: entity work.T_trigger_a(rtl)
            port map (
            R => cnt(4),
            S => cnt(3),
            Te => cnt(2),
            Ti => cnt(1),
            C => cnt(0),
            Q => Q1
        );

    dut2: entity work.T_trigger(rtl)
        port map (
            R => cnt(4),
            S => cnt(3),
            Te => cnt(2),
            Ti => cnt(1),
            C => cnt(0),
            Q => Q2
        );

end Behavioral;

