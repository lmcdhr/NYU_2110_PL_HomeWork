with text_io;
use text_io;

procedure Sync is

    procedure DoTheTasks is
        task Left;
        task body Left is
        begin
            put("Left"); new_line;
        end Left;
    begin
        put("Right"); new_line;
    end DoTheTasks;

begin
    DoTheTasks;
    put("Both tasks are done"); new_line;
end Sync;
