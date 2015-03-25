type
bi=record
	x,y:array[1..1000] of longint;
end;
var fi,fo:text;
	i,n:integer;
	mx,md:bi;
procedure out(a,b,c:integer);
begin
	if i=1 then writeln(fo,a,#32,b,#32,c+n) else
  writeln(fo,c,#32,a+n,#32,b+n);
  close(fi); close(fo);
  halt;
end;
procedure find(b1,b2:bi);
var i,j,k:integer;
	tx1,tx2,ty1,ty2:real;
begin
	for i:=1 to n-1 do
	for j:=i+1 to n do
	for k:=1 to n do
	begin
		tx1:=b1.x[j]-b1.x[i];
		tx2:=b1.x[j]-b2.x[k];
		ty1:=b1.y[j]-b1.y[i];
		ty2:=b1.y[j]-b2.y[k];
		if tx1*ty2=tx2*ty1 then
		begin
      out(i,j,k);
		end;
	end;
end;
begin
	assign(fi,'voi14b14.inp'); reset(fi);
	assign(fo,'voi14b14.out'); rewrite(fo);
	readln(fi,n);
	for i:=1 to n do readln(fi,mx.x[i],mx.y[i]);
	for i:=1 to n do readln(fi,md.x[i],md.y[i]);
	i:=1;
	find(mx,md);
	i:=2;
  find(md,mx);
  writeln(fo,-1);
  close(fi); close(fo);
end.
