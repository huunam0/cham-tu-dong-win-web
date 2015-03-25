{Bai 1
Le Thi Nhi Quynh.
uses crt;}
var n,n1:integer;
    i:byte;
    f:text;
    a:array[1..4] of byte;
    b:array[0..9] of string;
begin
assign(f,'docso.inp');reset(f);
readln(f,n);
n1:=n;
i:=0;
while n1<>0 do
  begin
     inc(i);
     a[i]:=n1 mod 10;
     n1:=n1 div 10;
  end;

b[0]:='khong ';b[1]:='mot ';b[2]:='hai ';b[3]:='ba ';b[4]:='bon ';b[5]:='nam ';
b[6]:='sau ';b[7]:='bay ';b[8]:='tam ';b[9]:='chin ';
close(f);

assign(f,'docso.out');rewrite(f);

if i=4 then
        begin
     begin

           b[5]:='lam';
         if (a[1]=0) and (a[2]=0) and (a[3]=0) then write(f,b[a[4]],'nghin') else
     if (a[1]=0) and(a[2]=0) then write(f,b[a[4]],'nghin ',b[a[3]],'tram ') else
     if(a[2]=0) then
          begin
             b[5]:='nam';
             write(f,b[a[4]],'nghin ',b[a[3]],'tram linh ',b[a[1]]) end else
     if (a[2]=1) then write(f,b[a[4]],'nghin ',b[a[3]],'tram muoi ',b[a[1]]) else
     if a[1]=0 then write(f,b[a[4]],'nghin ',b[a[3]],'tram ',b[a[2]],' muoi') else


      write(f,b[a[4]],'nghin ',b[a[3]],'tram ',b[a[2]],'muoi ',b[a[1]]); end  end  else
if i=3 then
      begin
        b[5]:='lam';
      if (a[1]=0) and(a[2]=0) then write(f,b[a[3]],'tram ') else
     if a[1]=0 then

        write(f,b[a[3]],'tram ',b[a[2]],'muoi ')   else
     if(a[2]=0) then
       begin
          b[5]:='nam';
        write(f,b[a[3]],'tram linh ',b[a[1]]) end else
     write(f,b[a[3]],'tram ',b[a[2]],'muoi',b[a[1]]) end else
     if a[2]=1 then write(f,b[a[3]],'tram muoi',b[a[1]])  else
if i=2 then
  begin          b[5]:='lam';

  if a[1]=0 then write(f,b[a[2]],'muoi') else
   if a[2]=1 then write(f,'muoi ',b[a[1]]) else
   write(f,b[a[2]],'muoi ',b[a[1]]) end else
   if i=1 then write(f,b[a[1]]);
                       close(f);
readln
end .












