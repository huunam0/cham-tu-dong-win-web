CONST fi = 'voi14b12.inp';
      fo = 'voi14b12.out';
VAR N, c, d, L, R, result : longint;
    count : array [1..2] of longint;
    K : array [1..300000] of byte;
    A : array [1..300000] of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i]<x do
            inc(i);
           while x<a[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                y := K[i];
                K[i] := K[j];
                K[j] := y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
FUNCTION CHECK (mid : longint) : boolean;
 Var i, j : longint;
 Begin
  Check := false;
  for i := 1 to N do
    begin
      count[1] := 0;
      count[2] := 0;
      j := i;
      while ((count[1] < c) or (count[2] < d)) and (j <= N) do
        begin
          inc(count[K[j]]);
          inc(j);
        end;
      if (A[j-1] - A[i] <= mid) and (count[1] >= c) and (count[2] >= d) then
        begin
          Check := true;
          exit;
        end;
    end;
 End;
PROCEDURE TUNGTRUC;
 Var L, R, mid : longint;
 Begin
  result := high(longint);
  Sort(1,N);
  L := 0;
  R := A[N] - A[1];
  while L <= R do
    begin
      mid := (L + R) div 2;
      if CHECK(mid) = true then
        begin
          result := mid;
          R := mid - 1;
        end
      else L := mid + 1;
    end;
 End;
PROCEDURE PROCESS;
 Var f1, f2 : text;
     i : longint;
 Begin
  assign(f1,fi); reset(f1);
  assign(f2,fo); rewrite(f2);
  readln(f1,N,c,d);
  for i := 1 to N do
    readln(f1,A[i],K[i]);
  TUNGTRUC;
  if result <> high(longint) then write(f2,result)
  else write(f2,'-1');
  close(f1); close(f2);
 End;
BEGIN
  PROCESS;
END.
