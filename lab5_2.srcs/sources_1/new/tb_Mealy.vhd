library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity tb_Mealy is
end tb_Mealy;

architecture Behavioral of tb_Mealy is
    signal cnt : std_logic_vector(3 downto 1) := (others => '0');
    signal clk : std_logic := '0';
    signal w : std_logic_vector(5 downto 1);

begin
        cnt <= cnt + 1 after 1ns;
        clk <= not clk after 0.5ns;
       

    dut: entity work.Mealy(rtl)
        port map (
            z => cnt,
            clk => clk,
            w => w
        );

end Behavioral;
