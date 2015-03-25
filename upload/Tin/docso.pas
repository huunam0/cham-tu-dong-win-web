{ Le Thanh Tin}
const f1='DOCSO.INP';
      f2='DOCSO.OUT';
var n: word;
    st:string;
procedure gan(ch:char);
 begin
  case ch of
   '1': st:=st+ ' mot';
   '2': st:=st+ ' hai';
   '3': st:=st+ ' ba';
   '4': st:=st+ ' bon';
   '5': st:=st+ ' nam';
   '6': st:=st+ ' sau';
   '7': st:=st+ ' bay';
   '8': st:=st+ ' tam';
   '9': st:=st+ ' chin';
  end;
 end;
procedure xuly;
var f:text;
    s:string[4];
    i:word;
 begin
  assign(f,f1); reset(f);
  readln(f,n);
  close(f);
  assign(f,f2); rewrite(F);
  str(n,s);   st:=''; i:=1;
  while i<=length(s) do
   begin
    gan(s[i]);
    if (i=3)and(s[i]<>'0') then
     begin
      st:=st+ ' muoi';
      if s[4]='5' then st:=st+ ' lam';
      break;
     end
     else if (i=3)and(s[i]='0') then st:=st+ ' linh';
    if (i=2)and(s[i]<>'0') then st:=st+ ' tram'
     else if (i=2)and(s[i]='0') then st:= st+ ' khong tram';
    if i=1 then st:=st+ ' nghin';
    inc(i);
   end;
  write(f,st);
  close(f);
 end;
 begin
  xuly;
  end.