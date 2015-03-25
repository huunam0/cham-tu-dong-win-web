var fi,fo:text;
	i,j,k,n,d1,d2,df1,df2,max:longint;
	d:array[1..1000000] of longint;
	a:array[1..1000000] of byte;
procedure quicksort(dau,cuoi:longint);
var i,j,p,tmp:longint;
begin
	p:=d[(dau+cuoi) div 2];
	i:=dau; j:=cuoi;
	while i<j do
	begin
		while d[i]<p do inc(i);
		while d[j]>p do dec(j);
		if i<=j then
		begin
			if i<j then
			begin
				tmp:=a[i]; a[i]:=a[j]; a[j]:=tmp;
				tmp:=d[i]; d[i]:=d[j]; d[j]:=tmp;
			end;
			inc(i); dec(j);
		end;
	end;
	if j>dau then quicksort(dau,j);
	if i<cuoi then quicksort(i,cuoi);
end;
begin
	assign(fi,'voi14b12.inp'); reset(fi);
	assign(fo,'voi14b12.out'); rewrite(fo);
	readln(fi,n,df1,df2);
	for i:=1 to n do
	begin
		readln(fi,d[i],a[i]);
	end;
	quicksort(1,n);
	d1:=0; d2:=0; i:=1; j:=1; max:=1000000000;
	for k:=1 to n do
	begin
		if a[k]=1 then
		begin
			if d1<df1 then
			begin
			  inc(d1); j:=k;
			end else
			if a[i]=1 then begin inc(i); inc(j); end;
		end else
		begin
			if d2<df2 then
			begin
			  inc(d2); j:=k;
			end else
      if a[i]=2 then begin inc(i); inc(j); end;
    end;
    if (d1=df1) and (d2=df2) and (d[j]-d[i]<max) then max:=d[j]-d[i];
  end;
  if max<1000000000 then writeln(fo,max) else writeln(fo,-1);
	close(fi); close(fo);
end.
