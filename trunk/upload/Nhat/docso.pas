 uses crt;
 var a:array[0..9] of string;
     n:integer;
     b:string;
     f1,f2:text;
 Procedure Nhap;
 var i:integer;
 begin
    a[0]:='khong';a[1]:='mot';a[2]:='hai';a[3]:='ba';a[4]:='bon';
    a[5]:='nam';a[6]:='sau';a[7]:='bay';a[8]:='tam';a[9]:='chin';
 end;
 Procedure D1(n:integer;var s:string);
 begin
    s:=a[n];
    s[1]:=upcase(s[1]);
 end;
 Procedure D2(n:integer;var s:string);
 var x1,x2:byte;
 begin
    x1:=n div 10;
    x2:=n mod 10;
    if (x1=1) and (x2=0) then S:='muoi'
    else if (x1=1) and (x2=5) then S:='muoi lam'
    else if (x1=1) then S:='muoi '+a[x2]
    else if (x1<>1) and (x2=5) then S:=a[x1]+' muoi lam'
    else if (x1<>1) and (x2=0) then S:=a[x1]+' muoi'
    else s:=a[x1]+' muoi '+a[x2];
 end;
 Procedure D3(n:integer;var s:string);
 var x1,x2,x3:byte;
     s1:string;
 begin
    x1:=n div 100;
    x2:=(n div 10) mod 10;
    x3:=n mod 10;
    if (x2=0) and (x3=0) then s:=a[x1]+' tram'
    else if (x2=0) then s:=a[x1]+' tram linh '+a[x3]
    else
       begin
          D2(n mod 100,s1);
          s:=a[x1]+' tram '+s1;
       end;
 end;
 Procedure D4(n:integer;var s:string);
 var x1,x2,x3,x4:byte;
     s1:string;
 begin
    x1:=n div 1000;
    x2:=(n mod 1000) div 100;
    x3:=(n mod 100) div 10;
    x4:=n mod 10;
    if (x2=0) and (x3=0) and (x4=0) then  s:=a[x1]+' nghin'
    else if (x3=0) and (x4<>0)then s:=a[x1]+' nghin '+a[x2]+' tram linh '+a[x4]
    else if (x2=0) then
       begin
          D2(n mod 100,s1);
          s:=a[x1]+' nghin khong tram '+s1;
       end
    else
       begin
          D3(n mod 1000,s1);
          s:=a[x1]+' nghin '+s1;
       end;
 end;
 Procedure Xuli;
 begin
    assign(f1,'DOCSO.INP');
    reset(f1);
    assign(f2,'DOCSO.OUT');
    rewrite(f2);
          readln(f1,n);
          case n of
          0..9:D1(n,b);
          10..99:D2(n,b);
          100..999:D3(n,b);
          1000..9999:D4(n,b);
          end;
       b[1]:=upcase(b[1]);
       writeln(f2,b);
    close(f1);
    close(f2);
 end;
 begin
    Nhap;
    Xuli;
 end.