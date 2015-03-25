{ho van phong   }
program bai2;
uses crt;
var s:string;
f:text;
a,b:longint;
procedure doc;
begin
        assign(f,'cstc.inp');
        reset(f);
        readln(f,a,b);
        close(f);
end;
procedure xuli;
var t,c,d,h,g,i:longint;
begin
        writeln('doi ti(khoang 30 giay):');
        a:=a mod 100;
        t:=a;
         d:=a mod 10;
        c:=a div 10;
        for i:=2 to b do
          begin
                h:=t*d;
                g:=(t*c) mod 10;
                t:=h+g*10;
                if t>99 then t:=t mod 100;
          end;
        assign(f,'cstc.out');
        rewrite(f);
        write(f,t);
        closE(f);
end;
begin
        doc;
        xuli;
end.
