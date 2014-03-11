 Program Bai1;
 //uses crt;
 const d:array[1..4] of integer=(500,200,100,50);
 var m,n,k,dem:longint;
     st:string;
     a,b:Array[1..1000] of integer;
     da:array[50..500] of byte;
 Procedure Nhap;
 var i:integer;
 begin
   //clrscr;
   dem:=0;
   //writeln;
   //write('Nhap so tien can rut, N= ');
   read(st);
   for i:= 1 to 3 do
      delete(st,length(st),1);
   val(st,n,i);
   //write('Nhap so to rut, M= ');
   readln(m);
   fillchar(a,sizeof(a),0);
 end;
 Function Tinh(k:integer):longint;
 var i:integer;
     s,l:longint;
 begin
    s:=0;l:=1;
    for i:= 1 to k do
       s:=s+a[i];
    Tinh:=s;
 end;
 Procedure Xuat(dem:integer);
 var i:integer;
 begin

    fillchar(da,sizeof(da),0);
    for i:= 1 to m do
       inc(da[a[i]]);
    for i:= 50 to 500 do
        if da[i]<>0 then
           write(da[i],' ');
    writeln;
 end;
 Procedure Test(k:integer);
 var i,j,l:integer;
 begin
     inc(dem);
     if dem=1 then
        begin
           Xuat(dem);
           b:=a;
        end
     else
        begin
           for i:= 1 to m-1 do
              for j:= i+1 to m do
              begin
                 if a[i]>a[j] then
                    begin
                       l:=a[i];
                       a[i]:=a[j];
                       a[j]:=l;
                    end;
                 if b[i]>b[j] then
                    begin
                       l:=b[i];
                       b[i]:=b[j];
                       b[j]:=l;
                    end;
              end;
           l:=0;
           for i:= 1 to m do
              if a[i]=b[i] then inc(l);
           if l=m then dem:=dem-1
           else
              begin
                 Xuat(dem);
                 b:=a;
              end;
     end;
 end;
 Procedure Thu(i:integer);
 var j:integer;
 begin
    for j:= 1 to 4 do
       begin
          a[i]:=d[j];
          if i=m then
             begin
                if Tinh(i)=n then Test(i);
             end
          else Thu(i+1);
       end;
 end;
 begin
    Nhap;
    Thu(1);
    if dem=0 then write('-1');
    //readln;
 end.