Var a,b,k : integer;
    f : text;
Procedure Input;
 Var f : text;
 Begin
  Assign(f,'DONGNUOC.INP'); Reset(f);
  Readln(f,a,b,k);
  Close(f);
 End;
Function Max(x,y : integer): integer;
 Begin
  If x>y then max:=x else max:=y;
 End;
Function Xuli : integer;
 Var f : text;
     t,z,sl,i : integer;
 Begin
  If (k=0) or ((a<k) and (b<k)) then exit(-1);
  If (a=k) or (b=k) then exit(1);
  If (a=b) then
   If (k=a) then exit(1)
   Else exit(-1);
  If max(a,b)=a then
   Begin
    t:=a;
    a:=b;
    b:=t;
   End;
  z:=b div a;
  If k=b-a then exit(2);
  For i:=1 to z+1 do
   If i=z+1 then
    Begin
     If k=(z+1)*a-b then exit((z+1)*2);
    End
   Else
    Begin
     sl:=sl+a;
     If sl=k then exit(i*2);
    End;
  exit(-1);
 End;
BEGIN
 Input;
 Assign(f,'DONGNUOC.OUT'); Rewrite(f);
 Writeln(f,Xuli);
 Close(f);
END.
