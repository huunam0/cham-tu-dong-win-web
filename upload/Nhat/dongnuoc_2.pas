 uses crt;
 type th=record
         x,y:integer;
      end;
 var tr:array[0..1000,0..1000] of boolean;
     q:Array[1..10000] of th;
     m,n,k,d,c,moc,kq:integer;
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
 Procedure Xuli;
 var v:th;
     d,c,moc,kq:integer;
 begin
    assign(f,'Dongnuoc.out');
    rewrite(f);
       fillchar(q,sizeof(q),0);
       d:=1;c:=1;q[d].x:=0;q[d].y:=0;moc:=1;kq:=-1;
       tr[q[d].x,q[d].y]:=false;
       repeat
          v:=q[d];
          if d=moc then
             begin
                inc(kq);
                moc:=c+1;
             end;
          if (v.x=k) or (v.y=k) then break;
          tr[v.x,v.y]:=false;
          if (v.x<m) and (tr[v.x+m,v.y]) then
             begin
                inc(c);
                q[c].x:=m;
                q[c].y:=v.y;
                tr[m,v.y]:=false;
             end;
          if (v.y<n) and (tr[v.x,v.y+n]) then
             begin
                inc(c);
                q[c].y:=n;
                q[c].x:=v.x;
                tr[v.x,n]:=false;
             end;
          if (v.x=m) and (tr[0,v.y]) then
             begin
                inc(c);
                q[c].x:=0;
                q[c].y:=v.y;
                tr[0,v.y]:=false;
             end;
          if (v.y=n) and (tr[v.x,0]) then
             begin
                inc(c);
                q[c].x:=v.x;
                q[c].y:=0;
                tr[v.x,0]:=false;
             end;
          if (v.x>=v.y) and (v.x+v.y>=n) and (tr[v.x-n+v.y,n]) then
             begin
                inc(c);
                q[c].x:=v.x-n+v.y;
                q[c].y:=n;
                tr[q[c].x,q[c].y]:=false;
             end;
          if (v.x<=v.y) and (v.x+v.y>=m) and (tr[m,v.y-m+v.x]) then
             begin
                inc(c);
                q[c].x:=m;
                q[c].y:=v.y-m+v.x;
                tr[q[c].x,q[c].y]:=false;
             end;
          if (v.x>=v.y) and (v.x+v.y<n) and (tr[0,v.x+v.y]) then
             begin
                inc(c);
                q[c].x:=0;
                q[c].y:=v.x+v.y;
                tr[0,v.x+v.y]:=false;
             end;
          if (v.x<=v.y) and (v.x+v.y<m) and (tr[v.x+v.y,0]) then
             begin
                inc(c);
                q[c].x:=v.x+v.y;
                q[c].y:=0;
                tr[q[c].x,q[c].y]:=false;
             end;
          if (v.x<=v.y) and (v.x+v.y<=n) and (tr[0,v.x+v.y]) then
             begin
                inc(c);
                q[c].x:=0;
                q[c].y:=v.x+v.y;
                tr[q[c].x,q[c].y]:=false;
             end;
          if (v.x>=v.y) and (v.x+v.y<=m) and (tr[v.x+v.y,0]) then
             begin
                inc(c);
                q[c].x:=v.x+v.y;
                q[c].y:=0;
                tr[q[c].x,q[c].y]:=false;
             end;
          inc(d);
       until d>c;
       write(f,kq);
    close(f);
 end;
 begin
    Nhap;
    Xuli
 end.
