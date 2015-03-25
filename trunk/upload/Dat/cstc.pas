{bai 2
tran tan dat}
var a,b,s,i:longint;
    f:text;
begin
assign(f,'CSTC.INP');
reset(f);
read(f,a,b);
close(f);
s:=1;
assign(f,'CSTC.OUT');rewrite(f);
for i:=1 to b do
  begin
    s:=s*a;
    s:=s mod 100;
  end;
if s=0 then write(f,'00')
 else if s<10 then
   write(f,'0',s)
  else write(f,s);
close(f);
end.

