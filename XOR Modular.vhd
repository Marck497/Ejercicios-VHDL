library IEEE;
use IEEE.std_logic_1164.all;

entity xor_estructural is
port(

    A, B : in std_logic;
    Y    : out std_logic

    );

end xor_estructural;

architecture Structural of xor_estructural is

    signal NA, NB, AND1, AND2, OR1 : std_logic;

    component inversor is
    
        port(
        
        A : in std_logic;
        Y : out std_logic
    
        );
    
    end component;

    component puertaAND is

        port(

            A, B : in std_logic;
            Y    : out std_logic

            );

    end component;

    component puertaOR is

        port(

            A, B : in std_logic;
            Y    : out std_logic

            );

    end component;

begin

    IA: inversor port map(
       
        A => A,
        Y => NA
    
    );

    IB: inversor port map(
       
        A => B,
        Y => NB

    );

    A1: puertaAND port map(

        A => NA,
        B => B,
        Y => AND1

    );

    A2: puertaAND port map(

        A => A,
        B => NB,
        Y => AND2

    );

    OR1: puertaOR port map(

        A => AND1,
        B => AND2,
        Y => Y
    );

end Structural;