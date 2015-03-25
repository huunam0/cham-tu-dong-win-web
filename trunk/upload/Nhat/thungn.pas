 uses crt;
 var x,y,z:integer;
     t:array[1..10000] of integer;
     f1,f2:Text;
 Function Tim(u:integer):integer;
 begin
    while t[u]>0 do u:=t[u];
    Tim:=u;
 end;
 Procedure Hv(var a,b:integer);
 var t:integer;
 begin
    t:=a;
    a:=b;
    b:=t;
 end;
 Procedure Xuli;
 var i,j,k,l:integer;
 begin
    assign(f1,'Thungn.inp');
    reset(f1);
    assign(f2,'Thungn.out');
    rewrite(f2);
       readln(f1);
       for i:= 1 to 10000 do t[i]:=-1;
       while not eof(f1) do
          begin
             readln(f1,x,y,z);
             if x>y then Hv(x,y);
             if z=1 then t[y]:=x
             else if z=2 then
                begin
                   if Tim(x)<>Tim(y) then writeln(f2,0)
                   else writeln(f2,1);
                end;
          end;
    close(f1);
    close(f2);
 end;
 begin
    Xuli;
 end.
