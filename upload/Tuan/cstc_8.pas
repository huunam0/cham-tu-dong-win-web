Program Chusotancung;
uses crt;
Const fi='CSTC.INP';
fo='CSTC.OUT';
Var a,b:longint;
f:text;
s:array[0..200] of longint;
vt:array[0..99,1..2] of longint;
nv:array[0..99] of longint;
n,d,i:longint;
kq:longint;
kt:boolean;
kt1:int64;
Begin
Assign(f,fi);
reset(f);
readln(f,a,b);
fillchar(nv,sizeof(nv),0);
fillchar(s,sizeof(s),0);
Fillchar(vt,sizeof(vt),0);
If a<>0 then s[0]:=1;
kt1:=1;
kt:=false;
If a>1 then
For i:=1 to b do
Begin
kt1:=kt1*a;
If kt1>10 then
Begin
kt:=true;
break;
End;
End;
a:=a mod 100;
n:=0;
kq:=0;
nv[1]:=1;
vt[1,1]:=0;
d:=0;
repeat
inc(n);
s[n]:=(s[n-1]*a) mod 100;
If nv[s[n]]<2 then
Begin
inc(nv[s[n]]);
vt[s[n],nv[s[n]]]:=n;
End;
If nv[s[n]]>=2 then
Begin
kq:=s[vt[s[n],1]+((b-vt[s[n],1]) mod (vt[s[n],2]-vt[s[n],1]))];
d:=1;
break;
End;
Until false or (b=n);
If n=b then kq:=s[b];
Assign(f,fo);
rewrite(f);
If (kq<10) and (kt) then write(f,0);
write(f,kq);
Close(f);
End.