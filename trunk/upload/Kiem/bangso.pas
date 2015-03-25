{Bai 3 - Nguyen Van Kiem}
uses crt;
var f:text;
    mp:array[0..100,0..100]of word;
    mg:array[1..100]of word;
    n,i,s,kq,d:word;
    xong:boolean;
procedure doc_dl;
 var i:word;
 begin
  assign(f,'bangso.inp');
  reset(f);
  readln(f,n);
  s:=0;
  for i:=1 to n do
   begin
    read(f,mg[i]);
    s:=s+mg[i];
   end;
  close(f);
 end;
procedure taobang;
 var i,j:word;
 begin
  fillchar(mp,sizeof(mp),0);
  for i:=1 to n do
   for j:=i to n do mp[i,j]:=mp[i,j-1]+mg[j];
 end;
procedure xuat_kq;
 begin
  assign(f,'bangso.out');
  rewrite(f);
  writeln(f,d,' ',kq);
  close(f);
  xong:=true;
 end;
procedure xuly(x:word);
 var j:word;
 begin
  inc(d);
  for j:=x to n do
   begin
    if mp[x,j]=kq then
     if j=n then xuat_kq else xuly(j+1);
    if xong then exit;
    if mp[x,j]>kq then break;
   end;
  dec(d);
 end;
begin
 xong:=false;
 doc_dl;
 taobang;
 d:=1;
 for i:=1 to n do
  begin
   if xong then break;
   kq:=mp[1,i];
   xuly(i+1);
  end;
end.