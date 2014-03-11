///thnnam bai3
var f : text;
BEGIN
	assign(f,'modtke.out');
	rewrite(f);
    writeln(f,17);
	writeln(f,9);
	close(f);
END.
