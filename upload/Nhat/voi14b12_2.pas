 type mang=array[1..300000] of longint;
 var t,c:mang;
     n,a,b,t1,c1,x,y,z,da,cu,g:longint;
     f:text;
 Procedure Nhap;
 var i,j,k:integer;
 begin
    assign(f,'VOI14B12.INP');
    reset(f);
       readln(f,n,a,b);
       t1:=0;c1:=0;
       for i:= 1 to n do
          begin
             readln(f,j,k);
             if k=1 then
                begin
                   inc(t1);
                   t[t1]:=j;
                end
             else
                begin
                   inc(c1);
                   c[c1]:=j;
                end;
          end;
    close(f);
 end;
 Function Tim(x,z:longint;y:mang):longint;
 begin
    da:=1;cu:=z;
    while da<=cu do
       begin
          g:=(da+cu) div 2;
          if x>y[g] then da:=g+1
          else cu:=g-1;
       end;
    Tim:=da;
 end;
 Procedure Sapxep(d,c:longint;var x:mang);
 var i,j,k,l:longint;
 begin
    if d>c then exit;
    k:=x[(d+c) div 2];i:=d;j:=c;
    repeat
       while x[i]<k do inc(i);
       while x[j]>k do dec(j);
       if i<=j then
          begin
             l:=x[i];
             x[i]:=x[j];
             x[j]:=l;
             inc(i);dec(j);
          end;
    until i>j;
    Sapxep(d,j,x);
    Sapxep(i,c,x);
 end;
 Procedure Xuli;
 var i,min:longint;
 begin
    min:=high(longint);
    Sapxep(1,c1,c);
    Sapxep(1,t1,t);
    for i:= 1 to t1-a+1 do
       begin
          x:=Tim(t[i],c1,c);
          y:=x+b-1;
          while y<=c1 do
             begin
                z:=Tim(c[y],t1,t);
                if z-i>=a then
                   begin
                      if min>c[y]-t[i] then min:=c[y]-t[i];
                      break;
                   end
                else inc(y);
             end;
       end;
    for i:= 1 to c1-b+1 do
       begin
          x:=Tim(c[i],t1,t);
          y:=x+a-1;
          while y<=t1 do
             begin
                z:=Tim(t[y],c1,c);
                if z-i>=b then
                   begin
                      if min>t[y]-c[i] then min:=t[y]-c[i];
                      break;
                   end
                else inc(y);
             end;
       end;
    assign(f,'VOI14B12.OUT');
    rewrite(f);
       if min=high(longint) then write(f,-1)
       else write(f,min);
    close(f);
 end;
 begin
    Nhap;
    Xuli;
 end.