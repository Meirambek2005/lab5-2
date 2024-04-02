library ieee;
use ieee.std_logic_1164.all;

entity Mealy is
 port (
    z : in std_logic_vector(3 downto 1);
    clk : in std_logic;
    w : out std_logic_vector(5 downto 1)
  );
end entity Mealy;

architecture rtl of Mealy is
  type state_type is (a1, a2, a3, a4);
  signal state : state_type := a1;
begin
  process (clk)
  begin
    if rising_edge(clk) then
      case state is
        when a1 =>
          case z(2 downto 1) is
            when "00" =>
              w <= "00001";
            when "01" =>
              w <= "00001";
            when "10" =>
              w <= "00010";
            when others =>
              w <= "00000";
          end case;
        when a2 =>
          case z(2 downto 1) is
            when "00" =>
              w <= "00001";
            when "01" =>
              w <= "00001";
            when "10" =>
              w <= "00011";
            when others =>
              w <= "00000";
          end case;
        when a3 =>
          case z(2 downto 1) is
            when "00" =>
              w <= "00010";
            when "01" =>
              w <= "00011";
            when "10" =>
              w <= "00100";
            when others =>
              w <= "00000";
          end case;
        when a4 =>
          case z(2 downto 1) is
            when "00" =>
              w <= "00100";
            when "01" =>
              w <= "00101";
            when "10" =>
              w <= "00101";
            when others =>
              w <= "00000";
          end case;
        when others =>
          w <= "00000";
      end case;
    end if;
  end process;
end rtl;

