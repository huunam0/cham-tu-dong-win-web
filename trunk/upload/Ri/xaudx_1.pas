{Ngo Van Ri lop 10a1}
uses crt;
var s:string;
    f,f1:text;
    b:array[0..100,0..100] of integer;
procedure docfile;
begin
        assign(f, 'XAUDX.INP');
        reset(f);
        assign(f1, 'XAUDX.OUT');
        rewrite(f1);
        readln(f, s);
        close(f);
end;

procedure xuli;
var i,k,j:integer;
begin
        fillchar(b,sizeof(b),0);
        for k:=2 to length(s) do
                for i:=1 to length(s)-k+1 do
                        begin
                             j:=i+k-1;
                             if s[i]=s[j] then b[i,j]:=b[i+1,j-1]
                                else if b[i+1,j]>b[i,j-1] then b[i,j]:=b[i,j-1]+1
                                        else b[i,j]:=b[i+1,j]+1;
                        end;
end;

begin
        clrscr;
        docfile;
        xuli;
        write(f1,b[1,length(s)]);
        close(f1);
        readln
end.


