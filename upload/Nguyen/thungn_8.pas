var fi,fo:text;
    x,y,z,dem:integer;
    chk:array[1..500] of boolean;
    a:array[1..500,1..500] of byte;
    temp:string;
procedure add(x:integer);
var i:integer;
begin
  chk[x]:=true;
  inc(dem);
  for i:=1 to dem do begin a[i,x]:=0; a[x,i]:=0; end;
end;
function bfs(x,y:integer):boolean;
var d,c,i:integer;
    q:array[1..500] of integer;
    chk1:array[1..500] of boolean;
begin
  bfs:=false;
  fillchar(chk1,sizeof(chk1),false);
  d:=1; c:=1;
  q[d]:=x;
  chk1[x]:=true;
  while c>=d do
  begin
    if q[d]=y then begin bfs:=true; break; end else
    begin
      for i:=1 to dem do if (a[i,q[d]]=1) and (not chk1[i]) then
      begin inc(c); q[c]:=i; chk1[i]:=true; end;
    end;
    inc(d);
  end;
end;
begin
  assign(fi,'thungn.inp'); reset(fi);
  assign(fo,'thungn.out'); rewrite(fo);
  read(fi,temp);
  if pos(' ',temp)=0 then readln(fi) else reset(fi);
  dem:=0;
  fillchar(chk,sizeof(chk),false);
  fillchar(a,sizeof(a),0);
  while not eof(fi) do
  begin
    readln(fi,x,y,z);
    if not chk[x] then add(x);
    if not chk[y] then add(y);
    if z=1 then begin a[y,x]:=1; a[x,y]:=1; end else
    if bfs(x,y) then writeln(fo,'1') else writeln(fo,'0');
  end;
  close(fi); close(fo);
end.