Var a:array[1..3,1..2] of real;
l:array[1..3] of real;
v1,v2,i:byte;
s,c:real;
f:Text;
Begin
Assign(f,'KTTGIAC.INP');
reset(f);
For i:=1 to 3 do readln(f,a[i,1],a[i,2]);
For i:=1 to 3 do
Begin
v1:=i+1;
v2:=v1-1;
If v1>3 then v1:=v1-3;
l[i]:=sqrt(sqr(a[v2,1]-a[v1,1])+sqr(a[v2,2]-a[v1,2]));
End;
c:=l[1]+l[2]+l[3];
s:=sqrt(c/2*(c/2-l[1])*(c/2-l[2])*(c/2-l[3]));
Assign(f,'KTTGIAC.OUT');
rewrite(f);
If s=0 then write(f,0) else write(f,c:0:3,' ',s:0:3);
Close(f);
End.