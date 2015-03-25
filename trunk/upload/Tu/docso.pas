        {BAI 1-NGUYEN HUU TU}
uses crt;
var n:integer;

procedure nhapdulieu;
var f : text;
begin
        assign(f,'DOCSO.INP');
        reset(f);
        readln(f,n);
        close(f);
end;
function demso(n,c:integer):integer;
var dem:integer;
begin
        dem:=c;
        while n >0 do
                begin
                        inc(dem);
                        n:=n div 10;
                end;
        demso:=dem;
end;

procedure work;
var  f:text;
     c,m:integer;
begin
        assign(f,'DOCSO.OUT');
        rewrite(f);
        if n=0 then
                begin
                        write('khong ');
                        exit;
                end;
        c:=0;
        m:=demso(n,c);
        if demso(n,c)=4 then
        case    n div 1000 of
                1: write(f,'mot nghin ');
                2: write(f,'hai nghin ');
                3: write(f,'ba nghin ');
                4: write(f,'bon nghin ');
                5: write(f,'nam nghin ');
                6: write(f,'sau nghin ');
                7: write(f,'bay nghin ');
                8: write(f,'tam nghin ');
                9: write(f,'chin nghin ');
        end;
        c:=0;
        if m=4 then
                begin
                        n:=n mod 1000;
                        if demso(n,c)<>3 then
                                c:=3-demso(n,c);
                end
        else
                c:=0;
        if demso(n,c)=3 then
        case    n div 100 of
                0: if m=4 then
                        if n mod 10 <>0 then
                                write(f,'khong tram ')
                   else
                        write(f,'');
                1: write(f,'mot tram ');
                2: write(f,'hai tram ');
                3: write(f,'ba tram ');
                4: write(f,'bon tram ');
                5: write(f,'nam tram ');
                6: write(f,'sau tram ');
                7: write(f,'bay tram ');
                8: write(f,'tam tram ');
                9: write(f,'chin tram ');
        end;
        m:=demso(n,c);
        c:=0;
        if m=3 then
                begin
                        n:=n mod 100;
                        if demso(n,c)<>2 then
                                c:=2-demso(n,c);
                end
        else
                begin
                n:=n mod 100;
                c:=0;
                end;
        if demso(n,c)=2 then
        case    n div 10 of
                0: if n mod 10 = 0 then
                        write(f,'')
                   else
                        write(f,'linh ');
                1: write(f,'muoi ');
                2: write(f,'hai muoi ');
                3: write(f,'ba muoi ');
                4: write(f,'bon muoi ');
                5: write(f,'nam muoi ');
                6: write(f,'sau muoi ');
                7: write(f,'bay muoi ');
                8: write(f,'tam muoi ');
                9: write(f,'chin muoi ');
        end;
        c:=0;
        if demso(n mod 10,c)=1 then
        case    n mod 10 of
                0: write(f,'');
                1: write(f,'mot');
                2: write(f,'hai ');
                3: write(f,'ba ');
                4: write(f,'bon ');
                5: if n div 10 <>0 then
                        write(f,'lam ')
                   else
                        write(f,'nam ');
                6: write(f,'sau ');
                7: write(f,'bay ');
                8: write(f,'tam ');
                9: write(f,'chin ');
        end;
        close(f);
end;

BEGIN
        nhapdulieu;
        work;
END.