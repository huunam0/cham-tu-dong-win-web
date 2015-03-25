uses crt;
var     s,st,st1,st2:string;
        n,d,d1,dem,i,j,dem1,max1,max2,lon:integer;
        T0,T1:array[0..100,0..100] of integer;
        a,b,c1,c2,c:array[1..100] of string;

procedure       nhap;
var     i:integer; F : text;
begin
        assign(f,'thuocla.inp');
		reset(f);
		readln(f);
		//write('nhap xau:');
        readln(f,s);
		close(f);
        dem:=0; d:=0; dem1:=0; st:=''; st1:=''; max1:=0; max2:=0;
        for i:=1 to length(s) do
                begin
                        a[i]:='';
                        b[i]:='';
                        c1[i]:='';
                        c2[i]:='';
                end;
        s:=s+s[1];
        n:=0;
        for i:=1 to length(s) do
                if s[i]='1' then
                        inc(n);
end;

function        max(a,b:integer):integer;
begin
        if a>b then
                max:=a
        else
                max:=b;
end;
function        cong1(ch:char):byte;
begin
        if ch='1' then
                cong1:=0
        else
                cong1:=1;
end;
function        cong2(ch:char):byte;
begin
        if ch='1' then
                cong2:=1
        else
                cong2:=0;
end;

procedure tinh_T;
var     x,i:integer;
begin
        T0[0,0]:=0;
        for i:=1 to length(s) do
                T0[0,i]:=cong1(s[i])+T0[0,i-1];
        for i:=1 to n-1 do
                for x:=1 to n do
                        if x>i then
                                begin
                                        T0[x,i]:=-1;
                                        T1[x,i]:=-1;
                                end;
        for x:=1 to n do
                for i:=x to length(s) do
                        begin
                                if T0[x-1,i-1]=-1 then
                                        T1[x,i]:=-1
                                else
                                        T1[x,i]:=cong2(s[i])+T0[x-1,i-1];
                                if (i=1)or((T0[x,i-1]<0)and(T1[x,i-1]<0)) then
                                        T0[x,i]:=-1
                                else
                                        T0[x,i]:=cong1(s[i])+max(T0[x,i-1],T1[x,i-1]);
                        end;
        writeln('T0:');
        for x:=1 to n do
           begin
                for i:=1 to length(s) do
                        write(T0[x,i]:5);
                writeln;
           end;
        writeln('T1:');
        for x:=1 to n do
                begin
                        for i:=1 to length(s) do
                                write(T1[x,i]:5);
                        writeln;
                end;
end;

function       lat_nguoc(ch:char; a,b:integer):string;
begin
        lat_nguoc:='';
        if ch='1' then
                begin
                        lat_nguoc:=ch+lat_nguoc;
                        if (a-1>=0)and(b-1>0) then
                                lat_nguoc:=lat_nguoc('0',a-1,b-1)+lat_nguoc;
                end
        else
                begin
                        lat_nguoc:=ch+lat_nguoc;
                        if b-1>0 then
                                if T0[a,b-1]>T1[a,b-1] then
                                        lat_nguoc:=lat_nguoc('0',a,b-1)+lat_nguoc
                                else
                                        if T0[a,b-1]<=T1[a,b-1] then
                                                lat_nguoc:=lat_nguoc('1',a,b-1)+lat_nguoc
                                        else
                                                lat_nguoc:=lat_nguoc('1',a,b-1)+lat_nguoc;
                end;
end;

