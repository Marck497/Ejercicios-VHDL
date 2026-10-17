library IEEE;
use IEEE.std_logic_1164.all;

entity estadoCadenas101 is
port(

    X, CLK, RST : in std_logic;
    Z           : out std_logic

    );
end estadoCadenas101;

architecture behave of estadoCadenas101 is

type state_type is (S0, S1, S2, S3);
signal cs, nxs : state_type;

begin

process(CLK)
begin

    if rising_edge(CLK) then
        if RST = '1' then --Sincrono a lvl alto

            cs <= S0;
        
        else

            cs <= nxs;

        end if;
    end if;

end process;

process(cs, X) begin

    case cs is

        when S0 =>
            
            Z <= '0';
            if X = '1' then
                nxs <= S1;
            else
                nxs <= S0;
            end if;
        
        when S1 =>
            
            Z <= '0';
            if X = '1' then
                nxs <= S1;
            else
                nxs <= S2;
            end if;

        when S2 =>

            Z <= '0';
            if X = '1' then
                nxs <= S3;
            else
                nxs <= S0;
            end if;

        when S3 =>

            Z <= '1';
            if X = '1' then
                nxs <= S1;
            else
                nxs <= S2;
            end if;

        when others =>

            Z <= '0';
            nxs <= S0;

        end case;
            
    end process;

end estadoCadenas101;