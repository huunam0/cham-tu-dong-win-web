Var era : array[1..1000] of integer;
    av : array[1..2000] of boolean;
    pt : array[1..10] of integer;
    n,count : integer;
Procedure Input;
 Var f : text;
 Begin
  Assign(f,'TIMSOBSU.INP'); Reset(f);
  Readln(f,n);
  Close(f);
 End;
Procedure Eratosthenes;
 Var i,j : integer;
 Begin
  count:=0;
  Fillchar(av,sizeof(av),false);
  For i:=2 to 1000 do
   Begin
    If not av[i] then
     Begin
      Inc(count); era[count]:=i;
      j:=i;
      av[j]:=true;
      While j<1000 do
       Begin
        j:=j+i;
        av[j]:=true;
       End;
     End;
   End;
 End;
Function Sq(j,k : byte): qword;
 Var s : qword;
     i : byte;
 Begin
  s:=j;
  For i:=2 to k do
   s:=s*k;
  Sq:=s;
 End;
Procedure Xuli;
 Var i,j : integer;
     x : byte;
     res,rcheck : qword;
     f : text;
 Begin
  Assign(f,'TIMSOBSU.OUT'); Rewrite(f);
  {rcheck:=10000000000000000000;} x:=0;
  If n=1 then writeln(f,1)
   Else
    Begin
     i:=1;
     Repeat
      While (n mod era[i]<>0) do inc(i);
      While n mod era[i]=0 do
       Begin
        inc(x);
        n:=n div era[i];
        pt[x]:=era[i];
       End;
     Until n=1;
     Res:=1;
     For i:=x downto 1 do
      res:=res*sq(era[i],pt[i]-1);
     writeln(f,res);
    End;
  Close(f);
 End;
BEGIN
 Input;
 Eratosthenes;
 Xuli;
END.



