Program THUNGN;
Const   max=10000;
Type    kieu=^so;
        so=record
        v:integer;
        ne:kieu;
End;
Var     a:array[1..10000] of integer;
        d,c,cs:array[1..10000] of kieu;
        f1,f:text;
        k:kieu;
        x,y,z,i,tg:integer;
Begin
        Assign(f,'THUNGN.INP');
        reset(f);
        Assign(f1,'THUNGN.OUT');
        rewrite(f1);
        For i:=1 to max do
          Begin
            a[i]:=i;
            new(d[i]);
            new(c[i]);
            d[i]^.v:=i;
            d[i]^.ne:=nil;
            c[i]:=d[i];
          End;
        While not eof(f) do
          Begin
            readln(f,x,y,z);
            If (z=1) and (a[x]<>a[y]) then
              Begin
                If a[x]>a[y] then
                  Begin
                    tg:=x;
                    x:=y;
                    y:=tg;
                  End;
                k:=d[a[y]];
                While k<>nil do
                  Begin
                    c[a[x]]^.ne:=k;
                    a[k^.v]:=a[x];
                    c[a[x]]:=k;
                    k:=k^.ne;
                  End;
              End
            else If (z=2) and (a[x]=a[y]) then writeln(f1,1) else writeln(f1,0);
          End;
        Close(f);
        Close(f1);
End.