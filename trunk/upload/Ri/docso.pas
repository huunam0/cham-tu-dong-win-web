{Ngo Van Ri lop 10a1}
program docso;
uses crt;
var n:integer;
    f,f1:text;
    s:array[1..4] of string;
procedure docfile;
begin
     assign(f, 'docso.inp');
     reset(f);
     assign(f1, 'docso.out');
     rewrite(f1);
     readln(f, n);
     close(f);
end;

procedure xuli;
var a,b,c,d,i,j:integer;
    s1:string;
begin
        a:=N div 1000;
        b:=(N div 100) mod 10;
        c:=(N div 10) mod 10;
        d:=N mod 10;
        j:=0;
        case a of
        1: s[1]:='mot nghin ';
        2: s[1]:='hai nghin ';
        3: s[1]:='ba nghin ';
        4: s[1]:='bon nghin ';
        5: s[1]:='nam nghin ';
        6: s[1]:='sau nghin ';
        7: s[1]:='bay nghin ';
        8: s[1]:='tam nghin ';
        9: s[1]:='chin nghin';
        end;
        case b of
        1: s[2]:='mot tram ';
        2: s[2]:='hai tram ';
        3: s[2]:='ba tram ';
        4: s[2]:='bon tram ';
        5: s[2]:='nam tram ';
        6: s[2]:='sau tram ';
        7: s[2]:='bay tram ';
        8: s[2]:='tam tram ';
        9: s[2]:='chin tram '
                else if a<>0 then if (c<>0) or (d<>0) then s[2]:='khong tram ';
        end;
        case c of
        1: s[3]:='muoi ';
        2: s[3]:='hai muoi ';
        3: s[3]:='ba muoi ';
        4: s[3]:='bon muoi ';
        5: s[3]:='nam muoi ';
        6: s[3]:='sau muoi ';
        7: s[3]:='bay muoi ';
        8: s[3]:='tam muoi ';
        9: s[3]:='chin muoi '
                else
                        begin
                        if (b<>0) and (d<>0) then s[3]:='linh ';
                        if  (a<>0) and (b=0) and (d<>0) then s[3]:='linh ';
                        end;
        end;
        case d of
        1: s[4]:='mot ';
        2: s[4]:='hai ';
        3: s[4]:='ba  ';
        4: s[4]:='bon ';
        6: s[4]:='sau ';
        7: s[4]:='bay ';
        8: s[4]:='tam ';
        9: s[4]:='chin '
                else if (d=5) and (c<>0) then s[4]:='lam'
                        else if (d=5) and (c=0) then s[4]:='nam';
        end;
        if (a=0) and (b=0) and (c=0) and (d=0) then write('Khong')
                else for i:=1 to 4 do
                         begin
                                if (j=0) and (s[i]<>'') then
                                        begin
                                        s1:=s[i];
                                        s1[1]:=chr(ord(s1[1])-32);
                                        s[i]:=s1;
                                        inc(j);
                                        end;
                                if s[i]<>'' then write(f1, s[i]);
                         end;
end;

begin
        clrscr;
        docfile;
        xuli;
        close(f1);
        readln
end.
