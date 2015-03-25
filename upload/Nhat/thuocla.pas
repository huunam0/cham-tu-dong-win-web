 uses crt;
 var a,b:ansistring;
     d:integer;
     f:text;
 Procedure Nhap;
 var i:integer;
 begin
    assign(f,'THUOCLA.INP');
    reset(f);
        readln(f);
        readln(f,a);
        d:=0;
        for i:= 1 to length(a) do
           if a[i]='1' then inc(d);
    close(f);
 end;
 Function Dem(vt:integer;s:ansistring):integer;
 var de,i:integer;
 begin
    writeln('DEM ',vt,' ',s);
	Insert('0',s,vt);
    de:=0;
    for i:= 1 to length(s) do
       if s[i]<>a[i] then inc(de);
    Dem:=de;
 end;
 Procedure Tim(l:integer;var b:ansistring);
 var min,t,i:integer;
     c:ansistring;
 begin
    min:=maxint;c:=b;
    repeat
       i:=1;dec(l);
       for i:= 1 to length(b) do
          if (a[i]='0') and (b[i]='1') then
             begin
                 t:=Dem(i,b);
                 if t<min then
                    begin
                       min:=t;
                       c:=b;
                       insert('0',c,i);
                    end;
             end;
       b:=c;
    until l=0;
 end;
 Procedure Xuli;
 var i,d1,d2,l:integer;
     x,y,kq:ansistring;
     s0,s1:array[1..1000] of integer;
 begin
     assign(f,'THUOCLA.OUT');
     rewrite(f);
        if d>length(a) div 2 then write(f,'Khong the sap xep')
        else
           begin
              x:='';y:='';
              for i:= 1 to d do
                 begin
                    x:=x+'10';
                    y:=y+'01';
                 end;
              l:=length(a)-length(x);
              if l<>0 then
                 begin
                    Tim(l,x);
                    Tim(l,y);
                 end;
              d1:=0;d2:=0;
              for i:= 1 to length(x) do
                 begin
                    if x[i]<>a[i] then inc(d1);
                    if y[i]<>a[i] then inc(d2);
                 end;
              if d1>d2 then
                 begin
                    kq:=y;
                    writeln(f,d2 div 2);
                 end
              else
                 begin
                    kq:=x;
                    writeln(f,d1 div 2);
                 end;
              d1:=0;d2:=0;
              for i:= 1 to length(a) do
                 if a[i]<>kq[i] then
                    if a[i]='1' then
                       begin
                          inc(d1);
                          s1[d1]:=i;
                       end
                    else
                       begin
                          inc(d2);
                          s0[d2]:=i;
                       end;
              for i:= 1 to d1 do
                 writeln(f,s1[i],' ',s0[i]);
           end;
   close(f);
 end;
 begin
    Nhap;
    Xuli;
 end.