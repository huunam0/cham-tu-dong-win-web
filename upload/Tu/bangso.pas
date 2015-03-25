        {BAI 3-NGUYEN HUU TU}
uses crt;
var a:array[1..1000] of integer;
    n,s,dem,max,giatri:integer;

procedure nhapdulieu;
var     f:text;
        i:integer;
begin
        assign(f,'BANGSO.INP');
        reset(f);
        readln(f,n);
        max:=0;
        giatri:=0;
        for i:=1 to n do
                read(f,a[i]);
        close(f);
end;

procedure work1;
var  i,x,y,j:integer;
     kt,t:boolean;
begin
        s:=0;
        t:=true;
        for i:=1 to n do
                inc(s,a[i]);
        for i:=2 to s-1 do
            begin
                if s mod i=0 then
                   begin
                        dem:=0;
                        kt:=false;
                        for j:=1 to n do
                                if a[j]>(s div i) then
                                        begin
                                                kt:=true;
                                                break;
                                        end;
                        if kt=false then
                                begin
                                        y:=0;
                                        for x:=1 to n do
                                           begin
                                                inc(y,a[x]);
                                                if y= s div i then
                                                        begin
                                                                inc(dem);
                                                                y:=0;
                                                        end;
                                                if y > (s div i) then
                                                        begin
                                                                break;
                                                                t:=true;
                                                        end
                                                else
                                                   begin
                                                        if max<dem then
                                                                begin
                                                                        max:=dem;
                                                                        giatri:=s div i;
                                                                end;
                                                   end;
                                           end;
                                end;

                   end;
            end
end;

procedure xuat;
var     f:text;
begin
        assign(f,'BANGSO.OUT');
        rewrite(f);
        writeln(f,'so doan:',max,' gia tri:',giatri);
        close(f);
end;

BEGIN
        nhapdulieu;
        work1;
        xuat;
END.