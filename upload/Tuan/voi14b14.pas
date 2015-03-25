Program Bai2;
Type    tdo=record
        x,y:longint;
End;
        dthang=record
        sh,sc,h1,h2,h3:longint;
End;
Var     n,i,j,c1,c2,d,th1:longint;
        a,b:array[1..1000] of tdo;
        dt:array[1..1000000] of dthang;
        res:array[1..3] of integer;
        kt:boolean;
        f:text;
Procedure qsort(dau,cuoi:longint);
Var     i1,j1:longint;
        gt,tg:dthang;
Begin
        If dau>cuoi then exit;
        i1:=dau;
        j1:=cuoi;
        gt:=dt[random(cuoi-dau+1)+dau];
        repeat
          While (dt[i1].h1<gt.h1) or ((dt[i1].h1=gt.h1) and (dt[i1].h2<gt.h2))
            or ((dt[i1].h1=gt.h1) and (dt[i1].h2=gt.h2) and (dt[i1].h3<gt.h3)) do inc(i1);
          While (dt[j1].h1>gt.h1) or ((dt[j1].h1=gt.h1) and (dt[j1].h2>gt.h2))
            or ((dt[j1].h1=gt.h1) and (dt[j1].h2=gt.h2) and (dt[j1].h3>gt.h3)) do dec(j1);
          If i1<=j1 then
            Begin
              If i1<j1 then
                Begin
                  tg:=dt[i1];
                  dt[i1]:=dt[j1];
                  dt[j1]:=tg;
                End;
              inc(i1);
              dec(j1);
            End;
        until i1>j1;
        qsort(dau,j1);
        qsort(i1,cuoi);
End;
Function ucln(v1,v2:int64):int64;
Begin
        If v1 mod v2=0 then exit(v2) else exit(ucln(v2,v1 mod v2));
End;
Procedure ptdt(s1,s2:tdo;sh:longint;th,tc:integer);
Var     re:array[1..4] of int64;
        i1,j1:byte;
Begin
        re[1]:=s2.y-s1.y;
        re[2]:=s1.x-s2.x;
        re[3]:=-re[1]*s1.x-re[2]*s1.y;
        re[4]:=0;
        For i1:=1 to 2 do
          For j1:=i1+1 to 3 do
            If (re[i1]<>0) and (re[j1]<>0) then
              Begin
                If re[4]=0 then re[4]:=ucln(abs(re[i1]),abs(re[j1])) else
                  Begin
                    re[4]:=ucln(re[4],abs(re[i1]));
                    re[4]:=ucln(re[4],abs(re[j1]));
                  End;
              End;
        If re[4]<>0 then For i1:=1 to 3 do re[i1]:=re[i1] div re[4];
        If re[1]<0 then
          For i1:=1 to 3 do re[i1]:=-re[i1] else
            If (re[1]=0) and (re[2]<0) then
              Begin
                re[2]:=-re[2];
                re[3]:=-re[3];
              End;
        dt[sh].h1:=re[1];
        dt[sh].h2:=re[2];
        dt[sh].h3:=re[3];
        dt[sh].sh:=th;
        dt[sh].sc:=tc;
End;
Begin
        Assign(f,'VOI14B14.INP');
        reset(f);
        readln(f,n);
        For i:=1 to n do readln(f,a[i].x,a[i].y);
        For i:=1 to n do readln(f,b[i].x,b[i].y);
        Close(f);
        d:=0;
        For i:=1 to n do
          For j:=1 to n do
            Begin
              inc(d);
              ptdt(a[i],b[j],d,i,j+n);
            End;
        qsort(1,d);
        Assign(f,'VOI14B14.OUT');
        rewrite(f);
        kt:=false;
        For i:=1 to d-1 do
          If (dt[i].h1=dt[i+1].h1) and (dt[i].h2=dt[i+1].h2) and (dt[i].h3=dt[i+1].h3) then
            Begin
              If dt[i].sh=dt[i+1].sc then
                Begin
                  res[1]:=dt[i].sh;
                  res[2]:=dt[i].sc;
                  res[3]:=dt[i+1].sc;
                End
              else
                Begin
                  res[1]:=dt[i].sh;
                  res[2]:=dt[i+1].sh;
                  res[3]:=dt[i].sc;
                End;
              For c1:=1 to 2 do
                For c2:=c1+1 to 3 do
                  If res[c1]>res[c2] then
                    Begin
                      th1:=res[c1];
                      res[c1]:=res[c2];
                      res[c2]:=th1;
                    End;
              write(f,res[1],' ',res[2],' ',res[3]);
              kt:=true;
              break;
            End;
        If kt=false then write(f,-1);
        Close(f);
End.