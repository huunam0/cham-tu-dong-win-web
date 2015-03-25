var f : text;
	x, y, z : integer;
begin
	assign(f,'dulieu.txt');
	reset(f);
	readln(f,x);
	readln(f,y,z);
	close(f);
	
	assign(f,'ketqua.txt');
	rewrite(f);
	writeln(f,y);
	writeln(f,x,z);
	close(f);
end.