{Bai 2 - Nguyen Van Kiem}
uses crt;
var f:text;
    a,b:longint;
    d1,d2,kq:byte;
procedure doc_dl;
begin
 assign(f,'cstc.inp');
 reset(f);
 readln(f,a,b);
 close(f);
end;
procedure xuat_kq;
begin
 assign(f,'cstc.out');
 rewrite(f);
 writeln(f,kq);
 close(f);
end;
procedure pt(a:longint);
begin
 d1:=0;
 d2:=0;
 while (a mod 2)=0 do
  begin
   inc(d1);
   a:=a div 2;
  end;
 while (a mod 5)=0 do
  begin
   inc(d2);
   a:=a div 5;
  end;
end;
procedure xuly;
var a1,a2:byte;
    i:longint;
begin
 pt(a);
 if (d1*b>=2)and(d2*b>=2) then kq:=0;
 a1:=a mod 100;
 a2:=a1;
 for i:=2 to b do
  begin
   a:=a1*a2;
   a2:=a mod 100;
  end;
 kq:=a2;
end;
begin
 doc_dl;
 xuly;
 xuat_kq;
end.