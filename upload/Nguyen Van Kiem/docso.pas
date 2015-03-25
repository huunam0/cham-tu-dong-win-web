{Bai 1 - Nguyen Van Kiem}
uses crt;
const cs:array[0..9]of string = ('khong','mot','hai','ba','bon','nam','sau','bay','tam','chin');
var s:word;
    x:string;
    f:text;
procedure nhap;
begin
 assign(f,'docso.inp');
 reset(f);
 readln(f,s);
 close(f);
end;
procedure inkq;
begin
 assign(f,'docso.out');
 rewrite(f);
 writeln(f,x);
 close(f);
end;
procedure xuly;
begin
 x:='';
 if (s div 1000)>0 then x:=x+cs[s div 1000]+' nghin ';
 s:=s mod 1000;
 x:=x+cs[s div 100]+' tram ';
 s:=s mod 100;
 case (s div 10) of
  0: x:=x+'linh ';
  1: x:=x+'muoi ';
 else x:=x+cs[s div 10]+' muoi ';
 end;
 s:=s mod 10;
 if s>0 then x:=x+cs[s];
 if pos('khong tram ',x)=1 then delete(x,1,11);
 if pos('linh ',x)=1 then delete(x,1,5);
end;
begin
 nhap;
 xuly;
 inkq;
end.