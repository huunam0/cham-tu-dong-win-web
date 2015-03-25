var	fi,fo:text;
	x,y,z:integer;
	a:array[1..10000] of integer;
procedure update(x,y:integer);
var i,tmp1,tmp2:integer;
begin
	if a[x]<a[y] then
	begin tmp1:=a[x]; tmp2:=a[y]; end else begin tmp1:=a[y]; tmp2:=a[x] end;
	for i:=1 to 10000 do if a[i]=tmp2 then a[i]:=tmp1;
end;
begin
	assign(fi,'thungn.inp'); reset(fi);
  assign(fo,'thungn.out'); rewrite(fo);
  for x:=1 to 10000 do a[x]:=x;
	while not eof(fi) do
	begin
		readln(fi,x,y,z);
		if z=1 then
		begin
      if a[x]<>a[y] then update(x,y);
    end else if (a[x]=a[y]) then writeln(fo,'1') else writeln(fo,'0');
	end;
	close(fi); close(fo);
end.
