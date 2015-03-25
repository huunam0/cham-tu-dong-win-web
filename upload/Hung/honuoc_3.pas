var a:array[0..100,0..100] of integer;
h:array[0..100,0..100] of boolean;
m,n,k,d,g:integer;
f:text;
procedure nhap;
var i,j:integer;
begin
assign(f,'nhap.inp');reset(f);
readln(f,m,n,k);
for i:=1 to m do
begin
for j:=1 to n do
read(f,a[i,j]);
readln(f);
end;
close(f);
end;
procedure loang(i,j:integer);
begin
if (a[i+1,j]<=a[m,n]) and not h[i+1,j] then
begin
inc(d);
h[i+1,j]:=true;
loang(i+1,j);
end;
if (a[i,j+1]<=a[m,n]) and not h[i,j+1] then
begin
inc(d);
h[i,j+1]:=true;
loang(i,j+1);
end;
if (a[i-1,j]<=a[m,n]) and not h[i-1,j] then
begin
inc(d);
h[i-1,j]:=true;
loang(i-1,j);
end;
if (a[i,j-1]<=a[m,n]) and not h[i,j-1] then
begin
inc(d);
h[i,j-1]:=true;
loang(i,j-1);
end;
end;
procedure giam;
var j:integer;
begin
for j:=1 to n do
dec(a[m,j]);
end;
procedure xuli;
var i,j:integer;
begin
d:=0;g:=a[m,n];
while d<k do
begin
giam;
fillchar(h,sizeof(h),false);
for i:=1 to m do begin h[i,0]:=true;h[i,n+1]:=true; end;
for j:=1 to n do begin h[0,j]:=true;h[m+1,j]:=true;h[m,j]:=true; end;
for j:=1 to n do loang(m,j);
end;
assign(f,'xuat.out');rewrite(f);
write(f,g-a[m,n],' ',d);
close(f);
end;
begin
nhap;
xuli;
end.