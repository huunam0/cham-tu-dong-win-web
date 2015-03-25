{Le Thanh Tin}
const f1='XAUDX.INP';
      f2='XAUDX.OUT';
var s:string[100];
    f:text;
    i,j,d,c,k,d1:byte;
 begin
  assign(f,f1); reset(f);
  read(f,s);
  close(f);  k:=length(s);
  assign(f,f2); rewrite(f);
  d:=1; c:=length(s);
  while D<=length(S) div 2 do
   begin
    d1:=0;
    if s[d]=s[c] then
     begin
      inc(d); dec(c);
     end else
    begin
    for i:=d+1 to length(s) do
     if s[i]=s[d] then inc(d1);
    if d1>0 then
     begin
      s:=s[c]+s;
      inc(d);
     end
     else
      begin
       s:=s+s[d];
       dec(c);
      end;
    end;
   end;
  write(f,length(S)-k);
  close(f);
 end.