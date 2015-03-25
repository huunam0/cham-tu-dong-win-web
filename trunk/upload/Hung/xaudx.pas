var s:string;
f:text;
procedure nhap;
begin
assign(f,'xaudx.inp');reset(f);
readln(f,s);
close(f);
end;
function dx(s:string):boolean;
var i,j:integer;
k:boolean;
begin
if length(s)<=1 then dx:=false
else
begin
k:=true;
for i:=1 to length(s) div 2 do
if s[i]<>s[length(s)-i+1] then
begin
k:=false;
break;
end;
dx:=k;
end;
end;
procedure xuli;
var i,j:integer;
st:string;
begin
for i:=1 to length(s)-1 do
for j:=length(s) downto i do
begin
st:=copy(s,i,j-i+1);
if dx(st) then
delete(s,i,j-i+1);
end;
assign(f,'xaudx.out');rewrite(f);
write(f,length(s));
close(f);
end;
begin
nhap;
xuli;
end.