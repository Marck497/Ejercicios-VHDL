library IEEE;
use IEEE.std_logic_1164.all;

entity puertaAND_tb is
end puertaAND_tb;

architecture behavior of puertaAND_tb is

signal A, B, Z : std_logic; 

component puertaAND is 
    
    port(

        A, B : in std_logic;
        Z    : out std_logic

    );

end component;

begin

    UUT: puertaAND port map(

        A => A,
        B => B,
        Z => Z

    );

    process begin
        
        A <= '0';
        B <= '0';
        wait for 10 ns;

        A <= '1';
        B <= '0';
        wait for 10 ns;

        A <= '0';
        B <= '1';
        wait for 10 ns;

        A <= '1';
        B <= '1';
        wait for 10 ns;

        A <= '0';
        B <= '0';
        wait;
    
    end process;

end behavior;