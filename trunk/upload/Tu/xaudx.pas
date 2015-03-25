        {BAI 4-NGUYEN HUU TU}
uses crt;
var     s:string;
        f,f1:text;
        a:array[1..100,1..100] of integer;
procedure nhapdulieu;
var     f:text;
begin
        assign(f,'XAUDX.INP');
        reset(f);
        readln(f,s);
        close(f);
        assign(f1,'XAUDX.OUT');
        rewrite(f1);
end;

procedure work1;
var      i,j,k:integer;
begin
        for i:=1 to length(s) do
                for j:=1 to i do
                        a[i,j]:=0;
        for k:=2 to length(s) do
                for i:=1 to length(s)+1-k do
                   begin
                        j:=i+k-1;
                        if s[i]=s[j] then
                                a[i,j]:=a[i+1,j-1]
                        else
                                if a[i,j-1]<a[i+1,j] then
                                        a[i,j]:=a[i,j-1]+1
                                else
                                        a[i,j]:=a[i+1,j]+1;
                   end;
        {for i:=1 to length(s) do
           begin
                for j:=1 to length(s) do
                        write(f,a[i,j],' ');
                writeln(f1);
             end;}
end;

function xau(x,y:integer):string;
begin
        if x=y then
                xau:=s[x]
        else
                if x<y then
                        if s[x]=s[y] then
                                xau:=s[x]+xau(x+1,y-1)+s[y]
                        else
                                if a[x,y]=a[x,y-1]+1 then
                                        xau:=s[y]+xau(x,y-1)+s[y]
                                else
                                        xau:=s[x]+xau(x+1,y)+s[x];
end;

BEGIN
        nhapdulieu;
        work1;
        //writeln(f1,xau(1,length(s)));
        write(f1,'so ki tu can them:',length(xau(1,length(s)))-length(s));
        close(f1);
END.