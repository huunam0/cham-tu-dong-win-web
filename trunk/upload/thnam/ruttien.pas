///Bai 1 - thnam
var n:longint;m:byte;i,j,k,l,sl : byte;
f : text;
BEGIN
    assign(f,'ruttien.inp');
	reset(f);
	readln(f,n,m);
	close(f);
	sl:=0;
	for i:= 0 to m do
		for j:= 0 to m-i do
			for k:= 0 to m-i-j do begin
				l:= m-i-j-k;
				if i*500000+j*200000+k*100000+l*50000 = n then inc(sl);
				end;
	assign(f,'ruttien.out');
	rewrite(f);
	writeln(f,sl);
	for i:= 0 to m do
		for j:= 0 to m-i do
			for k:= 0 to m-i-j do begin
				l:= m-i-j-k;
				if i*500000+j*200000+k*100000+l*50000 = n then writeln(f,i,'   ',j,'   ',k,'    ',l);;
				end;
	close(f);
END.
