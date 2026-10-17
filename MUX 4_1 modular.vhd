library IEEE;
use IEEE.std_logic_1164.all;

entity muxModular is 
    port(

        S0, S1, A, B, C, D : in std_logic;
        Z                  : out std_logic

        );

end muxModular;

architecture structural of muxModular is

    signal q1, q2 : std_logic;

    component mux2_1 is 
        port(

            A, B, S0 : in std_logic;
            Z        : out std_logic

            );

    end component;

begin

    mux1: mux2_1 port map
        (

        A => A,
        B => B,
        S0 => S0, 
        Z => q1 

        );

    mux2: mux2_1 port map
        (

        A => C, 
        B => D,
        S0 => S0,
        Z => q2

        );

    mux3: mux2_1 port map
        (

        A => q1,
        B => q2,
        S0 => S1,
        Z => Z

        );


end structural;