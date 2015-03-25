{Le Thanh Tin}
const f1='BANGSO.INP';
      f2='BANGSO.OUT';
var a:array[1..100] of integer;
    n,t1,t2,d:integer;
    f:text;
procedure doc;
var i:integer;
 begin
  assign(f,f1);  reset(f);
  readln(f,n);
  for i:=1 to n do
   read(f,a[i]);
  close(F);
 end;
function tinh(x:integer):boolean;
var i,j:integer;
 begin
  t1:=0; t2:=0 ; d:=1;
  for i:=1 to x do t1:=t1+a[i];
  for i:=x+1 to n do
   begin
    t2:=t2+a[i];
    if t2=t1 then
     begin
      tinh:=true;
      t2:=0;
      inc(d);
     end    else tinh:=false;
   end;
 end;
procedure xuly;
var i,j:integer;
 begin
  assign(f,f2); rewrite(f);
  for i:=1 to n do
   if tinh(i) then
    begin
     write(f,d,#32);
     write(f,t1);
     break;
    end;
  close(f);
 end;
 begin
  doc; xuly;
 end.