CONST fi = 'DONGNUOC.INP';
      fo = 'DONGNUOC.OUT';
VAR M, N, K : longint;
FUNCTION LON (M, N, K : longint) : longint;
 Var cou, rem : longint;
     check : boolean;
 Begin
  cou := 1;
  check := false;
  while M <> N do
    begin
      if M > N then M := M - N
      else N := N - M;
      if (M = K) or (N = K) then
        begin
          check := true;
          rem := cou;
        end;
      inc(cou);
    end;
  if check then LON := 2*rem
  else LON := -1;
 End;
FUNCTION DONGNUOC : longint;
 Begin
  if (M = K) or (N = K) then DONGNUOC := 1
  else DONGNUOC := LON(M,N,K);
 End;
PROCEDURE PROCESS;
 Var f1, f2 : text;
 Begin
  assign(f1,fi); reset(f1);
  assign(f2,fo); rewrite(f2);
  readln(f1,M,N,K);
  write(f2,DONGNUOC);
  close(f1); close(f2);
 End;
BEGIN
  PROCESS;
END.
