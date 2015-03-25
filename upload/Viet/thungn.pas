Var a,rt : array[1..10000] of integer;
    kt : array[1..10000] of boolean;
Procedure Xuli;
 Var f,ff: text;
     i,x,y,t,t1,tt,vc : integer;
     z : byte;
 Begin
  Fillchar(kt,sizeof(kt),false);
  For i:=1 to 10000 do rt[i]:=i;
  Assign(f,'THUNGN.INP'); Reset(f);
  Assign(ff,'THUNGN.OUT'); Rewrite(ff);
  vc:=0;
  While not eof(f) do
   Begin
    Readln(f,x,y,z);
    If (vc<x) and (vc<y) then
     If x<y then vc:=y else vc:=x;
    If z=1 then
     Begin
      t:=x;
      while rt[t]<>t do t:=rt[t];
      t1:=y;
      while rt[t1]<>t1 do t1:=rt[t1];
      If kt[x] and not kt[y] then
       Begin
        rt[y]:=rt[t];
        For tt:=1 to vc do If rt[tt]=y then rt[tt]:=rt[t];
       End
       Else
        If kt[y] and not kt[x] then
         Begin
          rt[x]:=rt[t1];
          For tt:=1 to vc do If rt[tt]=x then rt[tt]:=rt[t1];
         End
         Else
          If rt[t]<rt[t1] then
           Begin
            rt[y]:=rt[t];
            For tt:=1 to vc do If rt[tt]=y then rt[tt]:=rt[t];
           End
           Else
            Begin
             rt[x]:=rt[t1];
             For tt:=1 to vc do If rt[tt]=x then rt[tt]:=rt[t1];
            End;
      kt[x]:=true;
      kt[y]:=true;
     End
     Else
      Begin
       t:=y;
       while rt[t]<>t do t:=rt[t];
       tt:=x;
       while rt[tt]<>tt do tt:=rt[tt];
       If tt=t then writeln(ff,'1')
       else writeln(ff,'0');
      End;
   End;
  Close(f);
  Close(ff);
 End;
BEGIN
 Xuli;
END.
