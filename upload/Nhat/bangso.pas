 uses crt;
 var a,b:array[1..1000] of integer;
     n,m,kq:integer;
     x:longint;
     f:text;
 Procedure Nhap;
 var i:integer;
 begin
    assign(f,'BANGSO.INP');
    reset(f);
       readln(f,n);
       for i:= 1 to n do
          read(f,a[i]);
    close(f);
 end;
 Procedure Xuli;
 var y,z:longint;
     i,j,t:integer;
     kt:boolean;
 begin
    x:=0;kq:=0;
    for i:= 1 to n do x:=x+a[i];
    b[1]:=a[1];
    for i:= 2 to n do b[i]:=b[i-1]+a[i];
    for i:= 1 to n div 2 do
       begin
          y:=b[i];
          if x mod y=0 then
             begin
                kt:=true;t:=i;
                while kt do
                   begin
                      z:=0;j:=t+1;
                      while (z<y) and (j<=n)do
                         begin
                            z:=z+a[j];
                            inc(j);
                         end;
                      if z>y then kt:=false
                      else if j<=n then t:=j-1
                      else if (j>n) and (z=y) then
                         begin
                            kq:=y;
                            exit;
                         end;
                   end;
             end;
       end;
 end;
 Procedure Xuat;
 begin
    assign(f,'BANGSO.OUT');
    rewrite(f);
       if kq<>0 then
          write(f,x div kq,' ',kq)
       else write(f,1,' ',x);
    close(f);
 end;
 begin
   Nhap;
   Xuli;
   Xuat;
 end.
