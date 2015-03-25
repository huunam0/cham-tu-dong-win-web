uses crt;
var
        s:string;
        p:string;
        f,f1:text;

procedure daoxau;
var
        i:integer;
begin
        p:='';
        for i:=length(s) downto 1 do p:=p+s[i];
end;

procedure them;
var
        i,j,d:integer;
begin
        daoxau;
        i:=length(s);
        j:=length(p);
        d:=0;
        while (i>=1)and(j>=1) do
                begin
                        if s[i]=p[j] then
                                begin
                                        dec(i);
                                        dec(j);
                                end
                        else
                                begin
                                        inc(d);
                                        dec(i);
                                end;
                end;
        write(f1,d);
end;

BEGIN
        clrscr;
        assign(f,'XAUDX.INP'); reset(f);
        read(f,s);
        close(f);
        assign(f1,'XAUDX.OUT'); rewrite(f1);
        them;
        close(f1);
END.

