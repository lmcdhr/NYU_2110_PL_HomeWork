with text_io;
use text_io;

procedure F2 is
  package int_io is new integer_io(integer);
  use int_io;

  task One is
    entry E;
  end One;

  task body One is
    X: integer:=6;
  begin
    loop
        accept E do
           put(X);
           new_line;
        end;
    end loop;
  end one;

begin
  for J in 90..200 loop
    One.E;
    put(J);
    new_line;
  end loop;
end F2;
