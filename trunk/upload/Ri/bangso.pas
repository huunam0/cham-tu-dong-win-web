{Ngo Van Ri lop 10a1}
uses crt;
const max=1000;
var a:array[1..max] of integer;
        b:array[1..max,1..max] of integer;
    f,f1:text;
    n,i,tong:integer;

procedure docfile;
begin
        assign(f, 'BANGSO.INP');
        reset(f);
        assign(f1, 'BANGSO.OUT');
        rewrite(f1);
        readln(f, n);
        for i:=1 to n do read(f, a[i]);
        close(f);
end;

procedure xuli;
var i,j:integer;
begin
        fillchar(b, sizeof(b),0);
        for i:=1 to n do b[i,1]:=a[i];
        for j:=1 to n do
                for i:=2 to n do b[i,j]:=b[i-1,j]+a[i];
end;

procedure xuli2;
var a1,a2,t,t1,j,tam,max:integer;
begin
        max:=1;
        for i:=1 to n do
                for j:=1 to n do
                        begin
                        a1:=b[i,j];
                        tam:=1;
                        for t:=i to n do
                                for t1:=j to n do
                                        if b[t,t1]=a1 then
                                                begin
                                                inc(tam);
                                                if tam>max then
                                                        begin
                                                        max:=3;
                                                        a2:=10;
                                                        end;
                                                end;

                        end;
                       write(f1,max, ' ',a2);
end;

begin
        clrscr;
        docfile;
        xuli;
        xuli2;
        close(f1);
        readln
end.


