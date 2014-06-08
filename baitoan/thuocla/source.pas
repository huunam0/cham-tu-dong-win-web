program buatiec;

{$mode objfpc}{$H+}
const
  max_n = 200;
var
    s,p,p0:string;
    T : array[0..1, 0..max_n, 0..max_n] of integer;
    sl1 : byte;
    n,l : byte;
    ss,ss2:byte;
function csnp(const c: char): byte;
begin
    if c='1' then
        exit(1)
    else
        exit(0);
end;
function csnguoc(const c: char): byte;
begin
    if c='0' then
        exit(1)
    else
        exit(0);
end;
function demso1(const s : string) : byte;
var i, sl: byte;
begin
    sl:=0;
    for i:= 1 to length(s) do
        if s[i]='1' then inc(sl);
    exit(sl);
end;
function Max(x,y : integer) : integer;
begin
    if x>y then
        exit(x)
    else
        exit(y);
end;
function sosanhxau(const s1,s2 : string):byte;
var i,sl : byte;
begin
    //writeln('SO SANH XAU');
    //writeln('* ',s1);
    //writeln('* ',s2);
    sl:=0;
    for i:= 1 to length(s1) do
        if s1[i]<>s2[i] then inc(sl);
    //writeln('SAI KHAC ',sl,' vi tri.');
    exit(sl);
end;
procedure tinhtoan;
var x, i : byte;
begin
    fillchar(T, sizeof(T),0);
    T[0,0,1] := csnguoc(S[1]);
    for i:= 2 to l do
        T[0,0,i]:= csnguoc(S[i])+T[0,0,i-1];
    for x:=1 to n do begin
      for i:= 1 to l do begin
        if x>i then
            T[1,x,i]:=-1
        else
            if T[0,x-1,i-1]>=0 then
                T[1,x,i]:=T[0,x-1,i-1] + csnp(S[i])
            else
                T[1,x,i]:= -1;
        if (i=1) or ((T[0,x,i-1]<0) and (T[1,x,i-1]<0)) then
            T[0,x,i]:=-1
        else
            T[0,x,i]:= csnguoc(S[i])+Max(T[0,x,i-1],T[1,x,i-1]);
      end;
    end;
end;
procedure vietmang;
var x,i:byte;
begin
    writeln('Mang gia tri - T 0 ');
    for x:= 1 to n do begin
      for i:= 1 to l do write(T[0,x,i]:4);
      writeln;
    end;
    writeln('Mang gia tri - T 1 ');
    for x:= 1 to n do begin
      for i:= 1 to l do write(T[1,x,i]:4);
      writeln;
    end;
end;
procedure lannguoc(b,x,i : byte);
begin
    //writeln(b:5,x:5,i:5, T[b,x,i]:5);
    p:=chr(48+b)+p;
    if i>1 then begin
      if b=1 then
          lannguoc(0,x-1,i-1)
      else  begin
          if T[1,x,i-1]>=T[0,x,i-1] then
              lannguoc(1,x,i-1)
          else
              lannguoc(0,x,i-1);
      end;
    end;
end;

procedure nhapdulieu;
begin
    //s:='10111101010000';
    write('Nhap xau: ');
    readln(s);
    s:=s+S[1];
    l:= length(s);
    n:= demso1(s);
    //writeln(n:5,l:5);
end;
procedure timpa;
var i,j:byte;
begin
    writeln('Doi cho it nhat ',(l-ss-1) div 2,' vi tri:');
    for i:= 1 to l do
        if (s[i]='1') and (p[i]='0') then
            for j:= 1 to l do
                if (s[j]='0') and (p[j]='1') then begin
                    p[j]:='0';
                    writeln('Doi cho: ',i,' ',j);
                    break;
                end;
end;


begin
   nhapdulieu;
   tinhtoan;
   //vietmang;
   p:='';
   lannguoc(0,n,l);
   //writeln('Tim duoc: ',p);
   ss:=sosanhxau(s,p);
   p0:=p;
   p:='';
   lannguoc(1,n,l);
   //writeln('Tim duoc: ',p);
   ss2:=sosanhxau(s,p);
   if ss=ss2 then begin
       if p0[1]=p0[l] then
           p:=p0;
   end
   else if ss<ss2 then
       p:=p0;
   timpa;
   readln;
end.




