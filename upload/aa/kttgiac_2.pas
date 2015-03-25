var  x,y:array[1..3] of real;
    cv,p,ss,a,b,c:real; f2:text;
procedure doctep;
var   f:text; i:word;
begin
  assign(f,'kttgiac.inp');
  reset(f);
  for i:=1 to 3 do readln(f,x[i],y[i]);
  close(f);
end;
function kc(i,j:word):real;
begin
  kc:=sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]));
end;
function ktra:boolean;
begin
  a:=kc(1,2);
  b:=kc(2,3);
  c:=kc(1,3);
  if (a+b>c) and (abs(a-b)<c)  then ktra:=true
  else ktra:=false;
end;
function chuvi:real;
begin
  chuvi:=a+b+c;
end;
function S:real;
begin
  s:=sqrt(p*(p-a)*(p-b)*(p-c));
end;
BEGIN
    doctep;
    assign(f2,'kttgiac.out');
    rewrite(f2);
    if ktra=true then
      begin
        cv:=chuvi;
        p:=chuvi / 2;
        ss:=s;
        write(f2,cv:5:3,' ',ss:5:3);
      end;
    close(f2);
END.



