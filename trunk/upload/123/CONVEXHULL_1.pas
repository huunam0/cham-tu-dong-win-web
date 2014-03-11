{$MODE OBJFPC}
program Task;
const
  InputFile  = '';
  OutputFile = '';
  maxN = Round(1E5);
  maxC = Round(1E9);
type
  PPoint = ^TPoint;
  TPoint = record
    id, xid: Integer;
    x, y: Int64;
    next, prev: PPoint;
  end;
  TVector = TPoint;
  TAreaArray = array[1..maxN] of Int64;
var
  fi, fo: TextFile;
  p: array[1..maxN] of TPoint;
  q: array[1..maxN] of PPoint;
  n: Integer;
  bit: array[1..maxN] of Integer;
  bitlen: Integer;
  upperArea, lowerArea: TAreaArray;
  minY, maxY, area: Int64;

procedure Enter;
var
  i: Integer;
begin
  ReadLn(fi, n);
  minY := maxC; maxY := -maxC;
  for i := 1 to n do
    with p[i] do
      begin
        ReadLn(fi, x, y);
        if y < minY then minY := y;
        if y > maxY then maxY := y;
        id := i;
      end;
  for i := 1 to n do
    with p[i] do
      y := y - miny;
  maxy := maxy - miny;
end;

procedure GetVector(var v: TVector; const a, b: TPoint);
begin
  v.x := b.x - a.x;
  v.y := b.y - a.y;
end;

operator ><(const u, v: TVector): Int64;
begin
  Result := u.x * v.y - u.y * v.x;
end;

function CCW(const a, b, c: TPoint): Int64;
var
  u, v: TVector;
begin
  GetVector(u, a, b);
  GetVector(v, b, c);
  Result := u >< v;
end;

procedure Sort(L, H: Integer);
var
  i, j: Integer;
  pivot: PPoint;
begin
  repeat
    if L >= H then Exit;
    i := L + Random(H - L + 1);
    pivot := q[i]; q[i] := q[L];
    i := L; j := H;
    repeat
      while (q[j]^.x > pivot^.x) and (i < j) do Dec(j);
      if i < j then
        begin
          q[i] := q[j]; Inc(i);
        end
      else Break;
      while (q[i]^.x < pivot^.x) and (i < j) do Inc(i);
      if i < j then
        begin
          q[j] := q[i]; Dec(j);
        end
      else Break;
    until i = j;
    q[i] := pivot;
    Sort(L, i - 1);
    L := i + 1;
  until False;
end;

procedure GetXID;
var
  i, j: Integer;
  OldX: Integer;
begin
  for i := 1 to n do
    q[i] := @p[i];
  Sort(1, n);
  OldX := q[1]^.x; j := 1;
  for i := 1 to n do
    with q[i]^ do
      begin
        if x <> OldX then
          begin
            Inc(j); OldX := x;
          end;
        xid := j;
      end;
  bitlen := j;
end;

procedure Increase(x: Integer; Delta: Integer);
begin
  while x <= bitlen do
    begin
      Inc(bit[x], Delta);
      Inc(x, x and -x);
    end;
end;

function Query(x: Integer): Integer;
begin
  Result := 0;
  while x > 0 do
    begin
      Inc(Result, bit[x]);
      x := x and Pred(x);
    end;
end;

function Locate(i: Integer): Integer;
var
  x, next, mask: Integer;
begin
  mask := 1;
  while mask shl 1 <= bitlen do mask := mask shl 1;
  x := 0;
  Result := bitlen + 1;
  while mask <> 0 do
    begin
      next := x + mask;
      if next <= bitlen then
        begin
          if i = bit[next] then
            Result := next;
          if i > bit[next] then
            begin
              x := next;
              Dec(i, bit[next]);
            end;
        end;
      mask := mask shr 1;
    end;
end;

function CHPoint(i: Integer): PPoint;
begin
  if i < 0 then Exit(nil);
  i := Locate(i);
  if i <= bitlen then
    Result := q[i]
  else
    Result := nil;
