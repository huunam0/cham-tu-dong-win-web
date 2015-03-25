 Program Bai2;

 var a:Array[1..100] of longint;
     f:array[1..100] of integer;
     n:integer;

 Procedure Nhap;
 var i:integer;f:text;
 begin
	assign(f,'modtke.inp');
	reset(f);
      readln(f,n);
      for i:= 1 to n do
         read(f,a[i]);
	close(f);
 end;
 Procedure Xuli;
 var i,j,k,l:integer;g:text;
 begin
    fillchar(f,sizeof(f),0);
    for i:= 1 to n do
       for j:= i-1 downto 1 do
          if a[i]=a[j] then
             begin
                f[i]:=f[j]+1;
                break;
             end;
    k:=-maxint;
    for i:= 1 to n do
       if k<f[i] then
          begin
             k:=f[i];
             l:=i;
          end;
	assign(g,'modtke.out');
	rewrite(g);
       
       writeln(g,k+1);writeln(g,a[l]);
	close(g);

 end;
 begin
    Nhap;
    Xuli;
 end.