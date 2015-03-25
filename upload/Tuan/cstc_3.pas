Program Chusotancung;
uses crt;
Const fi='CSTC.INP';
fo='CSTC.OUT';
Var a,b:longint;
f:text;
s:array[0..200] of longint;
vt:array[0..99,1..2] of longint;
nv:array[0..99] of longint;
n,d:longint;
kq:longint;
Begin
Assign(f,fi);
reset(f);
readln(f,a,b);
fillchar(nv,sizeof(nv),0);
fillchar(s,sizeof(s),0);
Fillchar(vt,sizeof(vt),0);

a:=a mod 100;
n:=0;
s[0]:=1;
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
If (kq=0) and (a<>0) and (d=0) then kq:=s[b];
Assign(f,fo);
rewrite(f);
write(f,kq);
Close(f);
End.
