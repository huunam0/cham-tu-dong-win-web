var fi,fo:text;
    m,n,k,d,c:integer;
    a,b,de:array[1..1000] of integer;
function chk(x,y:integer):boolean;
var i:integer;
begin
	chk:=true;
	for i:=1 to c do if (x=a[i]) and (y=b[i]) then begin chk:=false; break; end;
end;
procedure add(x,y:integer);
begin
	inc(c);
	a[c]:=x; b[c]:=y; de[c]:=de[d]+1;
end;
begin
	assign(fi,'dongnuoc.inp'); reset(fi);
	assign(fo,'dongnuoc.out'); rewrite(fo);
	readln(fi,m,n,k);
	d:=1; c:=1;
	a[1]:=0; b[1]:=0; de[1]:=0;
	while d<=c do
	begin
		if (a[d]=k) or (b[d]=k) or (a[d]+b[d]=k) then begin writeln(fo,de[d]); break; end;
		if (a[d]=0) and (chk(m,b[d])) then add(m,b[d]);
		if (a[d]<>0) then
		begin
			if (chk(0,b[d])) then add(0,b[d]);
			if (a[d]+b[d]<=n) and (chk(0,a[d]+b[d])) then add(0,a[d]+b[d]) else
			if (a[d]+b[d]>n) and (chk(a[d]+b[d]-n,n)) then add(a[d]+b[d]-n,n);
		end;
		if (b[d]=0) and (chk(a[d],n)) then add(a[d],n);
		if (b[d]<>0) then
		begin
			if (chk(a[d],0)) then add(a[d],0);
			if (a[d]+b[d]<=m) and (chk(a[d]+b[d],0)) then add(a[d]+b[d],0) else
			if (a[d]+b[d]>m) and (chk(m,a[d]+b[d]-m)) then add(m,a[d]+b[d]-m);
		end;
		inc(d);
	end;
	if d>c then writeln(fo,'-1');
	close(fi); close(fo);
end.
