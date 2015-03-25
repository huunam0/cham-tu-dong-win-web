uses crt;
var T:array[0..1,0..100,0..100]of integer;
    s,sdc:string[100];
    min,n,i,x,l:byte;
    s1:array[0..1]of string[100];
    d:array[0..1]of byte;
procedure nhap;
 var i:byte;
 begin
  write('Nhap xau bit: ');
  readln(s);
  s:=s;
  n:=0;
  l:=length(s);
  for i:=1 to l do
   if s[i]='1' then inc(n);
  if l<2*n then
   begin
    writeln(-1);
    readln;
    halt;
   end;
 end;

function max(a,b:integer):integer;
 begin
  if a>b then max:=a else max:=b;
 end;

procedure lap_bang;
 var x,i:byte;
 begin
  T[0,0,0]:=0;
  for i:=1 to l do T[0,0,i]:=(1-ord(s[i])+48)+T[0,0,i-1];
  for i:=1 to n do
   for x:=1 to n do
    if x>i then
     begin
      T[0,x,i]:=-1;
      T[1,x,i]:=-1;
     end;
  for x:=1 to n do
   for i:=x to l do
    begin
     if T[0,x-1,i-1]=-1 then T[1,x,i]:=-1
      else T[1,x,i]:=(ord(s[i])-48)+T[0,x-1,i-1];
     if (i=1)or((T[0,x,i-1]=-1)and(T[1,x,i-1]=-1)) then T[0,x,i]:=-1
      else T[0,x,i]:=(1-ord(s[i])+48)+max(T[0,x,i-1],T[1,x,i-1]);
    end;
 end;

procedure tim(ch:char; k,x,i:byte);
 begin
  insert(ch,s1[k],1);
  if ch<>s[i] then inc(d[k]);
  if i>1 then
   if ch='1' then tim('0',k,x-1,i-1)
   else if T[0,x,i-1]>T[1,x,i-1] then tim('0',k,x,i-1) else tim('1',k,x,i-1);
 end;

procedure lat_nguoc;
 begin
  s1[0]:=''; d[0]:=0;
  s1[1]:=''; d[1]:=0;
  tim('0',0,n,l);
  tim('1',1,n,l);
  if (d[0]<d[1])or((copy(s1[1],1,1)='1')and(copy(s1[1],l,1)='1')) then
   begin
    min:=d[0];
    sdc:=s1[0];
   end
  else
   begin
    min:=d[1];
    sdc:=s1[1];
   end;
  min:=min div 2;
 end;

procedure xuly_in;
 var a,b:byte;
     kt:array[1..100]of boolean;
 begin
  writeln('Doi it nhat ',min,' cho:');
  fillchar(kt,sizeof(kt),true);
  for i:=1 to min do
   begin
    for a:=1 to l do
     if (sdc[a]<>s[a])and(kt[a]) then break;
    kt[a]:=false;
    for b:=a+1 to l do
     if (sdc[b]<>s[b])and(kt[b])and(s[a]<>s[b]) then break;
    kt[b]:=false;
    writeln(a,' ',b);
   end;
  readln;
 end;

begin
 clrscr;
 nhap;
 lap_bang;
 {writeln('T[0]:');
 for x:=1 to n do
  begin
   for i:=1 to l do write(T[0,x,i]:3);
   writeln;
  end;
 writeln('T[1]:');
 for x:=1 to n do
  begin
   for i:=1 to l do write(T[1,x,i]:3);
   writeln;
  end;
 writeln;}
 lat_nguoc;
 xuly_in;
end.