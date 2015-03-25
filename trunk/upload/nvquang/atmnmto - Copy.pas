///Bai 1 - thnam
var n:longint;m:byte;i,j,k,l : byte;
BEGIN
    readln(n,m);
	l:=0;
	for i:= 0 to m do
		for j:= 0 to m-i do
			for k:= 0 to m-i-j do
					if i*500000+j*200000+k*100000+(m-i-j-k)*50000 = n then begin
						writeln(i,' ',j,' ',k,' ',m-i-j-k);
						inc(l);
						end;
	if l=0 then write(-1);
END.
