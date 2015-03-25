var f:text;
a,b:longint;
procedure nhap;
begin
assign(f,'cstc.inp');reset(f);
readln(f,a,b);
close(f);
end;
procedure xuli;
var i,s:longint;
begin
if (a mod 10=0) and (b>1) then s:=0
else if (a mod 10=0) then s:=a
else
begin
s:=a mod 100;
for i:=2 to b do
s:=(s*a) mod 100;
end;
assign(f,'cstc.out');rewrite(f);
write(f,s);
close(f);
end;
begin
nhap;
xuli;
end.