library IEEE;
use IEEE.std_logic_1164.all;

entity meleey110 is
port(

    X, CLK, RST : in std_logic;
    Z           : out std_logic

    );
end meleey110;

architecture behave of meleey110 is

type state_type is (S0,S1,S2);
signal cs, nxs : state_type; 

begin

    process(CLK, RST) begin
        if RST = '0' then --Asincrono a lvl bajo

            cs <= S0;

        else

            if rising_edge(CLK) then

                cs <= nxs;

            end if;

        end if;

    end process;

    process(cs, X) begin

        case cs is

            when S0 =>
                
                if X = '1' then
                    
                    Z <= '0';
                    nxs <= S1;

                else 

                    Z <= '0';
                    nxs <= S0;

                end if;

            when S1 =>
                
                if X = '1' then
                    
                    Z <= '0';
                    nxs <= S2;

                else 

                    Z <= '0';
                    nxs <= S0;

                end if;

            when S2 =>
                
                if X = '1' then
                    
                    Z <= '0';
                    nxs <= S2;

                else 

                    Z <= '1';
                    nxs <= S0;

                end if;

        end case;

    end process;

end behave;