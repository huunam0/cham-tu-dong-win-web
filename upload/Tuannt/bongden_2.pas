Program Bai2;
Var     i,j,n,d,c:longint;
        q:array[1..1000000] of ansistring;
        s:array[1..4] of ansistring;
        fr:array[1..4] of boolean;
        f:text;
        b:char;
Begin
        Assign(f,'BONGDEN.INP');
        reset(f);
        readln(f,q[1]);
        Close(f);
        d:=0;
        c:=1;
        Assign(f,'BONGDEN.OUT');
        rewrite(f);
        repeat
          inc(d);
          writeln(f,q[d]);
          For i:=1 to 4 do s[i]:='';
          For i:=1 to length(q[d]) do
              Begin
                If q[d][i]='1' then b:='0' else b:='1';
                s[1]:=s[1]+b;
                If i mod 2=0 then s[2]:=s[2]+b else s[2]:=s[2]+q[d][i];
                If i mod 2=1 then s[3]:=s[3]+b else s[3]:=s[3]+q[d][i];
                If (i-1) mod 3=0 then s[4]:=s[4]+b else s[4]:=s[4]+q[d][i];
              End;
          Fillchar(fr,sizeof(fr),true);
          For i:=1 to 3 do
            For j:=i+1 to 4 do
              If s[i]=s[j] then fr[j]:=false;
          For i:=c downto 1 do
            For j:=4 downto 1 do
              If s[j]=q[i] then fr[j]:=false;
          For i:=1 to 4 do
            If fr[i] then
              Begin
                inc(c);
                q[c]:=s[i];
              End;
        Until d>=c;
        Close(f);
End.
