with text_io;
use text_io;

procedure test2 is
    task First is
        entry Start;
        entry Enter;
    end First;

    task body First is
        val : integer := 5;
    begin
        accept Start;

        for i in 1..10000 loop
            val := val;
            put("Waiting");
        end loop;
        new_line;

        accept Enter;

        put("hi from enter");
        new_line;

    end First;
begin
    first.Start;
    first.Enter;
    put("--- done ---");
    new_line;
end test2;
