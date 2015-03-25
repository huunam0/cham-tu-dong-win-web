 Program Bai2;
var f : text;
 begin
    assign(f,'cstc.out');
	rewrite(f);
	write(f,'00');
	close(f);
 end.