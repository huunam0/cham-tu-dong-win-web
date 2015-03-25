type point=record
	a,b:array[1..3] of real;
end;
var fi,fo:text;
	i:integer;
	dai1,dai2,dai3,p,s:real;
  t:point;
function check:boolean;
var ta1,ta2,tb1,tb2:real;
begin
	ta1:=t.a[1]-t.a[2]; ta2:=t.a[1]-t.a[3];
	tb1:=t.b[1]-t.b[2]; tb2:=t.b[1]-t.b[3];
  if (ta2=0) or (tb2=0) then check:=true else
  begin if ta1/ta2<>tb1/tb2 then check:=true else check:=false; end;
end;
function dai(a,b,c,d:real):real;
begin
	dai:=sqrt(sqr(c-a)+sqr(d-b));
end;
begin
	assign(fi,'kttgiac.inp'); reset(fi);
	assign(fo,'kttgiac.out'); rewrite(fo);
	for i:=1 to 3 do readln(fi,t.a[i],t.b[i]);
	if check then
	begin
		dai1:=dai(t.a[1],t.b[1],t.a[2],t.b[2]);
		dai2:=dai(t.a[1],t.b[1],t.a[3],t.b[3]);
		dai3:=dai(t.a[2],t.b[2],t.a[3],t.b[3]);
		p:=(dai1+dai2+dai3)/2;
		s:=sqrt(p*(p-dai1)*(p-dai2)*(p-dai3));
		writeln(fo,p*2:3:3,#32,s:3:3);
  end else writeln(fo,'0');
	close(fi); close(fo);
end.
