uses crt;
type tm=record
              vt:longint;
                t:byte;
                end;
var a:array[1..300000] of tm;
    n,dd,cc,i:integer;
procedure doctep;
var f:text; i:integer;
begin
  assign(f,'VOI14B12.inp');
  reset(f);
  readln(f,n,dd,cc);
  for i:=1 to n do
    begin
      readln(f,a[i].vt,a[i].t);
    end;
  close(f);
end;
procedure sxn(d,c:integer);
var i,j,x:integer;    tg:tm;
begin
  i:=d;
  j:=c;
  x:=a[(d+c) div 2].vt;
  repeat
    while a[i].vt<x do inc(i);
    while a[j].vt>x do dec(j);
    if i<=j then
      begin
        tg:=a[i];
        a[i]:=a[j];
        a[j]:=tg;
        inc(i);
        dec(j);
      end;
  until i>j;
  if i<c then sxn(i,c);
  if d<j then sxn(d,j);
end;
function ktra(vt1,vt2:integer; var kc:longint):boolean;
var tung,truc,i:integer;
begin
  tung:=0; truc:=0;
  for i:=vt1 to vt2 do
    if a[i].t=2 then inc(truc)
    else inc(tung);
  if (tung>=dd) and (truc>=cc) then
    begin
      ktra:=true;
      kc:=a[vt2].vt-a[vt1].vt;
    end
  else ktra:=false;
end;
procedure xuli;
var c,dem:integer; kt:boolean; kc,max:longint;  f2:text;
begin
  c:=dd+cc; max:=1000000000;    dem:=c;    kc:=0;
  for i:=1 to n-(c)+1 do
    begin
      kt:=ktra(i,dem,kc);
      inc(dem);
      if (kt=true) and (kc<max) then
        max:=kc;
    end;
  assign(f2,'VOI14B12.OUT');
  rewrite(f2);
  if max=0 then writeln(f2,-1)
  else
  writeln(f2,kc);
  close(f2);
end;


BEGIN
  doctep;
  sxn(1,n);
  xuli;
END.
