Var a,rt : array[1..10000] of integer;
Procedure Xuli;
 Var f,ff: text;
     i,x,y,t,tt : integer;
     z : byte;
     kt : boolean;
 Begin
  For i:=1 to 1000 do rt[i]:=i;
  Assign(f,'THUNGN.INP'); Reset(f);
  Assign(ff,'THUNGN.OUT'); Rewrite(ff);
  While not eof(f) do
   Begin
    Readln(f,x,y,z);
    If z=1 then
     Begin
      if x>y then
       Begin
        t:=x;
        x:=y;
        y:=t;
       End;
      t:=x;
      while rt[t]<>t do t:=rt[t];
      rt[y]:=t;
     End
     Else
      Begin
       If x>y then
        Begin
         t:=x;
         x:=y;
         y:=t;
        End;
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
