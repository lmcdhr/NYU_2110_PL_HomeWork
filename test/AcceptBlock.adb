with text_io;
use text_io;

procedure AcceptBlock is
    task PrintWait is
        entry PrintStuff;
    end PrintWait;

    task body PrintWait is
    begin
        accept PrintStuff do
            for i in 1..10 loop
            put("in printWait");
            new_line;
            end loop;
        end PrintStuff;
    end PrintWait;

    task PrintNoWait is
        entry PrintStuff;
    end PrintNoWait;

    task body PrintNoWait is
    begin
        accept PrintStuff;
        -- now starting the body (not in an accept block)
        for i in 1..10 loop
            put("in printNoWait");
            new_line;
        end loop;
    end PrintNoWait;

begin
    put("Calling printwait"); new_line;
    put("--------------"); new_line;
    PrintWait.PrintStuff;
    for i in 1..5 loop
        put("---- in main ----");
        new_line;
    end loop;
    put("Now calling printNoWait"); new_line;
    put("--------------"); new_line;
    PrintNoWait.PrintStuff;
    for i in 1..5 loop
        put("---- in main ----");
        new_line;
    end loop;
end AcceptBlock;
