library IEEE;
use IEEE.std_logic_1164.all;

entity decoderModular_tb is
end entity;

architecture behave of decoderModular_tb is

component decoderModular is
    port(

        A, B, EN : in std_logic;
        Y0, Y1, Y2, Y3 : out std_logic

        );
end component;

signal A, B, EN, Y0, Y1, Y2, Y3 : std_logic; 

begin

    UUT: decoderModular port map(

        A => A,
        B => B,
        EN => EN,
        Y0 => Y0,
        Y1 => Y1,
        Y2 => Y2,
        Y3 => Y3

    );

    process begin

        A <= '0';
        B <= '0';
        EN <= '0';
        wait for 10 ns;

        A <= '1';
        B <= '0';
        EN <= '0';
        wait for 10 ns;
        
        A <= '0';
        B <= '1';
        EN <= '0';
        wait for 10 ns;

        A <= '1';
        B <= '1';
        EN <= '0';
        wait for 10 ns;

        A <= '0';
        B <= '0';
        EN <= '1';
        wait for 10 ns;

        A <= '1';
        B <= '0';
        EN <= '1';
        wait for 10 ns;

        A <= '0';
        B <= '1';
        EN <= '1';
        wait for 10 ns;

        A <= '1';
        B <= '1';
        EN <= '1';
        wait for 10 ns;

        A <= '0';
        B <= '0';
        EN <= '0';
        wait;

    end process;

end behave;