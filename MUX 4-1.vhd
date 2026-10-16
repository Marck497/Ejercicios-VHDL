library IEEE;
use IEEE.std_logic_1164.all;

entity mux4_1 is
port(

    A, B, C, D : in std_logic;
    SEL        : in std_logic_vector(1 DOWNTO 0);
    Y          : out std_logic

    );
end mux4_1;

architecture Behavioral of mux4_1 is
begin

    process(SEL, A, B, C, D) begin

        case SEL is
        
            when "00" =>
                Y <= A;
            when "01" =>
                Y <= B;
            when "10" =>
                Y <= C;
            when "11" =>
                Y <= D;
            when others =>
                Y <= '0';

        end case;
    
    end process;

end Behavioral;