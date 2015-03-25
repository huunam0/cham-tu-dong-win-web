 uses crt;
 type th=record
         x,y:integer;
      end;
 var tr:array[0..1000,0..1000] of boolean;
     q:Array[1..10000] of th;
     m,n,k,d,c:integer;
     f:text;
 Procedure Nhap;
 var i:integer;
 begin
    assign(f,'Dongnuoc.inp');
    reset(f);
       fillchar(tr,sizeof(tr),true);
       readln(f,m,n,k);
    close(f);
 end;
 Procedure Them(o,p:integer);
 begin
    inc(c);
    q[c].x:=o;
    q[c].y:=p;
    tr[o,p]:=false;
 end;
 Procedure Xuli;
 var moc,kq:integer;
     v:th;
 begin
    assign(f,'Dongnuoc.out');
    rewrite(f);
       d:=1;c:=1;q[d].x:=0;q[d].y:=0;moc:=1;kq:=-1;
       repeat
          v:=q[d];
          if d=moc then
             begin
                inc(kq);
                moc:=c+1;
             end;
          if (v.x=k) or (v.y=k) then break;
          tr[v.x,v.y]:=false;
          if (v.x=0) and (tr[v.x+m,v.y]) then Them(v.x+m,v.y);
          if (v.y=0) and (tr[v.x,v.y+n]) then Them(v.x,v.y+n);
          if (v.x=m) and (tr[0,v.y]) then Them(0,v.y);
          if (v.y=n) and (tr[v.x,0]) then Them(v.x,0);
          if (v.x>v.y) and (v.x+v.y>=n) and (tr[v.x-n+v.y,n]) then
             Them(v.x-n+v.y,n);
          if (v.x<v.y) and (v.x+v.y>=m) and (tr[m,v.y-m+v.x]) then
             Them(m,v.y-m+v.x);
          if (v.x>v.y) and (v.x+v.y<m) and (tr[0,v.x+v.y]) then
             Them(0,v.x+v.y);
          if (v.x<v.y) and (v.x+v.y<n) and (tr[v.x+v.y,0]) then
             Them(v.x+v.y,0);
          if (v.x<v.y) and (v.x+v.y<=m) and (tr[0,v.x+v.y]) then
             Them(0,v.x+v.y);
          if (v.x>v.y) and (v.x+v.y<=n) and (tr[v.x+v.y,0]) then
             Them(v.x+v.y,0);
          inc(d);
       until d>c;
       write(f,kq);
    close(f);
 end;
 begin
    Nhap;
    Xuli
 end.