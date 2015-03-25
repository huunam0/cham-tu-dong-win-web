var fi,fo:text;
	i,j,m,n:integer;
	s,s1,s2,fs:string;
	t1,t2:array[0..101] of boolean;
	b,t:array[0..101,0..101] of byte;
begin
	assign(fi,'xaumecdn.inp'); reset(fi);
	assign(fo,'xaumecdn.out'); rewrite(fo);
	readln(fi,s1); readln(fi,s2);
	m:=length(s1); n:=length(s2);
	for i:=0 to m do b[i,0]:=0;
	for j:=0 to n do b[0,j]:=0;
	for i:=1 to m do
	for j:=1 to n do
	begin
		if s1[i]=s2[j] then
		begin
			b[i,j]:=b[i-1,j-1]+1;
			t[i,j]:=1;
		end else
		if b[i-1,j]>b[i,j-1] then
		begin
			b[i,j]:=b[i-1,j];
			t[i,j]:=2;
		end else
		begin
			b[i,j]:=b[i,j-1];
			t[i,j]:=3;
		end;
	end;
	fillchar(t1,sizeof(t1),false);
	fillchar(t2,sizeof(t2),false);
  i:=m; j:=n; s:='';
	while (i>0) and (j>0) do
	begin
		if t[i,j]=1 then
    begin
      s:=s1[i]+s;
      t1[i]:=true; t2[j]:=true;
			dec(i); dec(j);
		end else
		if t[i,j]=2 then dec(i) else dec(j);
	end;
	i:=1; j:=1;
	while (i<=m) and (j<=n) do
	begin
		if (t1[i]) and (t2[j]) then
    begin
			fs:=fs+s1[i];
			inc(i); inc(j);
    end;
		if not t1[i] then begin fs:=fs+s1[i]; inc(i); end else
    if not t2[j] then begin fs:=fs+s2[j]; inc(j); end;
  end;
	writeln(fo,length(fs));
  writeln(fo,fs);
	close(fi); close(fo);
end.
