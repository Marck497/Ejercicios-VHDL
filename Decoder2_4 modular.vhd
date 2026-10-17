library IEEE;
use IEEE.std_logic_1164.all;

entity decoderModular is
    port(

        A, B, EN : in std_logic;
        Y0, Y1, Y2, Y3 : out std_logic

        );

end decoderModular;

architecture structural of decoderModular is

    signal P0, P1, P2, P3, NA, NB : std_logic;

    component inversor is
        
        port(

        A : in std_logic;
        Z : out std_logic        

        );
    
    end component;

    component puertaAND is

        port(

        A, B : in std_logic;
        Z    : out std_logic

        );

    end component;

begin

    I1: inversor port map(

        A => A,
        Z => NA

    );

    I2: inversor port map(

        A => B,
        Z => NB

    );

    and0: puertaAND port map(

        A => NA,
        B => NB,
        Z => P0

    );

    and1: puertaAND port map(

        A => NA,
        B => B,
        Z => P1

    );

    and2: puertaAND port map(

        A => A,
        B => NB,
        Z => P2

    );

    and3: puertaAND port map(

        A => A,
        B => B,
        Z => P3

    );

    andEN0: puertaAND port map(

        A => P0,
        B => EN,
        Z => Y0

    );

    andEN1: puertaAND port map(

        A => P1,
        B => EN,
        Z => Y1

    );

    andEN2: puertaAND port map(

        A => P2,
        B => EN,
        Z => Y2

    );

    andEN3: puertaAND port map(

        A => P3,
        B => EN,
        Z => Y3

    );

end structural;