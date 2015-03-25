var fi,fo:text;
    i,n,a,a1,a2:longint;
begin
  assign(fi,'twomax.inp'); reset(fi);
  assign(fo,'twomax.out'); rewrite(fo);
  readln(fi,n);
  a1:=-1000000000; a2:=a1;
  for i:=1 to n do
  begin
    read(fi,a);
    if a>a1 then begin a2:=a1; a1:=a; end else
    if a>a2 then a2:=a;
  end;
  writeln(fo,a2,#32,a1);
  close(fi); close(fo);
end.