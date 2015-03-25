var	fi,fo:text;
	i,j,m,n,k,d,count,he:integer;
	a:array[1..100,1..100] of integer;
procedure equal(h:integer; var d:integer);
var i,j:integer;
begin
	for i:=1 to m-1 do
	for j:=1 to n do if a[i,j]<h then
  begin
    inc(d,1);
  end;
end;
begin
	assign(fi,'honuoc.inp'); reset(fi);
	assign(fo,'honuoc.out'); rewrite(fo);
	readln(fi,m,n,k);
	for i:=1 to m-1 do
	begin for j:=1 to n do read(fi,a[i,j]); readln(fi); end;
	readln(fi,he);
  d:=0; count:=0; inc(he);
	while d<k do begin dec(he); equal(he,d); inc(count); end;
	writeln(fo,count,#32,d);
	close(fi); close(fo);
end.
