{bai 4-Nguyen Huu Kim}
const f1='xaudx.inp';
        f2='xaudx.out';
var s:string;
        f:text;
procedure nhap;
begin
 assign(f,f1); reset(f);
  read(f,s);
 close(f);
end;
procedure xuly;
var st:string;
        i,j:integer;
begin
 for i:=1 to length(s) do
   for j:=length(s) downto i do
    if ((s[i]=s[j])and(s[i+1]=s[j+1])) then
     delete(s,i,4);
    if (s[i]=s[j])and(j=i+1) then delete(s,i,3);
 write(f,length(s));
end;
begin
 nhap;
 assign(f,f2); rewrite(F);
  xuly;
 close(F);
end.
