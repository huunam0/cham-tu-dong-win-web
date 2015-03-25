CONST fi = 'TIMSOBSU.INP';
      fo = 'TIMSOBSU.OUT';
VAR N : word;
FUNCTION UOC (n : longint) : int64;
 Var m, k, i : word;
     S : int64;
 Begin
  while sqr (round( sqrt (1 + 8*(N-1)))) <> 1 + 8*(N-1) do
    inc(N);
  k := (round( sqrt (1 + 8*(N-1))) - 1) div 2;
  S := 1;
  for i := 2 to k+1 do
    S := S*i;
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

