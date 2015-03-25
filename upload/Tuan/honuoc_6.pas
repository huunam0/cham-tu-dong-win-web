Program Bai3;
Var     f:text;
        t,i,j,n,m,k,h:integer;
        a:array[0..101,0..101] of integer;
        fr:array[0..101,0..101] of boolean;
Procedure loang(ha,co:integer);
Begin
        fr[ha,co]:=false;
        inc(t);
        If (ha>1) and (a[ha-1,co]<=h) and fr[ha-1,co] then loang(ha-1,co);
        If (ha<m-1) and (a[ha+1,co]<=h) and fr[ha+1,co] then loang(ha+1,co);
        If (co>1) and (a[ha,co-1]<=h) and fr[ha,co-1] then loang(ha,co-1);
        If (co<n) and (a[ha,co+1]<=h) and fr[ha,co+1] then loang(ha,co+1);
End;
Begin
        Assign(f,'HONUOC.INP');
        reset(f);
        readln(f,m,n,k);
        For i:=1 to m do
          Begin
            For j:=1 to n do read(f,a[i,j]);
            readln(f);
          End;
        Close(f);
        h:=a[m,1];
        t:=0;
        While (t<k) and (h>=0) do
          Begin
            dec(h);
            fillchar(fr,sizeof(fr),true);
            For j:=1 to n do
              If (a[m-1,j]<=h) and fr[m-1,j] then loang(m-1,j);
          End;
        Assign(f,'HONUOC.OUT');
        rewrite(f);
        If t>=k then write(f,a[m,1]-h,' ',t) else write(f,-1);
        Close(f);
End.
