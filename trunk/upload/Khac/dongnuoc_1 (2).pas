Var     l,x,y,k,d,c:byte;
        q:array[1..10201,0..2] of byte;
        fr:array[0..100,0..100] of boolean;
        f:Text;
Begin
        Assign(f,'DONGNUOC.INP');
        reset(f);
        read(f,x,y,k);
        Close(f);
        d:=0;
        c:=1;
        fillchar(fr,sizeof(fr),true);
        q[1,1]:=0;
        q[1,0]:=0;
        q[1,2]:=0;
        fr[0,0]:=false;
        repeat
          inc(d);
          If (q[d,0]=k) or (q[d,1]=k) then break;
          If fr[x,q[d,1]] then
            Begin
              inc(c);
              q[c,0]:=x;
              q[c,1]:=q[d,1];
              q[c,2]:=q[d,2]+1;
              fr[x,q[d,1]]:=false;
            End;
          If fr[q[d,0],y] then
            Begin
              inc(c);
              q[c,0]:=q[d,0];
              q[c,1]:=y;
              q[c,2]:=q[d,2]+1;
              fr[q[d,0],y]:=false;
            End;
          If fr[0,q[d,1]] then
            Begin
              inc(c);
              q[c,0]:=0;
              q[c,1]:=q[d,1];
              q[c,2]:=q[d,2]+1;
              fr[0,q[d,1]]:=false;
            End;
          If fr[q[d,0],0] then
            Begin
              inc(c);
              q[c,0]:=q[d,0];
              q[c,1]:=0;
              q[c,2]:=q[d,2]+1;
              fr[q[d,0],0]:=false;
            End;
          If q[d,0]>y-q[d,1] then l:=y-q[d,1] else l:=q[d,0];
          If (q[d,0]>0) and (q[d,1]<y) and (fr[q[d,0]-l,q[d,1]+l]) then
            Begin
              inc(c);
              q[c,0]:=q[d,0]-l;
              q[c,1]:=q[d,1]+l;
              q[c,2]:=q[d,2]+1;
              fr[q[d,0]-l,q[d,1]+l]:=false;
            End;
          If q[d,1]>x-q[d,0] then l:=x-q[d,0] else l:=q[d,1];
          If (q[d,1]>0) and (q[d,0]<x) and (fr[q[d,0]+l,q[d,1]-l]) then
            Begin
              inc(c);
              q[c,0]:=q[d,0]+l;
              q[c,1]:=q[d,1]-l;
              q[c,2]:=q[d,2]+1;
              fr[q[d,0]+l,q[d,1]-l]:=false;
            End;
        until (d>=c) or (false);
        Assign(f,'DONGNUOC.OUT');
        rewrite(f);
        If (q[d,0]=k) or (q[d,1]=k) then write(f,q[d,2]) else write(f,-1);
        Close(f);
End.
