var fi,fo:text;
    c1,c2,k,d1,d2:integer;
function dong(c1,c2:integer):integer;
var d1,d2,dem:integer;
begin
  d1:=0; d2:=0; dem:=0;
    repeat
      if (d1=k) or (d2=k) then begin dong:=dem; break; end else
      begin
        if d1=0 then d1:=c1 else
        if d2<>c2 then
        begin
          if d1+d2>c2 then begin d1:=d1-(c2-d2); d2:=c2; end else
          begin d2:=d1+d2; d1:=0; end;
        end else
         if d2=c2 then d2:=0;
         inc(dem);
        end;
    until (d1=c1) and (d2=c2);
    if (d1=c1) and (d2=c2) then dong:=-1;
end;
begin
  assign(fi,'dongnuoc.inp'); reset(fi);
  assign(fo,'dongnuoc.out'); rewrite(fo);
  readln(fi,c1,c2,k);
  d1:=dong(c1,c2); d2:=dong(c2,c1);
  if (d1>-1) and (d2>-1) then
  begin
    if d1<d2 then writeln(fo,d1) else writeln(fo,d2);
  end else writeln(fo,'-1');
  close(fi); close(fo);
end.
