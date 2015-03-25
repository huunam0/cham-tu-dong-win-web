 uses crt;
 var t:array[1..10000] of integer;
     f1,f2:Text;
     max:integer;
 Procedure Noi(x,y:integer);
 var i:integer;
 begin
    for i:= 1 to max do
       if (i<>y) and (t[i]=t[y]) then t[i]:=t[x];
    t[y]:=t[x];
 end;
 Procedure Xuli;
 var i,x,y,z:integer;
 begin
    assign(f1,'Thungn.inp');
    reset(f1);
       max:=0;
       while not eof(f1) do
          begin
             readln(f1,x,y);
             if max<x then max:=x;
             if max<y then max:=y;
          end;
    reset(f1);
    assign(f2,'Thungn.out');
    rewrite(f2);
       for i:= 1 to max do t[i]:=i;
       while not eof(f1) do
          begin
             readln(f1,x,y,z);
             if z=1 then Noi(x,y)
             else if z=2 then
                begin
                   if t[x]=t[y] then writeln(f2,1)
                   else writeln(f2,0);
                end;
          end;
    close(f1);
    close(f2);
 end;
 begin
    Xuli;
 end.