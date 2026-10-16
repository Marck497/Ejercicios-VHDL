library IEEE;
use IEEE.std_logic_1164.all;

entity circuito_Flip_XOR_Flop is
port(

    D, RST, CLK : in std_logic;
    Q           : out std_logic

    );
end circuito_Flip_XOR_Flop;

architecture behavior of circuito_Flip_XOR_Flop is
signal q1 : std_logic;
begin

    process(CLK, RST) begin
    
        if RST = '1' then

            if rising_edge(CLK) then

                q1 <= D;
                Q <= D XOR q1;

            end if;

        else

            q1 <= '0';
            Q <= '0';
        
        end if;

    end process;

end behavior;