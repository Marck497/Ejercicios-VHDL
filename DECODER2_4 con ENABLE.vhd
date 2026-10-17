library IEEE;
use IEEE.std_logic_1164.all;

entity decoder2_4_EN is

port(

    EN : in std_logic;
    A  : in std_logic_vector(1 DOWNTO 0);
    Y  : out std_logic_vector(3 DOWNTO 0)

    );

end decoder2_4_EN;

architecture behave of decoder2_4_EN is
begin

    Y <= "0000" when EN = '0' else
         "0001" when A = "00" else
         "0010" when A = "01" else
         "0100" when A = "10" else
         "1000" when A = "11" else
         "0000";

end behave;