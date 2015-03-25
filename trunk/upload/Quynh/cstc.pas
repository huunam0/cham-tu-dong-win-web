{Bai 2
Le Thi Nhi Quynh}
uses crt;
var f:text;
    a,b:longint;
    i:byte;
    s:longint;
begin
clrscr;
assign(f,'cstc.inp');reset(f);
readln(f,a,b);
 close(f);
  s:=1;
  for i:=1 to b do
     begin
        s:=s*a;
        s:=s mod 100;
     end;
assign(f,'cstc.out');rewrite(f);
if s<10 then write(f,'0',s) else write(f,s)  ;

close(f);
readln
end.