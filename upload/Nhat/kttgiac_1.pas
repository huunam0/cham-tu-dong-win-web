 uses crt;
 const min=0.0001;
 type diem=record
         x,y:real;
      end;
 var a:array[1..3] of diem;
     f:text;
 Procedure Nhap;
 var i:integer;
 begin
    assign(f,'KTTGIAC.inp');
    reset(f);
       for i:= 1 to 3 do
          with a[i] do
             readln(f,x,y);
    close(f);
 end;
 Function Kt:boolean;
 var a1,b1,a2,b2,t:real;
 begin
    a1:=a[2].x-a[1].x;
    b1:=a[2].y-a[1].y;
    a2:=a[3].x-a[2].x;
    b2:=a[3].y-a[2].y;
    t:=a1*b2-a2*b1;
    if abs(t)<min then kt:=false
    else kt:=true;
 end;
 Function Chuvi:real;
 var d1,d2,d3:real;
 begin
    d1:=sqrt(sqr(a[1].x-a[2].x)+sqr(a[1].y-a[2].y));
    d2:=sqrt(sqr(a[2].x-a[3].x)+sqr(a[2].y-a[3].y));
    d3:=sqrt(sqr(a[3].x-a[1].x)+sqr(a[3].y-a[1].y));
    Chuvi:=d1+d2+d3;
 end;
 Function Dt:real;
 var i:byte;
 begin
    dt:=(a[1].x+a[2].x)*(a[1].y-a[2].y);
    dt:=dt+(a[2].x+a[3].x)*(a[2].y-a[3].y);
    dt:=dt+(a[3].x-a[1].x)*(a[3].y-a[1].y);
    dt:=1/2*abs(dt);
 end;
 Procedure Xuat;
 begin
    assign(f,'KTTGIAC.out');
    rewrite(f);
       if Kt then write(f,Chuvi:0:3,' ',dt:0:3)
       else write(f,0);
    close(f);
 end;
 begin
    Nhap;
    Xuat;
 end.