BEGIN
        clrscr;
        nhap;
        writeln('xau s sau khi them :',s);
        writeln('so luong so 1:',n);
        tinh_T;
        if (T0[n,length(s)]-T1[n,length(s)])>=2 then
                st:=lat_nguoc('0',n,length(s))
        else
                if (T1[n,length(s)]-T0[n,length(s)])>=2 then
                        st:=lat_nguoc('1',n,length(s))
        else
                begin
                        st:=lat_nguoc('0',n,length(s));
                        st1:=lat_nguoc('1',n,length(s));
                end;
        writeln('st:',st);      writeln('st1:',st1);
        if st<>'' then
                begin
                        st2:=st;
                        delete(st2,length(st2),1);
                        //if (st2[1]<>st2[length(st2)])or((st2[1]='0')and(st2[length(st2)]=st2[1])) then
                        for i:=1 to length(s)-1 do
                                if s[i]<>st2[i] then
                                        begin
                                                d:=i;
                                                a[d]:=s[i];
                                        end;
                        st2:=st;
                        delete(st2,1,1);
                        //if (st2[1]<>st2[length(st2)])or((st2[1]='0')and(st2[length(st2)]=st2[1])) then
                        for i:=1 to length(st2) do
                                if s[i]<>st2[i] then
                                        begin
                                                d1:=i;
                                                b[d1]:=s[i];
                                        end;
                        dem:=0;         dem1:=0;
                        for i:=1 to d do
                                if (a[i]<>'') then
                                        inc(dem);
                        for i:=1 to d1 do
                                if (b[i]<>'') then
                                        inc(dem1);
                        if (dem div 2)<=(dem1 div 2) then
                                begin
                                        max1:=dem div 2;
                                        for i:=1 to d do
                                                c1[i]:=a[i];
                                end
                        else
                                begin
                                        max1:=dem1 div 2;
                                        for i:=1 to d1 do
                                                c1[i]:=b[i];
                                end;
                end;
        for i:=1 to 100 do
                begin
                        a[i]:='';
                        b[i]:='';
                end;
        d:=0;
        d1:=0;
        if st1<>'' then
                begin
                        st2:=st1;
                        delete(st2,length(st2),1);
                        //if (st2[1]<>st2[length(st2)])or((st2[1]='0')and(st2[length(st2)]=st2[1])) then
                        for i:=1 to length(s)-1 do
                                if s[i]<>st2[i] then
                                        begin
                                                d:=i;
                                                a[d]:=s[i];
                                        end;
                        st2:=st1;
                        delete(st2,1,1);
                        //if (st2[1]<>st2[length(st2)])or((st2[1]='0')and(st2[length(st2)]=st2[1])) then
                        for i:=1 to length(st2) do
                                if s[i]<>st2[i] then
                                        begin
                                                d1:=i;
                                                b[d1]:=s[i];
                                        end;
                        dem:=0;         dem1:=0;
                        for i:=1 to d do
                                if (a[i]<>'') then
                                        inc(dem);
                        for i:=1 to d1 do
                                if (b[i]<>'') then
                                        inc(dem1);
                        if (dem div 2)<(dem1 div 2) then
                                begin
                                        max2:=dem div 2;
                                        for i:=1 to d do
                                                c2[i]:=a[i];
                                end
                        else
                                begin
                                        max2:=dem1 div 2;
                                        for i:=1 to d1 do
                                                c2[i]:=b[i];
                                end;
                end;
        { ----------------------------------------------------------------}
        if ((max1 < max2)and(max1>0))or(max2=0) then
                begin
                        lon:=max1;
                        for i:=1 to length(s)-1 do
                                c[i]:=c1[i];
                end
        else
                begin
                        lon:=max2;
                        for i:=1 to length(s)-1 do
                                c[i]:=c2[i];
                end;
         if ((length(s)-1-(n-1))<(n-1))or(pos('11',s)=0) then
                writeln('-1')
         else
                begin
                        writeln('doi cho ',lon,' vi tri');
                        for i:=1 to length(s)-1 do
                                if c[i]<>'' then
                                        for j:=i to length(s)-1 do
                                                if (c[j]<>'')and(c[j]<>c[i]) then
                                                        begin
                                                                write(i,';',j,'  ');
                                                                c[i]:='';
                                                                c[j]:='';
                                                        end;
                end;
        readln;
END.
