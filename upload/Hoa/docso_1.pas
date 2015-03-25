{Bai 1 - Dang Xuan Hoa}
uses crt;
var
        N:integer;
        f1,f:text;

function dem(x:integer):byte;
var
        s:string;
begin
        str(x,s);
        dem:=length(s);
end;

procedure docso;
var a,b:integer;
begin
        if dem(N)=4 then
                begin
                        a:=N div 1000;
                        b:=N mod 1000;
                        case a of
                                1:write(f1,'Mot nghin ');
                                2:write(f1,'Hai nghin ');
                                3:write(f1,'Ba nghin ');
                                4:write(f1,'Bon nghin ');
                                5:write(f1,'Nam nghin ');
                                6:write(f1,'Sau nghin ');
                                7:write(f1,'Bay nghin ');
                                8:write(f1,'Tam nghin ');
                                9:write(f1,'Chin nghin ');
                        end;
                        if dem(b)=2 then write(f1,'khong tram ');
                        if (dem(b)=1)and(b<>0) then write(f1,'khong tram linh ');
                end;
         N:=N mod 1000;
         if dem(N)=3 then
                begin
                        a:=N div 100;
                        case a of
                                1:write(f1,'mot tram ');
                                2:write(f1,'hai tram ');
                                3:write(f1,'ba tram ');
                                4:write(f1,'bon tram ');
                                5:write(f1,'nam tram ');
                                6:write(f1,'sau tram ');
                                7:write(f1,'bay tram ');
                                8:write(f1,'tam tram ');
                                9:write(f1,'chin tram ');
                        end;
                        N:=N mod 100;
                        if (dem(N)=1)and(N<>0) then write(f1,'linh ');
                end;

         b:=N;
         if dem(N)=2 then
                begin
                        a:=N div 10;
                        case a of
                                1:write(f1,'muoi ');
                                2:write(f1,'hai muoi ');
                                3:write(f1,'ba muoi ');
                                4:write(f1,'bon muoi ');
                                5:write(f1,'nam muoi ');
                                6:write(f1,'sau muoi ');
                                7:write(f1,'bay muoi ');
                                8:write(f1,'tam muoi ');
                                9:write(f1,'chin muoi ');
                        end;
                end;
         N:=N mod 10;
         if dem(N)=1 then
                case N of
                         0:write(f1,' ');
                         1:write(f1,'mot ');
                         2:write(f1,'hai ');
                         3:write(f1,'ba ');
                         4:write(f1,'bon ');
                         5:if b=5 then write(f1,'nam ') else
                                write(f1,'lam ');
                         6:write(f1,'sau ');
                         7:write(f1,'bay ');
                         8:write(f1,'tam ');
                         9:write(f1,'chin ');
                end;
end;

BEGIN
        clrscr;
        assign(f,'DOCSO.INP'); reset(f);
        read(f,N);
        close(f);
        assign(f1,'DOCSO.OUT'); rewrite(f1);
        docso;
        close(f1);
END.



