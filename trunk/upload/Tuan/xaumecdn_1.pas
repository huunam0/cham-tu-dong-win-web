Program Bai3;
uses    math;
Var     s1,s2:string;
        t:array[0..101,0..101] of byte;
        v1,v2:array[0..100] of byte;
        re,nv,i,j:byte;
        f:Text;
Begin
        Assign(f,'XAUMECDN.INP');
        reset(f);
        readln(f,s1);
        readln(f,s2);
        Close(f);
        fillchar(t,sizeof(t),0);
        For i:=1 to length(s1) do
          For j:=1 to length(s2) do
            If s1[i]=s2[j] then t[i,j]:=t[i-1,j-1]+1 else
              t[i,j]:=max(t[i-1,j],t[i,j-1]);
        i:=length(s1);
        j:=length(s2);
        nv:=t[i,j];
        re:=nv;
        repeat
          If s1[i]=s2[j] then
            Begin
              v1[nv]:=i;
              v2[nv]:=j;
              dec(nv);
              dec(i);
              dec(j);
            End
          else if t[i-1,j]>t[i,j-1] then dec(i) else dec(j);
        until t[i,j]=0;
        v1[0]:=0;
        v2[0]:=0;
        inc(re);
        v1[re]:=length(s1)+1;
        v2[re]:=length(s2)+1;
        For i:=re downto 1 do
          Begin
            insert(copy(s2,v2[i-1]+1,v2[i]-1-v2[i-1]),s1,v1[i]-1);
            insert(copy(s1,v1[i-1]+1,v1[i]-1-v1[i-1]),s2,v2[i]-1);
          End;
        ASsign(f,'XAUMECDN.OUT');
        rewrite(f);
        writeln(f,length(s1));
        write(f,s1);
        Close(f);
End.