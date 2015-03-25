program Bai3(LeQuangPhu);
uses crt;
var a: array [1..100] of word;
    n: byte;
    f: text;
Procedure Doc;
var i:byte;
begin
  assign(f,'BANGSO.inp'); reset(f);
  readln(f,n);
  for i:=1 to n do read(f,a[i]);
  close(f);
end;

Procedure Tong;
var i,j: byte;
    t,v1,v2: longint;
    kt: boolean;
begin
  assign(f,'BANGSO.out'); rewrite(f);
  t:=0;
  for i:=1 to n do inc(t,a[i]);
  i:=1;
  repeat
    if t mod i = 0 then
      begin
        v2:=0;
        v1:=t div i;
        j:=0;
        while v2 < v1 do
          begin
            inc(j);
            inc(v2,a[j]);
            if v2=v1 then
              begin
                inc(j);
                v2:=0;
                inc(v2,a[j]);
                if j=n then
                  begin
                    write(f,(t div v1),'  ',v1);
                    kt:=true;
                    break;
                  end;
              end
      else  if v2>v1 then inc(i);
          end;
      end;
    until kt=true;
    close(f);
end;
BEGIN
 Doc;
 Tong;
END.