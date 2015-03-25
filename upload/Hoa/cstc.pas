{Bai 2 - Dang Xuan Hoa}
uses crt;
var
        a,b : integer;
        f,f1: text;

procedure truytim;
var
        i:integer;
        p:longint;
        s:string;
begin
        p:=1;
        for i:=1 to b do p:=p*a;
        str(p,s);
        for i:=length(s)-1 to length(s) do
                write(f1,s[i]);
end;

BEGIN
        clrscr;
        assign(f,'CSTC.INP'); reset(f);
        read(f,a,b);
        close(f);
        assign(f1,'CSTC.OUT'); rewrite(f1);
        truytim;
        close(f1);
END.