end;

procedure SetLink(p, q: PPoint);
begin
  if p <> nil then p^.next := q;
  if q <> nil then q^.prev := p;
end;

function GetArea(const a, b: TPoint): Int64;
begin
  Result := (a.y + b.y) * (b.x - a.x);
end;

procedure RemovePoint(bitpos: Integer);
var
  prev, next, current: PPoint;
  i: Integer;
begin
  i := Query(bitpos);
  current := q[bitpos];
  prev := current^.prev;
  next := current^.next;
  if prev <> nil then
    Area := Area - GetArea(prev^, current^);
  if next <> nil then
    Area := Area - GetArea(current^, next^);
  if (prev <> nil) and (next <> nil) then
    Area := Area + GetArea(prev^, next^);
  Increase(bitpos, -1);
  q[bitpos] := nil;
  SetLink(prev, next);
end;

procedure AddPoint(const p: TPoint);
var
  bitpos, i: Integer;
  current, prev, next, q1, q2: PPoint;
  u, v: TVector;
begin
  bitpos := p.xid;
  current := q[bitpos];
  if (current <> nil) and (current^.y <= p.y) then
    Exit;
  if current <> nil then
    RemovePoint(bitpos);
  i := Query(bitpos);
  prev := CHPoint(i);
  next := CHPoint(i + 1);
  if (prev <> nil) and (next <> nil) and (CCW(prev^, p, next^) <= 0) then
    Exit;
  q[bitpos] := @p;
  current := @p;
  SetLink(prev, current);
  SetLink(current, next);
  Increase(bitpos, 1);
  if prev = nil then
    if next <> nil then
      Area := Area + GetArea(current^, next^);
  if next = nil then
    if prev <> nil then
      Area := Area  + GetArea(prev^, current^);
  if (prev <> nil) and (next <> nil) then
    Area := Area - GetArea(prev^, next^)
                 + GetArea(prev^, current^)
                 + GetArea(current^, next^);
  repeat
    q1 := current^.next;
    if q1 = nil then Break;
    q2 := q1^.next;
    if q2 = nil then Break;
    if CCW(current^, q1^, q2^) > 0 then Break;
    RemovePoint(q1^.xid);
  until False;
  repeat
    q1 := current^.prev;
    if q1 = nil then Break;
    q2 := q1^.prev;
    if q2 = nil then Break;
    if CCW(q2^, q1^, current^) > 0 then Break;
    RemovePoint(q1^.xid);
  until False;
end;

procedure WriteArea(a: Int64);
begin
  if Odd(a) then WriteLn(fo, a div 2, '.5')
  else writeln(fo, a div 2, '.0');
end;

procedure CalConvexHull(var a: TAreaArray);
var
  i: Integer;
begin
  FillDword(bit[1], bitlen, 0);
  FillChar(q, SizeOf(q), 0); //nil
  Area := 0;
  for i := 1 to n do
    begin
      AddPoint(p[i]);
      a[i] := area;
    end;
end;

procedure Flip;
var
  i: Integer;
begin
  for i := 1 to n do
    p[i].y := maxy - p[i].y;
end;

procedure PrintResult;
var
  i: Integer;
  a, minX, maxX: Int64;
begin
  minX := maxC; maxX := -maxC;
  for i := 1 to n do
    begin
      if p[i].x < minX then minX := p[i].X;
      if p[i].x > maxX then maxX := p[i].X;
      a := 2 * (maxX - minX) * maxY - LowerArea[i] - UpperArea[i];
      WriteArea(a);
    end;
end;

begin
  AssignFile(fi, InputFile); Reset(fi);
  AssignFile(fo, OutputFile); Rewrite(fo);
  try
    Enter;
    GetXID;
    CalConvexHull(LowerArea);
    Flip;
    CalConvexHull(UpperArea);
    PrintResult;
  finally
    CloseFile(fi); CloseFile(fo);
  end;
end.

