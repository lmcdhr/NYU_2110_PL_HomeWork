with text_io;
use text_io;

procedure ProducerConsumerFixed is

    package int_io is new integer_io(integer);
    use int_io;

    task Customer is
        entry Eat_Integer(Number : INTEGER);
        entry No_More_Food;
    end Customer;

    task body Customer is
    begin
        loop
            select
                accept Eat_Integer(Number : INTEGER) do
                    Put("OM NOM NOM This is the best food ever ");
                    Put(Number);
                    New_Line;
                end Eat_Integer;
            or
                accept No_More_Food;
                exit;
            end select;
        end loop;
        Put("Done eating, so full!");
    end Customer;

    task Chef is
        entry Start_Cooking;
     end Chef;

     task body Chef is
     begin
         accept Start_Cooking;

         for Index in 1..5 loop
             Customer.Eat_Integer(Index);
             Put("Cooked the best food ever ");
             Put(Index);
             New_Line;
         end loop;

         Put("No more food for you ");
         New_Line;
         Customer.No_More_Food;
     end Chef;

 begin
     Put("Starting the chef cooking");
     New_Line;
     Chef.Start_Cooking;
     Put("Finished in main");
     New_Line;
end ProducerConsumerFixed;
