Program bai1;
Type    cay=record
        d:longint;
        t:byte;
End;
Var     sa,b,n,i:longint;
        a:array[1..300001] of cay;
        sl:array[0..300001,1..2] of longint;
        res,vt,vt1,vt2:longint;
        f:text;
Function tim(dau,cuoi,val:longint;ty:byte):longint;
Var     g:longint;
Begin
        repeat
          g:=(dau+cuoi) div 2;
          If (sl[g,ty]=val) and (sl[g-1,ty]<val) then exit(g);
          If sl[g,ty]<val then dau:=g+1 else cuoi:=g-1;
        Until dau>cuoi;
End;
Procedure qsort(dau,cuoi:longint);
Var     i1,j1,gt:longint;
        tg:cay;
Begin
        If dau>=cuoi then exit;
        i1:=dau;
        j1:=cuoi;
        gt:=a[random(cuoi-dau+1)+dau].d;
        repeat
          While a[i1].d<gt do inc(i1);
          While a[j1].d>gt do dec(j1);
          If i1<=j1 then
            Begin
              If i1<j1 then
                Begin
                  tg:=a[i1];
                  a[i1]:=a[j1];
                  a[j1]:=tg;
                End;
              inc(i1);
              dec(j1);
            End;
        until i1>j1;
        qsort(dau,j1);
        qsort(i1,cuoi);
End;
Begin
        Assign(f,'VOI14B12.INP');
        reset(f);
        readln(f,n,sa,b);
        For i:=1 to  n do readln(f,a[i].d,a[i].t);
        Close(f);
        qsort(1,n);
        sl[0,1]:=0;
        sl[0,2]:=0;
        vt:=0;
        vt1:=0;
        For i:=1 to n do
          Begin
            sl[i,1]:=sl[i-1,1]+ord(a[i].t=1);
            sl[i,2]:=sl[i-1,2]+ord(a[i].t=2);
            If (sl[i,1]=sa) and (vt=0) then vt:=i;
            If (sl[i,2]=b) and (vt1=0) then vt1:=i;
          End;
        If vt<vt1 then vt:=vt1;
        res:=high(longint);
        If (sl[n,1]>=sa) or (sl[n,2]>=b) then
          For i:=vt to n do
            Begin
              vt1:=tim(1,i,sl[i,1]-sa+1,1);
              vt2:=tim(1,i,sl[i,2]-b+1,2);
              If (sl[i,1]-sl[vt1,1]=sa-1) and (sl[i,2]-sl[vt2,2]=b-1) then
                Begin
                  If vt2<vt1 then vt1:=vt2;
                  If (a[i].d-a[vt1].d<res) then res:=a[i].d-a[vt1].d;
                End;
            End;
        Assign(f,'VOI14B12.OUT');
        rewrite(f);
        If res=high(longint) then write(f,-1) else write(f,res);
        Close(f);
End.