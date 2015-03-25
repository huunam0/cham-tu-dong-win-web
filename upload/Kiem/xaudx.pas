{Bai 4 - Nguyen Van Kiem}
uses crt;
var f:text;
    x:string[100];
    kq:byte;
procedure doc_dl;
 begin
  assign(f,'xaudx.inp');
  reset(f);
  readln(f,x);
  close(f);
 end;
function dx(x:string):boolean;
 var n:byte;
 begin
  dx:=false;
  n:=length(x);
  for i:=1 to (n div 2) do
   if x[i]<>x[n+1-i] then exit;
  dx:=true;
 end;
procedure xuly;
 begin
  if dx(x) then kq:=0;
