Program Hothuyloi;
uses    crt;
Var     m,n,k:integer;
        a:array[1..100,1..100] of integer;
        fr:array[1..100,1..100] of boolean;
Procedure Doc;
Var     f:text;
        i,j:integer;
Begin
        assign(f,'HONUOC.INP');
        reset(f);
        readln(f,m,n,k);
        For i:=1 to m do
          Begin
            For j:=1 to n do read(f,a[i,j]);
            readln(f);
          End;
        Close(f);
end;
Procedure l(i,j,g:integer);
Begin
        If a[i,j]<g then
          Begin
            fr[i,j]:=true;
            If i=m-1 then exit;
            If (i>1) and (fr[i-1,j]=false) then l(i-1,j,g);
            If (i<m-1) and (fr[i+1,j]=false) then l(i+1,j,g);
            If (j>1) and (fr[i,j-1]=false) then l(i,j-1,g);
            If (j<n) and (fr[i,j+1]=false) then l(i,j+1,g);
          End;
End;
Procedure Xuli;
Var     i,j,h,d,c:integer;
        f:text;
Begin
        d:=0;
        For h:=a[m,1]-1 downto 0 do
          Begin
            For i:=1 to m-1 do
              For j:=1 to n do
                Begin
                  If a[i,j]<h+1 then
                    Begin
                      Fillchar(fr,sizeof(fr),false);
                      l(i,j,h+1);
                      For c:=1 to n do
                        If fr[m-1,c] then
                          Begin
                            inc(d);
                            break;
                          End;
                    End;
                End;
            If d>=k then break;
          End;
        Assign(f,'HONUOC.OUT');
        rewrite(f);
        write(f,a[m,1]-h,' ',d);
        Close(f);
end;
Begin
        Doc;
        Xuli;
End.