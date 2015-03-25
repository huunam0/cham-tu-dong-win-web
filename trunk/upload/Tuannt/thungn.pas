Var i,n,x,y,t,tg:integer;
a:array[1..10000] of integer;
f,f1:text;
Begin
Assign(f,'THUNGN.INP');
reset(f);
Assign(f1,'THUNGN.OUT');
rewrite(f1);
For i:=1 to 10000 do a[i]:=i;
While not eof(f) do
Begin
readln(f,x,y,t);
If x>y then
Begin
tg:=x;
x:=y;
y:=tg;
End;
If t=1 then
while (a[y]<>a[x]) and (y>0) do
Begin
a[y]:=a[x];
dec(y);
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


