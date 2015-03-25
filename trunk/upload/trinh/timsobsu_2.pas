CONST fi = 'TIMSOBSU.INP';
      fo = 'TIMSOBSU.OUT';
VAR N : word;
FUNCTION UOC (n : longint) : int64;
 Var m, k, i, j : word;
     S : int64;
 Begin
  while sqr (trunc( sqrt (1 + 8*(N-1)))) <> 1 + 8*(N-1) do
    inc(N);
  k := (trunc (sqrt (1 + 8*(N-1))) - 1) div 2;
  S := 1;
  for i := 2 to k+1 do
    for j := 2 to i do
      if i mod j = 0 then
        begin
          S := S*j;
          break;
        end;
  UOC := S;
 End;
PROCEDURE PROCESS;
 Var f1, f2 : text;
 Begin
  assign(f1,fi); reset(f1);
  assign(f2,fo); rewrite(f2);
  readln(f1,N);
  write(f2,UOC(N));
  close(f1); close(f2);
 End;
BEGIN
  PROCESS;
END.

