var f:text;
n:integer;
procedure nhap;
begin
assign(f,'docso.inp');reset(f);
readln(f,n);
close(f);
end;
procedure xuli;
var a,b,c,d:byte;
begin
assign(f,'docso.out');rewrite(f);
a:=n div 1000;
b:=(n div 100) mod 10;
c:=(n mod 100) div 10;
d:=n mod 10;
if a<>0 then
case a of
1:write(f,'mot nghin ');
2:write(f,'hai nghin ');
3:write(f,'ba nghin ');
4:write(f,'bon nghin ');
5:write(f,'nam nghin ');
6:write(f,'sau nghin ');
7:write(f,'bay nghin ');
8:write(f,'tam nghin ');
9:write(f,'chin nghin ');
end;
if (a<>0) and (b=0) then write(f,'khong tram ');
case b of
1:write(f,'mot tram ');
2:write(f,'hai tram ');
3:write(f,'ba tram ');
4:write(f,'bon tram ');
5:write(f,'nam tram ');
6:write(f,'sau tram ');
7:write(f,'bay tram ');
8:write(f,'tam tram ');
9:write(f,'chin tram ');
end;
if ((a<>0) or (b<>0)) and (c=0) and (d<>0) then
case d of
1:write(f,'linh ');
2:write(f,'linh ');
3:write(f,'linh ');
4:write(f,'linh ');
5:write(f,'linh ');
6:write(f,'linh ');
7:write(f,'linh ');
8:write(f,'linh ');
9:write(f,'linh ');
end
else if (c<>0) then
case c of
1:write(f,'muoi ');
2:write(f,'hai muoi ');
3:write(f,'ba muoi ');
4:write(f,'bon muoi ');
5:write(f,'nam muoi ');
6:write(f,'sau muoi ');
7:write(f,'bay muoi ');
8:write(f,'tam muoi ');
9:write(f,'chin muoi ');
end;
if d<>0 then
case d of
1:write(f,'mot');
2:write(f,'hai ');
3:write(f,'ba');
4:write(f,'bon');
5:write(f,'lam');
6:write(f,'sau');
7:write(f,'bay');
8:write(f,'tam');
9:write(f,'chin');
end;
close(f);
end;
begin
nhap;
xuli;
end.