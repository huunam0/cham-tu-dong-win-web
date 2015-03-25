Type rec=record
         d : longint; k : 1..2;
        end;
Var cay : array[1..1000000] of rec;
    q1,q2 : array[1..100000] of longint;
    n,a,b : longint;
Procedure Input;
 Var f : text;
     i : longint;
 Begin
  Assign(f,'VOI14B12.INP'); Reset(f);
  Readln(f,n,a,b);
  For i:=1 to n do
   Readln(f,cay[i].d,cay[i].k);
  Close(f);
 End;
Procedure Sort(L, H : longint);
 Var i,j : longint;
     x,tmp : rec;
 Begin
  i:=L; j:=H;
  x:=cay[(i+j) div 2];
  Repeat
   While cay[i].d<x.d do inc(i);
   While cay[j].d>x.d do dec(j);
   If i<=j then
    Begin
     tmp:=cay[i];
     cay[i]:=cay[j];
     cay[j]:=tmp;
     inc(i);
     dec(j);
    End;
  Until i>j;
  If L<j then Sort(L,j);
  If i<H then Sort(i,H);
 End;
Function Max(x,y : longint):longint;
 Begin if x>y then max:=x else max:=y;
 End;
Function Min(x,y : longint):longint;
 Begin if x<y then min:=x else min:=y;
 End;
Procedure Xuli;
 Var i,d1,d2,c1,c2,d,c : longint;
     f : text;
 Begin
  c1:=0; c2:=0; d1:=1; d2:=1; d:=0; c:=0;
  For i:=1 to n do
   Begin
    If cay[i].k=1 then
     Begin
      inc(c1);
      q1[c1]:=cay[i].d;
     End
     Else
      Begin
       inc(c2);
       q2[c2]:=cay[i].d;
      End;
    If (c1-d1+1>a) and
     (max(q1[c1],q2[c2])-min(q1[d1],q2[d2])>
      max(q1[c1],q2[c2])-min(q1[d1+1],q2[d2])) then inc(d1);
    If (c2-d2+1>b) and
     (max(q1[c1],q2[c2])-min(q1[d1],q2[d2])>
      max(q1[c1],q2[c2])-min(q1[d1],q2[d2+1])) then inc(d2);
   End;
  Assign(f,'VOI14B12.OUT'); Rewrite(f);
  If (c1-d1+1<a) or (c2-d2+1<b) then writeln(f,'-1')
  Else
   Begin
    d:=min(q1[d1],q2[d2]);
    c:=max(q1[c1],q2[c2]);
    Writeln(f,c-d);
   End;
  Close(f);
 End;
BEGIN
 Input;
 Xuli;
END.




