library IEEE;
use IEEE.std_logic_1164.all;

entity estadoCadenas101_tb is
end entity;

architecture structural of estadoCadenas101_tb is

    component estadoCadena101 is 

    port(

        X, CLK, RST : in std_logic;
        Z           : out std_logic

        );

    end component;

    signal  X, CLK, RST, Z : std_logic := '0';
    signal  clk_p : time := 20 ns;

    begin

        UUT: estadoCadena port map(

            X => X,
            CLK => CLK,
            RST => RST,
            Z => Z

        );

        process begin

            CLK <= '0';
            wait for clk_p/2;
            CLK <= '1'
            wait for clk_p/2;

        end process;

        process begin

            X <= '1';
            RST <= '0';
            wait for 10 ns;

            X <= '0';
            RST <= '0';
            wait for 10 ns;
            
            X <= '1';
            RST <= '0';
            wait for 10 ns;

            X <= '0';
            RST <= '1';
            wait for 10 ns;

            X <= '1';
            RST <= '1';
            wait for 10 ns;

            X <= '0';
            RST <= '1';
            wait for 10 ns;

            X <= '1';
            RST <= '1';
            wait for 10 ns;

            X <= '0';
            RST <= '0';
            wait;

        end process;

end structural;