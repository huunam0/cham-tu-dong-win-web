{bai 1-Nguyen Huu Kim}
const f1='docso.inp';
        f2='docso.out';
var     so:array[0..9] of string;
        n:integer;
        f:text;
procedure nhap;
begin
 assign(f,f1); reset(f);
  read(f,n);
 close(f);
  so[0]:='khong';
  so[1]:='mot';
  so[2]:='hai';
  so[3]:='ba';
  so[4]:='bon';
  so[5]:='nam';
  so[6]:='sau';
  so[7]:='bay';
  so[8]:='tam';
  so[9]:='chin';
end;
procedure xuly;
var s:string;
        i,a,b,c,d:integer;
begin
s:='';
  str(n,s);
  if length(s)=1 then  a:=n;
  if length(s)=2  then begin   a:=n div 10;
        b:=n mod 10; end;
  if length(s)=3 then begin a:=n div 100;
        b:=(n mod 100) div 10;
   c:=(n mod 100);      end;
  if length(s)=4 then begin a:=n div 1000;
        b:=(n div 100) mod 10;
   c:=(n mod 100) div 10;
   d:=n mod 10;   end;
case length(s) of
  1: write(f,so[a]);
  2: begin
      if (a=1) then
       begin
        if (b=0) then write(f,'muoi ');
        if b=5 then write(f,'muoi lam ');
        if (b<>0)and(b<>5) then write(f,'muoi ',so[b]);
        end
      else begin
      if b=0 then write(f,so[a],' muoi ');
      if b=5 then write(f,so[a], ' muoi lam ');
      if (b<>0)anD(b<>5) then write(f,so[a],' muoi ',so[b]); end;
     end;
  3: begin
      write(f,so[a],' tram ');
      if (b=0)and(c<>0) then write(f,' linh ',so[c]);
      if (b<>0) then
       begin
        write(f,so[b]);
        if c=0 then write(f,' muoi ')
        else if c=5 then write(f,' muoi lam ')
        else write(f,' muoi ',so[c]);
       end;
  end;
  4: begin write(f,so[a],' nghin ');
       if (b=0)and(c<>0) then
        begin
         if (c<>1) then write(f,' khong tram linh ',so[c]);
         if (c=1)and(d=0) then write(f,' khong tram muoi ');
        end;
       if b<>0 then
        begin
         write(f,so[b],' tram ');
         if (c=0)and(d<>0) then write(f,' linh ',so[d]);
         if c<>0 then
          begin
           if (d<>0)and(d<>5) then write(f,so[c],' muoi ',so[d]);
           if d=0 then write(f,so[c],' muoi ');
           if d=5 then write(f,so[c],' muoi lam ');
          end; end;
     end;  end;
end;
begin
 nhap;
 assign(f,f2); rewrite(f);
  xuly;
 close(f);
end.