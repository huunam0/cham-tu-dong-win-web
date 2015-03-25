Type rec=record
          x,y : real;
         end;
Var d1,d2,d3 : real;
    f : text;
    tg : array[1..3] of rec;
Procedure Input;
 Var f : text;
 Begin
  Assign(f,'KTTGIAC.INP');
  Reset(f);
  Readln(f,tg[1].x,tg[1].y);
  Readln(f,tg[2].x,tg[2].y);
  Readln(f,tg[3].x,tg[3].y);
  Close(f);
 End;
Function KT(x1,y1,x2,y2,x3,y3 : real):boolean;
 Var k : boolean;
 Begin
  k:=false;
  d1:=sqrt(sqr(x2-x1)+sqr(y2-y1));
  d2:=sqrt(sqr(x3-x2)+sqr(y3-y2));
  d3:=sqrt(sqr(x1-x3)+sqr(y1-y3));
  If (d1<d2+d3) then
   If (d2<d1+d3) then
    If (d3<d1+d2) then k:=true;
  KT:=k;
 End;
Function cv(a,b,c : real): real;
 Begin cv:=a+b+c;
 End;
Function dt(a,b,c : real): real;
 Var p : real;
 Begin
  p:=cv(a,b,c)/2;
  dt:=sqrt(p*(p-a)*(p-b)*(p-c));
 End;
BEGIN
 Input;
 Assign(f,'KTTGIAC.OUT'); Rewrite(f);
 If KT(tg[1].x,tg[1].y,tg[2].x,tg[2].y,tg[3].x,tg[3].y) then
  Writeln(f,cv(d1,d2,d3):0:3,' ',dt(d1,d2,d3):0:3)
  Else writeln(f,'0');
 Close(f);
END.











