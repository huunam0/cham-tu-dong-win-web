var f:text;
n,k:integer;
a,b,d,t1:array[1..1000] of integer;
procedure nhap;
var i:integer;
begin
assign(f,'bangso.inp');reset(f);
readln(f,n);
for i:=1 to n do
read(f,a[i]);
fillchar(b,sizeof(b),0);
b[n]:=1;k:=0;
close(f);
end;
function kt:boolean;
var i,j,t,vt,s,dem:integer;
h:boolean;
begin
h:=false;
s:=0;vt:=1;dem:=0;
for i:=1 to n do
if b[i]=1 then
begin
inc(dem);
t:=0;h:=true;
for j:=vt to i do
t:=t+a[j];
if s=0 then s:=t;
if t=s then vt:=i+1
else begin h:=false;break; end;
end;
if h=true then begin inc(k);t1[k]:=s; d[k]:=dem; end;
kt:=h;
end;
procedure tim(i:integer);
var j,z,dem,k:byte;
begin
if i=n then
kt
else
for j:=1 downto 0 do
begin
b[i]:=j;
tim(i+1);
end;
end;
procedure xuli;
var t,i,j,max:integer;
begin
assign(f,'bangso.out');rewrite(f);
max:=0;
for i:=1 to k do if max<d[i] then max:=d[i];
write(f,max,' ');
for i:=1 to k do if max=d[i] then
begin
write(f,t1[i]);
break;
end;
close(f);
end;
begin
nhap;
tim(1);
xuli;
end.