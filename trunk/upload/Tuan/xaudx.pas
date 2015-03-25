Program XAUDX;
uses crt;
Const fi='XAUDX.INP';
fo='XAUDX.OUT';
Var f1:text;
s,s1:string;
f:array[0..101,0..101] of byte;
i,j:byte;
Begin
Assign(f1,fi);
reset(f1);
readln(f1,s);
Close(f1);
s1:='';
For i:=length(s) downto 1 do s1:=s1+s[i];
Fillchar(f,sizeof(f),0);
For i:=1 to length(s) do
Begin
f[1,i]:=f[1,i-1];
f[i,1]:=f[i-1,1];
If s[1]=s1[i] then f[1,i]:=1;
If s[i]=s1[1] then f[i,1]:=1;
End;
For i:=2 to length(s) do
For j:=2 to length(s) do
If s[i]=s1[j] then f[i,j]:=f[i-1,j-1]+1
else if f[i-1,j]>f[i,j-1] then f[i,j]:=f[i-1,j]
else f[i,j]:=f[i,j-1];
Assign(f1,fo);
rewrite(f1);
write(f1,length(s)-f[length(s),length(s)]);
Close(f1);
End.

