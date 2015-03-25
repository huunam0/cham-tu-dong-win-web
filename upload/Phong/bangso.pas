{ho van phong}
program bai3;
uses crt;
var f:text;
    n:word;
    a:array[1..1000] of longint;
procedure doc;
var i:word;
begin
        assign(f,'bangso.inp');
        reset(f);
        readln(f,n);
        for i:=1 to n do
          read(f,a[i]);
        close(f);
end;
procedure xuli;
var d,s,max,i,j,st,dem:longint;
begin
        max:=a[1];
        d:=1;
        if n>1 then
        for i:=1 to n do
          begin
             s:=0;
             dem:=2;
             for j:=1 to i do
                s:=s+a[j];
                st:=0;
             for j:=i+1 to n do
                if st=s then
                   begin
                   st:=0;
                   dem:=dem+1;
                   end
                else if st<s then st:=st+a[j]
                else if st>s then
                        begin
                                dem:=0;
                                break;
                        end;
             if dem>d then
                begin
                        d:=dem;
                        max:=s;
                end;
          end;
     assign(f,'bangso.out');
     rewrite(f);
     writeln(f,d,' ',max);
     close(f);
end;
begin
        doc;
        xuli;
end.
