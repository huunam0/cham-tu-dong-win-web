 uses crt,math;
 var a,b:longint;
     f:text;
 Procedure Nhap;
 begin
    assign(f,'CSTC.INP');
    reset(f);
       readln(f,a,b);
    close(f);
 end;
 Procedure Xuli;
 var s,s1:string;
     x,y:qword;
     e,i,a1,a2,e1,e2:longint;
 begin
    assign(f,'CSTC.OUT');
    rewrite(f);
       if a>=100 then
           begin
              str(a,s);
              delete(s,1,length(s)-2);
              val(s,a,e);
           end;
       a1:=99;
       for i:= 1 to 9 do
          begin
             x:=a**i;
             str(x,s);
             delete(s,1,length(s)-2);
             val(s,a2,e1);
             if a1>a2 then
                begin
                   a1:=a2;
                   e:=i;
                end;
          end;
       if b<=9 then
          begin
             x:=a**b;
             str(x,s);
             for i:= length(s)-1 to length(s) do
             write(f,s[i]);
          end
       else
          begin
             a2:=b div e;
             e2:=b mod e;
             x:=a1**a2;
             y:=a**e2;
             str(x,s);
             str(y,s1);
             delete(s,1,length(s)-2);
             delete(s1,1,length(s1)-2);
             val(s,a,e1);
             val(s1,b,e2);
             x:=a*b;
             str(x,s);
             if length(s)=1 then insert('0',s,1);
             for i:= length(s)-1 to length(s) do
                 write(f,s[i]);
          end;
   close(f);
 end;
 begin
    Nhap;
    Xuli;
 end.
