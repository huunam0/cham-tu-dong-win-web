Var     i,n,x,y,t,tg,val:integer;
        a:array[1..10000] of integer;
        d,c:array[1..10000] of integer;
        f,f1:text;
Begin
        Assign(f,'THUNGN.INP');
        reset(f);
        Assign(f1,'THUNGN.OUT');
        rewrite(f1);
        For i:=1 to 10000 do
          Begin
            a[i]:=i;
            d[i]:=i;
            c[i]:=i;
          End;
        While not eof(f) do
          Begin
            readln(f,x,y,t);
            If x>y then
              Begin
                tg:=x;
                x:=y;
                y:=tg;
              End;
            val:=a[y];
            If t=1 then
              Begin
                For i:=d[y] to c[y] do
                  If a[i]=val then a[i]:=a[x];
                If d[x]>d[y] then d[x]:=d[y];
                If c[x]<c[y] then c[x]:=c[y];
                d[y]:=1;
                c[y]:=0;
              End;
            If t=2 then
              Begin
                if a[x]=a[y] then writeln(f1,1)
                  else writeln(f1,0);
              End;
          End;
        Close(f);
        Close(f1);
End.


