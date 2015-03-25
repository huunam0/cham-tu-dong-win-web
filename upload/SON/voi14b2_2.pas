VAR f:TEXT;
    a,b,n,kqmin:LONGINT;
    dtung,dtruc,doantung,doantruc,d:ARRAY[0..300001] OF LONGINT;
    w:ARRAY[0..300001] OF BYTE;

PROCEDURE sx(q,e:LONGINT);
VAR tam,x,dau,cuoi:LONGINT;
BEGIN
    dau:=q;
    cuoi:=e;
    x:=d[(dau+cuoi) DIV 2];
    REPEAT
        WHILE d[dau]<x DO inc(dau);
        WHILE d[cuoi]>x DO dec(cuoi);
        IF dau<=cuoi THEN
            BEGIN
                tam:=d[dau];
                d[dau]:=d[cuoi];
                d[cuoi]:=tam;
                tam:=w[dau];
                w[dau]:=w[cuoi];
                w[cuoi]:=tam;
                inc(dau);
                dec(cuoi);
            END;
    UNTIL dau>cuoi;
    IF dau<e THEN sx(dau,e);
    IF cuoi>q THEN sx(q,cuoi);
END;                        

PROCEDURE nhap;
VAR i,q,demtung,demtruc:LONGINT;
BEGIN
    assign(f,fi); reset(F);
    readln(f,n,a,b);
    demtung:=0;
    demtruc:=0;
    FOR i:=1 TO n DO readln(f,d[i],w[i]);
    sx(1,n);
    FOR i:=1 TO n DO
        BEGIN
            CASE w[i] OF
                1:BEGIN inc(demtung);dtung[demtung]:=d[i];END;
                2:BEGIN inc(demtruc);dtruc[demtruc]:=d[i];END;
            END;
        END;
END;

PROCEDURE xuli;
VAR demtung,demtruc,i:LONGINT;
BEGIN
    demtung:=0;
    demtruc:=0;
    FOR i:=1 TO n DO
    CASE w[i] OF
      1:
        BEGIN
          inc(demtung);
          IF demtung<a THEN doantung[i]:=100000002
          ELSE doantung[i]:=dtung[demtung]-dtung[demtung-a+1];
          doantruc[i]:=doantruc[i-1]+d[i]-d[i-1];
        END;
      2:
        BEGIN
          inc(demtruc);
          IF demtruc<b THEN doantruc[i]:=100000002
          ELSE doantruc[i]:=dtruc[demtruc]-dtruc[demtruc-b+1];
          doantung[i]:=doantung[i-1]+d[i]-d[i-1];
        END;
      END;
END;

FUNCTION max(q,w:LONGINT):LONGINT;
BEGIN
    IF q>w THEN exit(q) ELSE exit(w);
END;

PROCEDURE ghinghiem;
VAR q,i:LONGINT;
BEGIN
    assign(f,fo);rewrite(F);
    kqmin:=100000002;
    FOR i:=a+b TO n DO
      BEGIN
        q:=max(doantung[i],doantruc[i]);
        IF kqmin>q THEN kqmin:=q;
      END;
    IF kqmin=100000002 THEN writeln(f,-1)
    ELSE writeln(f,kqmin);
    close(F);
END;

BEGIN
    nhap;
    xuli;
    ghinghiem;
END.
