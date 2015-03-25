Program CATBANGSO;
Uses crt;
Const fi='BANGSO.INP';
fo='BANGSO.OUT';
Var n,k,i:integer;
a:array[1..1000] of integer;
t,t1:longint;
f:text;
Function kt(tong,vt:integer):boolean;
Var j,t2:integer;
Begin
t2:=0;
kt:=false;
For j:=vt to n do
Begin
t2:=t2+a[j];
If t2=tong then t2:=0;
If t2>tong then exit;
End;
kt:=true;
End;
Begin
Assign(f,'BANGSO.INP');
reset(f);
readln(f,n);
t:=0;
For i:=1 to n do
Begin
read(f,a[i]);
t:=t+a[i];
End;
k:=1;
t1:=0;
For i:=1 to n-1 do
If k=1 then
Begin
t1:=t1+a[i];
If (t mod t1=0) and (kt(t1,i+1)) then k:=t div t1;
End;
Assign(f,fo);
rewrite(f);
write(f,k,' ',t div k);
Close(f);
End.