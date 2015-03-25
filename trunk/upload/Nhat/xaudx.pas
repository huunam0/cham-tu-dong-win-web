 uses crt;
 var a,b:String;
     x:array[0..100,0..100] of integer;
     f:text;
 Procedure Nhap;
 var i:integer;
 begin
    assign(f,'XAUDX.INP');
    reset(f);
       readln(f,a);
       b:='';
       for i:= length(a) downto 1 do b:=b+a[i];
    close(f);
 end;
 Function Max(a,b,c:integer):integer;
 var t:integer;
 begin
    if a>b then t:=a else t:=b;
    if t<c then t:=c;
    max:=t;
 end;
 Procedure Xuli;
 var i,j:integer;
 begin
    fillchar(x,sizeof(x),0);
    for i:= 1 to length(a) do
       for j:= 1 to length(b) do
          if a[i]<>b[j] then x[i,j]:=max(x[i-1,j],x[i,j-1],x[i-1,j-1])
          else x[i,j]:=max(x[i-1,j],x[i,j-1],x[i-1,j-1]+1);
    assign(f,'XAUDX.OUT');
    rewrite(f);
       write(f,length(a)-x[length(a),length(b)]);
    close(f);
 end;
 begin
    Nhap;
    Xuli;
 end.