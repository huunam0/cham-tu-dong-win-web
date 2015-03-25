PROGRAM Docso;
uses crt;
Const fi='DOCSO.INP';
fo='DOCSO.OUT';
Var n,i:integer;
f1,f2:text;
s:array[1..4] of string;
Function docso(i:integer):string;
Begin
Case i of
0:docso:='khong';
1:docso:='mot';
2:docso:='hai';
3:docso:='ba';
4:docso:='bon';
5:docso:='nam';
6:docso:='sau';
7:docso:='bay';
8:docso:='tam';
9:docso:='chin';
End;
End;
Begin
Assign(f1,fi);
reset(f1);
Assign(f2,fo);
rewrite(f2);
For i:=1 to 4 do s[i]:='';
readln(f1,n);
If n=0 then s[4]:=docso(n);
If n div 1000<>0 then s[1]:=docso(n div 1000)+' ngan' else s[1]:='';
If n mod 1000<>0 then
Begin
if n>99 then s[2]:=docso((n mod 1000) div 100)+' tram' else s[2]:='';
If n mod 100<>0 then
Begin
If n>9 then
Begin
If ((n mod 100) div 10)>1 then s[3]:=docso((n mod 100) div 10)+' muoi'
else if ((n mod 100) div 10)=1 then s[3]:='muoi'
else If n>9 then s[3]:='linh' else s[3]:='';
End;
If n<10 then s[4]:=docso(n) else
Begin
If (n mod 10<>5) and (n mod 10<>0) then s[4]:=docso(n mod 10) else
If (n mod 10=5) and (n>9) and (((n mod 100) div 10)<>0) then s[4]:='lam'
else if n mod 10=5 then s[4]:='nam';
End;
End;
End;
If s[1]<>'' then s[1][1]:=upcase(s[1][1])
else If s[2]<>'' then s[2][1]:=upcase(s[2][1])
else If s[3]<>'' then s[3][1]:=upcase(s[3][1])
else If s[4]<>'' then s[4][1]:=upcase(s[4][1]);
For i:=1 to 4 do
If s[i]<>'' then write(f2,s[i],' ');
writeln(f2);
Close(f2);
Close(f1);
End.