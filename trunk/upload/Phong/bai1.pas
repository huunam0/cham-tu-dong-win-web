{ho van phong }
program bai1;
uses crt;
var f:text;
    n:word;
procedure doc;
begin
        assign(f,'docso.inp');
        reset(f);
        readln(f,n);
        close(f);
end;
function c(g,h:byte):string;
begin
        case g of
        1:if h<>2 then c:=' mot'else c:='';
        2:c:=' hai';
        3:c:=' ba';
        4:c:=' bon';
        5:if h=1 then c:=' nam' else c:=' lam';
        6:c:=' sau';
        7:c:=' bay';
        8:c:=' tam';
        9:c:=' chin';
        0:c:=' khong';
        end;
end;

procedure xuli;
var s:string;
    a:array[-4..4] of byte;
    i,j,m:word;
begin
    fillchar(a,sizeof(a),0);
    m:=1;
    if (n>9) and (n<100) then m:=2;
    if (n>99) and (n<1000) then m:=3;
    if n>999 then m:=4;
    for i:=1 to m do
        begin
                a[i]:=n mod 10;
                n:=n div 10;
        end;
        s:='';
    if (a[m]<>0) and (a[m-1]=0) and (a[m-2]=0) and (a[m-3]=0) then
        case m of
        1:s:=c(a[m],1);
        2:if a[m]=1 then s:='muoi' else s:=c(a[m],1) + ' muoi';
        3:s:=c(a[m],1)+' tram';
        4:s:=c(a[m],1)+' nghin';
        end
    else
        begin
                case m of
                1:s:=c(a[m],1);
                2: begin
                        if a[m]=1 then s:=s+' muoi'+c(a[1],0)
                        else
                        s:=s+c(a[m],1)+ ' muoi' + c(a[1],0);
                   end;
                3:begin
                        s:=s+c(a[m],1)+' tram';
                         if (a[2]=1) and (a[1]<>0) then s:=s+' muoi'+c(a[1],0)
                         else
                        if a[2]=0 then s:=s+' linh'+c(a[1],1)
                        else if a[1]<>0 then s:=s+c(a[2],1)+' muoi'+c(a[1],0)
                        else s:=s+c(a[2],2)+' muoi';
                end;
                4:begin
                        s:=s+c(a[m],1)+' nghin';
                        if a[3]=0 then s:=s+' khong'+' tram'
                        else s:=s+c(a[m],1)+' tram';
                         if (a[2]=1) and (a[1]<>0) then s:=s+' muoi'+c(a[1],0)
                         else
                           if a[2]=0 then s:=s+' linh'+c(a[1],1)
                           else if a[1]<>0 then s:=s+c(a[2],1)+' muoi'+c(a[1],0)
                        else s:=s+c(a[2],2)+' muoi';
                end;
        end;
        end;
        assign(f,'docso.out');
        rewrite(f);
        write(f,s);
        close(f);
    end;
begin
        doc;
        xuli;
end.
