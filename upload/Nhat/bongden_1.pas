uses crt;
var s:ansistring;
q:array[1..20000] of ansistring;
f:Text;
Procedure Nhap;
begin
assign(f,'Bongden.inp');
reset(f);
readln(f,s);
close(f);
end;
Function Kt(x:integer;y:ansistring):boolean;
var i:integer;
begin
Kt:=true;
for i:= x-1 downto 1 do
if q[i]=y then Exit(false);
end;
Function Bat_Tat(x:byte;s:ansistring):ansistring;
var i:integer;
begin
if x=1 then
begin
for i:= 1 to length(s) do
if s[i]='1' then s[i]:='0' else s[i]:='1';
end
else if x=2 then
begin
for i:= 1 to length(s) do
if i mod 2=0 then
if s[i]='1' then s[i]:='0' else s[i]:='1';
end
else if x=3 then
begin
for i:= 1 to length(s) do
if i mod 2<>0 then
if s[i]='1' then s[i]:='0' else s[i]:='1';
end
else
begin
i:=0;
while 3*i+1<=length(s) do
begin
if s[i*3+1]='1' then s[i*3+1]:='0'
else s[i*3+1]:='1';
inc(i);
end;
end;
end;
Procedure Xuli;
var d,c:integer;
v:ansistring;
begin
assign(f,'Bongden.out');
rewrite(f);
d:=1;c:=1;
q[d]:=s;
repeat
v:=q[d];
if (Kt(
until d>c;