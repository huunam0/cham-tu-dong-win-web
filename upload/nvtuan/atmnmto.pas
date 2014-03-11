///Bai 1 - thnam
var n:longint;m:byte;i,j,k,l : byte;
BEGIN
    readln(n,m);
	for i:= 0 to m do
		for j:= 0 to m-i do
			for k:= 0 to m-i-j do
				for l:= 0 to m-i-j-k do
					if i*500000+j*200000+k*100000+l*50000 = n then writeln(i,' ',j,' ',k,' ',l);
END.
