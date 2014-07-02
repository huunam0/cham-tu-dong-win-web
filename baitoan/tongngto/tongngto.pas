var n : longint;
function nguyento(x : longint):boolean;
var i : longint;
begin
   for i:= 2 to trunc(sqrt(x)) do
       if x mod i = 0 then exit(false);
   exit(true);
end;
procedure xuli;
var x : longint;
begin
   write('Nhap so tu nhien ');
   readln(n);
   for x:= 2 to n div 2 do
       if nguyento(x) and nguyento(n-x) then
          writeln(x:11, n-x:11);
end;
procedure test;
begin
   writeln(nguyento(5));
end;

BEGIN
    //test;
    xuli;
    readln;
END.