library IEEE;
use IEEE.std_logic_1164.all;

entity estadoCadenas101_tb is
end entity;

architecture behave of estadoCadenas101_tb is

    component estadoCadena is 

    port(

        X, CLK, RST : in std_logic;
        Z           : out std_logic

        );

    end component;

    signal  X, CLK, RST, Z : std_logic;

    begin

        UUT: estadoCadena port map(

            X => X,
            CLK => CLK,
            RST => RST,
            Z => Z

        );

        process begin

            X <= '1';
            CLK <= '0';
            RST <= '0';
            wait for 10 ns;

            X <= '0';
            CLK <= '1';
            RST <= '0';
            wait for 10 ns;
            
            X <= '1';
            CLK <= '1';
            RST <= '0';
            wait for 10 ns;

            X <= '0';
            CLK <= '0';
            RST <= '1';
            wait for 10 ns;

            X <= '1';
            CLK <= '0';
            RST <= '1';
            wait for 10 ns;

            X <= '0';
            CLK <= '1';
            RST <= '1';
            wait for 10 ns;

            X <= '1';
            CLK <= '1';
            RST <= '1';
            wait for 10 ns;

            X <= '0';
            CLK <= '0';
            RST <= '0';
            wait;

        end process;

end behave;