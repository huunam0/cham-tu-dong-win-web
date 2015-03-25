{Ngo Van Ri lop 10a1}
uses crt;
var a,b,t:longint;
    f,f1:text;

procedure docfile;
begin
        assign(f, 'CSTC.INP');
        reset(f);
        assign(f1, 'CSTC.OUT');
        rewrite(f1);
        read(f, a, b);
        close(f);
end;

procedure xuli;
var a2,a1,b1:longint;
    i:integer;
begin
        a1:=a mod 100;
        a2:=a1;
        for i:=2 to b do
                begin
                        a2:=a2*a1;
                        a2:=a2 mod 100;
                end;
         t:=a2;
         if t<10 then write(f1, '0');
end;

begin
        clrscr;
        docfile;
        xuli;
        writeln(f1,t);
        close(f1);
        readln
end.
