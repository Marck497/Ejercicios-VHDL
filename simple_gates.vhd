--Ejercicios pochos la verdad, pero es para aburrirme a hacer estas cosas para hacerlo rapidito sin trabarme en el examen
library IEEE;
use IEEE.std_logic_1164.all;

--Puerta AND
entity puertaAND is 
    port(

        A, B : in std_logic;
        F    : out std_logic

        );

end puertaAND;

architecture behaviour of puertaAND is
begin

    F <= A and B;

end behaviour;


--PuertaOR
entity puertaOR is
    port(

        A, B : in std_logic;
        F    : out std_logic;

        );

end puertaOR;

architecture behaviour of puertaOR is
begin

    F <= A or B;

end behaviour;