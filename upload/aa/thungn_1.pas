var n:word;
    a: array[1..10000] of longint;
{procedure doctep;
var f:text; x,y,tg:word;
begin
  assign(f,'thungn.inp');
  reset(f);
  while not eof(f) do
    begin
      readln(f,x,y);
      if x<y then
        begin
          tg:=x;
          x:=y;
          y:=tg;
        end;
      if x>n then n:=x;
    end;
  writeln(n);
  close(f);
end;          }
procedure doctep2;
var
        f,f2: text;
        i, mode, x, y: longint;

BEGIN
        assign(f,'thungn.inp'); reset(f);
        readln(f,n);
        assign(f2,'thungn.out'); rewrite(f2);
        for i := 1 to n do a[i] := i;
        while not eof(f) do
        begin
                readln(f, x, y, mode);
                while a[x] <> x do x := a[x];
                while a[y] <> y do y := a[y];
                if mode = 2 then
                begin
                        if a[x] = a[y] then writeln(f2,1) else writeln(f2,0);
                end
                else
                begin
                        if x > y then a[x] := y else a[y] := x;
                end;
        end;
        close(f);  close(f2);
END;
BEGIN

  doctep2;
END.

