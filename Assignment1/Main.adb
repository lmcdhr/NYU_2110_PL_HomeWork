with Ada.Text_IO;
with Msort;
use Ada.Text_IO;
use MSort;

procedure Main is

    package I_IO is new Ada.Text_IO.Integer_IO (array_value);
    
    -- A: target array
    -- input: used for reading from txt file
    -- sum: the sum of array
    A : array_to_sort;
    input : array_value;
    sum : integer := 0;

    procedure ReadTXT is

        task Read is
        end Read;

        task body Read is
        begin
            for i in 1 .. LENGTH loop
                I_IO.get(input);
                A(i) := input;
            end loop;
        end;

    begin
        null;
    end ReadTXT;

    procedure SumandPrint is

        task Print is
            entry sum_gotten;
        end Print;

        task GetSum is
        end GetSum;

        task body GetSum is
        begin
            for i in 1 .. LENGTH loop
                sum := sum + integer(A(i));
            end loop;
            Print.sum_gotten;
        end;

        task body Print is
        begin
            accept sum_gotten;
            Put("The sum of array is: " & integer'image(sum));
            new_line;
            Put("the Array after sort is: ");
            for i in 1 .. LENGTH loop
                Put(integer'image(integer(A(i))));
            end loop;
            new_line;
        end;

    begin
        null;
    end SumandPrint;

begin
    ReadTXT;
    Sort(A, LENGTH);
    SumandPrint;
end Main;

