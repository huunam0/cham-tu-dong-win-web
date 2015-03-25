{bai1
Tran Tan Dat}
var n,m,i:integer;
    a:array[1..5] of integer;
    b:array[0..9] of string;
    f:text;
begin
assign(f,'DOCSO.INP');
reset(f);
readln(f,n);
close(f);
m:=0;
b[0]:='khong';b[1]:='mot';b[2]:='hai';
b[3]:='ba';b[4]:='bon';b[5]:='nam';b[6]:='sau';
b[7]:='bay';b[8]:='tam';b[9]:='chin';
assign(f,'DOCSO.OUT');rewrite(f);
while n<>0 do
 begin
  m:=m+1;
  a[m]:=n mod 10;
  n:=n div 10;
 end;
if m=4 then
 begin
   if a[1]=0 then
    begin
     if (a[2]=0)and(a[3]=0) then write(f,b[a[4]],' nghin ')
      else
       if(a[2]=0) then write(f,b[a[4]],' nghin ',b[a[3]],' tram ')
       else write(f,b[a[4]],' nghin ',b[a[3]],' tram ',b[a[2]], ' muoi');
    if (a[2]=0)and (a[1]<>0) then write(f,b[a[4]],' nghin ',b[a[3]],' tram linh ',b[a[1]]);
    end
    else if a[2]=1 then write(f,b[a[4]],' nghin ',b[a[3]],' tram muoi ',b[a[1]])
    else  write(f,b[a[4]],' nghin ',b[a[3]],' tram ',b[a[2]],' muoi ',b[a[1]]);
    end;
if m=3 then
 begin
  if (a[1]=0) and(a[2]=0) then write(f,b[a[3]],' tram')
   else if a[1]=0 then  write(f,b[a[3]],' tram ',b[a[2]], 'muoi')
   else  if a[2]=1 then write(f,b[a[3]],' tram muoi ',b[a[1]])
    else  write(f,b[a[3]],' tram ',b[a[2]],' muoi ',b[a[1]]);
  end;
if m=2 then
 if a[1]=0 then
  begin
   if a[2]=1 then write(f,'muoi')
    else write(f,b[a[2]],' muoi');
   end
    else if a[2]=1 then write(f,'muoi ',b[a[1]])
  else write(f,b[a[2]],' muoi ',b[a[1]]);
if m=1 then write(f,b[a[1]]);
close(f);
end.