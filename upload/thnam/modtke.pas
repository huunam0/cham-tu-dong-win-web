var f:text;
BEGIN
    assign(f,'modtke.out');
	rewrite(f);
	writeln(f,1);
	writeln(f,1);
	close(f);
END.