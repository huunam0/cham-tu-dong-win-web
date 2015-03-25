{bai 4
tran tan dat}
var s,s1,s2:string;
    a:array[1..100] of byte;
    n,i,j,max1,max2:byte;
    f:text;
procedure nhap;
begin
assign(f,'XAUDX.INP');
reset(f);
read(f,s);
close(f);
end;
procedure xuli;
begin
n:=length(s);
j:=2;
while j<=n do
 begin
  s1:='';s2:='';
  for i:=1 to j do s1:=s1+s[i];
  for i:=j downto 1 do s2:=s2+s[i];
  if s1=s2 then max1:=j;
  inc(j);
 end;
j:=n;
while j>=1 do
 begin
   s1:='';s2:='';
  for i:=j to n do s1:=s1+s[i];
  for i:=n downto j do s2:=s2+s[i];
  if s1=s2 then max2:=length(s1);
  dec(j);
 end;
end;
procedure xuat;
begin
assign(f,'XAUDX.OUT');rewrite(f);
 if max1>max2 then write(f,n-max1) else write(f,n-max2);
close(f);
end;
begin
nhap;
xuli;
xuat;
end.