{Le Thanh Tin}
const f1='CSTC.INP';
      f2='CSTC.OUT';
var a,b:integer;
    f:text;
procedure xuly;
var i,j,e,t:integer;
    s,st:string;
 begin
  t:=1;
  for i:=1 to b do
   begin
    t:=t*a;
    if t>=100 then
     begin
      str(t,s);  st:='';
      for j:=length(s) downto length(s)-1 do
       st:=s[j]+st;
      val(st,t,e);
     end;
   end;
  write(f,t);
 end;
 begin
  assign(f,f1);  reset(f);
  read(f,a,b);
  close(f);
  assign(f,f2); rewrite(f);
  xuly;
  close(f);
 end.