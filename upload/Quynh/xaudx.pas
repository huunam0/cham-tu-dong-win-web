{Bai 4
Le Thi Nhi Quynh}
uses crt;
var f:text;
    s,s1,s2:string;
    a:array[1..100] of byte;
    n,i,j,max1,max2:integer;
procedure Nhap;
begin
assign(f,'xaudx.inp');reset(f);
readln(f,s);
close(f);
end;
procedure Xuli;
begin
n:=length(s);
j:=1;
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
procedure Xuat;
begin
  assign(f,'Xaudx.out');rewrite(f);
  if max1>max2 then
      write(f,n-max1) else write(f,n-max2);
close(f);
end;
begin
Nhap;
Xuli;
Xuat;
readln
end.

